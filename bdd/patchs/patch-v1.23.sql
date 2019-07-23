--	Patch base de donnees GtLogistique
--  --------------------------------
--	    Version : patch-v1.23
--	Commentaire : creation fonction calcul de delais 
--  --------------------------------

CREATE TABLE IF NOT EXISTS `holiday_table` (
  `holiday_table_id` int(11) NOT NULL,
  `holiday_date` datetime DEFAULT NULL,
  `week_day` varchar(12) DEFAULT NULL,
  `holiday_name` varchar(45) DEFAULT NULL,
  `Country_codes` varchar(45) NOT NULL DEFAULT 'ALL',
  PRIMARY KEY (`holiday_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SET GLOBAL log_bin_trust_function_creators = 1;  

DELIMITER |

CREATE FUNCTION `workday_time_diff_holiday_table`(  
`param_country` varchar(10), 
`assigneddatetime` varchar(20), 
`closeddatetime` varchar(20), 
`starttime` varchar(20), 
`endtime` varchar(20)
)
    RETURNS int(11)
    LANGUAGE SQL
    NOT DETERMINISTIC
    CONTAINS SQL
    COMMENT ''
BEGIN  
Set @starttime = starttime;  
Set @endtime = endtime;  
Select time_to_sec(timediff(@endtime,@starttime))/3600 into @maxhoursaday;  
Set @assigneddate = assigneddatetime;  
Set @closeddate = closeddatetime;  
Set @timecount = 0;  
Set @timevar1 = @assigneddate;  
Set @nextdate = @assigneddate;  
Set @timevar2 = null;  
Set @param_country = param_country;  

Set @checkstart = null;  
Set @checkend = null;  
Select CONCAT(SUBSTRING_INDEX(@assigneddate, ' ', 1), ' ',@starttime),  
CONCAT(SUBSTRING_INDEX(@closeddate, ' ', 1), ' ',@endtime)  into @checkstart, @checkend;


if (@assigneddate > @checkstart) then  
        if (@closeddate<@checkend) then
            Set @assigneddate = @assigneddate;
            Set @closeddate = @closeddate;
        else
            Set @assigneddate = @assigneddate;
            Set @closeddate = @checkend;
        end if;
    else
        if (@closeddate<@checkend) then
            SET @assigneddate = @checkstart;
            Set @closeddate = @closeddate;
        else
            SET @assigneddate = @checkstart;
            Set @closeddate = @checkend;
        end if;
    end if;


SELECT DATEDIFF(@closeddate, @assigneddate) INTO @fixcount; 
Set @count = @fixcount; 
If @fixcount > 0 then 
    while @count>=0 do 
        select weekday(@nextdate) into @weekday; 



        Select sum(if(date_format(holiday_date,'%Y-%m-%d') = substring_index(@nextdate,' ',1),1,0)) 
        from holiday_table 
        where Country_codes = 'ALL' or instr(Country_codes,@param_country)>0
        into @holidayflag; 
        if ( @weekday<5 and @holidayflag=0) then 
            if (@count = @fixcount) then 
                Set @timevar1 = @assigneddate; 
                SELECT CONCAT(SUBSTRING_INDEX(@assigneddate, ' ', 1), ' ',@endtime) INTO @timevar2;
            elseif (@count = 0) then 
                Select concat(substring_index(@closeddate,' ',1),' ',@starttime) into @timevar1; 
                Set @timevar2 = @closeddate;
            else
                Select concat(@nextdate,' ',@starttime) into @timevar1;
                SELECT CONCAT(@nextdate, ' ', @endtime) INTO @timevar2;
            end if;
    SELECT 
        LEAST(Greatest(((TIME_TO_SEC(TIMEDIFF(@timevar2, @timevar1))) / 3600),0),@maxhoursaday) 
        INTO @timecounttemp;

            Set @timecount = @timecounttemp + @timecount;
        end if;
        Set @timevar1 = @nextdate;
        SELECT 
        ADDDATE(SUBSTRING_INDEX(@timevar1, ' ', 1),1) 
        INTO @nextdate;
        Set @count = @count - 1;
    end while;
else  
    SELECT 
    Least(Greatest(((TIME_TO_SEC(TIMEDIFF(@closeddate, @assigneddate))) / 3600),0),@maxhoursaday) 
    INTO @timecount;
end if;  
RETURN @timecount*60;  
END|  
DELIMITER ;

UPDATE `adm_supervision_parametrage` SET `valeur` = '1.23' WHERE `adm_supervision_parametrage`.`nom` = 'version_BDD' ;