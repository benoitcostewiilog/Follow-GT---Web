<?php
// auto-generated by sfViewConfigHandler
// date: 2019/01/18 11:18:13
$response = $this->context->getResponse();

if ($this->actionName.$this->viewName == 'signinSuccess')
{
  $templateName = sfConfig::get('symfony.view.'.$this->moduleName.'_'.$this->actionName.'_template', $this->actionName);
  $this->setTemplate($templateName.$this->viewName.$this->getExtension());
}
else if ($this->actionName.$this->viewName == 'editPasswordSuccess')
{
  $templateName = sfConfig::get('symfony.view.'.$this->moduleName.'_'.$this->actionName.'_template', $this->actionName);
  $this->setTemplate($templateName.$this->viewName.$this->getExtension());
}
else
{
  $templateName = sfConfig::get('symfony.view.'.$this->moduleName.'_'.$this->actionName.'_template', $this->actionName);
  $this->setTemplate($templateName.$this->viewName.$this->getExtension());
}

if ($templateName.$this->viewName == 'signinSuccess')
{
  if (null !== $layout = sfConfig::get('symfony.view.'.$this->moduleName.'_'.$this->actionName.'_layout'))
  {
    $this->setDecoratorTemplate(false === $layout ? false : $layout.$this->getExtension());
  }
  else
  {
    $this->setDecoratorTemplate('' == '' ? false : ''.$this->getExtension());
  }
  $response->addHttpMeta('content-type', 'text/html', false);

  $response->addStylesheet('animate.css', '', array ());
  $response->addStylesheet('bootstrap.min.css', '', array ());
  $response->addStylesheet('plugins/toastr/toastr.min.css', '', array ());
  $response->addStylesheet('style.css', '', array ());
  $response->addStylesheet('font-awesome/css/font-awesome.css', '', array ());
  $response->addStylesheet('fonts/HelveticaNeueLTCom-UltLt.ttf', '', array ());
  $response->addStylesheet('recherche.css', '', array ());
  $response->addStylesheet('plugins/dataTables/dataTables.bootstrap.css', '', array ());
  $response->addStylesheet('plugins/dataTables/dataTables.responsive.css', '', array ());
  $response->addStylesheet('plugins/dataTables/dataTables.tableTools.min.css', '', array ());
  $response->addStylesheet('plugins/contextMenu/jquery.contextMenu.css', '', array ());
  $response->addStylesheet('plugins/iCheck/blue.css', '', array ());
  $response->addStylesheet('plugins/chosen/chosen.css', '', array ());
  $response->addJavascript('jquery-2.1.1.js', '', array ());
  $response->addJavascript('bootstrap.min.js', '', array ());
  $response->addJavascript('plugins/metisMenu/jquery.metisMenu.js', '', array ());
  $response->addJavascript('plugins/slimscroll/jquery.slimscroll.min.js', '', array ());
  $response->addJavascript('inspinia.js', '', array ());
  $response->addJavascript('plugins/pace/pace.min.js', '', array ());
  $response->addJavascript('modules/default/utils.js', '', array ());
  $response->addJavascript('plugins/dataTables/jquery.dataTables.js', '', array ());
  $response->addJavascript('plugins/dataTables/dataTables.bootstrap.js', '', array ());
  $response->addJavascript('plugins/dataTables/dataTables.responsive.js', '', array ());
  $response->addJavascript('plugins/dataTables/dataTables.tableTools.min.js', '', array ());
  $response->addJavascript('plugins/contextMenu/jquery.contextmenu.js', '', array ());
  $response->addJavascript('plugins/iCheck/icheck.min.js', '', array ());
  $response->addJavascript('plugins/chosen/chosen.jquery.js', '', array ());
}
else if ($templateName.$this->viewName == 'editPasswordSuccess')
{
  if (null !== $layout = sfConfig::get('symfony.view.'.$this->moduleName.'_'.$this->actionName.'_layout'))
  {
    $this->setDecoratorTemplate(false === $layout ? false : $layout.$this->getExtension());
  }
  else
  {
    $this->setDecoratorTemplate('' == '' ? false : ''.$this->getExtension());
  }
  $response->addHttpMeta('content-type', 'text/html', false);

  $response->addStylesheet('animate.css', '', array ());
  $response->addStylesheet('bootstrap.min.css', '', array ());
  $response->addStylesheet('plugins/toastr/toastr.min.css', '', array ());
  $response->addStylesheet('style.css', '', array ());
  $response->addStylesheet('font-awesome/css/font-awesome.css', '', array ());
  $response->addStylesheet('fonts/HelveticaNeueLTCom-UltLt.ttf', '', array ());
  $response->addStylesheet('recherche.css', '', array ());
  $response->addStylesheet('plugins/dataTables/dataTables.bootstrap.css', '', array ());
  $response->addStylesheet('plugins/dataTables/dataTables.responsive.css', '', array ());
  $response->addStylesheet('plugins/dataTables/dataTables.tableTools.min.css', '', array ());
  $response->addStylesheet('plugins/contextMenu/jquery.contextMenu.css', '', array ());
  $response->addStylesheet('plugins/iCheck/blue.css', '', array ());
  $response->addStylesheet('plugins/chosen/chosen.css', '', array ());
  $response->addJavascript('jquery-2.1.1.js', '', array ());
  $response->addJavascript('bootstrap.min.js', '', array ());
  $response->addJavascript('plugins/metisMenu/jquery.metisMenu.js', '', array ());
  $response->addJavascript('plugins/slimscroll/jquery.slimscroll.min.js', '', array ());
  $response->addJavascript('inspinia.js', '', array ());
  $response->addJavascript('plugins/pace/pace.min.js', '', array ());
  $response->addJavascript('modules/default/utils.js', '', array ());
  $response->addJavascript('plugins/dataTables/jquery.dataTables.js', '', array ());
  $response->addJavascript('plugins/dataTables/dataTables.bootstrap.js', '', array ());
  $response->addJavascript('plugins/dataTables/dataTables.responsive.js', '', array ());
  $response->addJavascript('plugins/dataTables/dataTables.tableTools.min.js', '', array ());
  $response->addJavascript('plugins/contextMenu/jquery.contextmenu.js', '', array ());
  $response->addJavascript('plugins/iCheck/icheck.min.js', '', array ());
  $response->addJavascript('plugins/chosen/chosen.jquery.js', '', array ());
}
else
{
  if (null !== $layout = sfConfig::get('symfony.view.'.$this->moduleName.'_'.$this->actionName.'_layout'))
  {
    $this->setDecoratorTemplate(false === $layout ? false : $layout.$this->getExtension());
  }
  else if (null === $this->getDecoratorTemplate() && !$this->context->getRequest()->isXmlHttpRequest())
  {
    $this->setDecoratorTemplate('' == 'layout' ? false : 'layout'.$this->getExtension());
  }
  $response->addHttpMeta('content-type', 'text/html', false);

  $response->addStylesheet('animate.css', '', array ());
  $response->addStylesheet('bootstrap.min.css', '', array ());
  $response->addStylesheet('plugins/toastr/toastr.min.css', '', array ());
  $response->addStylesheet('style.css', '', array ());
  $response->addStylesheet('font-awesome/css/font-awesome.css', '', array ());
  $response->addStylesheet('fonts/HelveticaNeueLTCom-UltLt.ttf', '', array ());
  $response->addStylesheet('recherche.css', '', array ());
  $response->addStylesheet('plugins/dataTables/dataTables.bootstrap.css', '', array ());
  $response->addStylesheet('plugins/dataTables/dataTables.responsive.css', '', array ());
  $response->addStylesheet('plugins/dataTables/dataTables.tableTools.min.css', '', array ());
  $response->addStylesheet('plugins/contextMenu/jquery.contextMenu.css', '', array ());
  $response->addStylesheet('plugins/iCheck/blue.css', '', array ());
  $response->addStylesheet('plugins/chosen/chosen.css', '', array ());
  $response->addJavascript('jquery-2.1.1.js', '', array ());
  $response->addJavascript('bootstrap.min.js', '', array ());
  $response->addJavascript('plugins/metisMenu/jquery.metisMenu.js', '', array ());
  $response->addJavascript('plugins/slimscroll/jquery.slimscroll.min.js', '', array ());
  $response->addJavascript('inspinia.js', '', array ());
  $response->addJavascript('plugins/pace/pace.min.js', '', array ());
  $response->addJavascript('modules/default/utils.js', '', array ());
  $response->addJavascript('plugins/dataTables/jquery.dataTables.js', '', array ());
  $response->addJavascript('plugins/dataTables/dataTables.bootstrap.js', '', array ());
  $response->addJavascript('plugins/dataTables/dataTables.responsive.js', '', array ());
  $response->addJavascript('plugins/dataTables/dataTables.tableTools.min.js', '', array ());
  $response->addJavascript('plugins/contextMenu/jquery.contextmenu.js', '', array ());
  $response->addJavascript('plugins/iCheck/icheck.min.js', '', array ());
  $response->addJavascript('plugins/chosen/chosen.jquery.js', '', array ());
}

