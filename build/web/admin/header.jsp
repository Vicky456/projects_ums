<!DOCTYPE html>
<html lang="en">
<head>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="../asstes/animate.min.css" type="text/css">
  <link rel="stylesheet" href="../asstes/glyphicons.css" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../asstes/material-design-icons.css" type="text/css">
  <link rel="stylesheet" href="../asstes/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="../asstes/app.min.css">
<body class=" pace-done pace-done black" ui-class="black">
<div class="pace  pace-inactive">
  <div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
    <div class="pace-progress-inner"></div>
  </div>
  <div class="pace-activity"></div>
</div>
<div class="app" id="app">

  <div id="aside" class="app-aside modal fade nav-dropdown">
    <!-- fluid app aside -->
    <div class="left navside dark dk" layout="column">
      <div class="navbar no-radius">
        <!-- brand -->
        <a class="navbar-brand">


          <span class="hidden-folded inline">Project UMS</span>
        </a>
        <!-- / brand -->
      </div>
     
        <jsp:include page="nav.jsp"></jsp:include>
        
        
        <%--<jsp:include page="login_nav.jsp"></jsp:include>--%>
    </div>
  </div>

  <div id="content" class="app-content box-shadow-z0" role="main">
    <div class="app-header white box-shadow">
      <div class="navbar">

          <div class="col-sm-6">
              <h4 class="m-b-0 _300" style="margin-top:  16px;">Welcome to Project UMS</h4>
           
          </div>
          
        <!-- navbar right -->
        <ul class="nav navbar-nav pull-right">
          <!--<li class="nav-item dropdown pos-stc-xs">
            <a class="nav-link" href="" data-toggle="dropdown">
              <i class="material-icons">notifications_none</i>
              <span class="label label-sm up warn">3</span>
            </a>

          </li>-->
          <li class="nav-item dropdown" onclick="$(this).toggleClass('open')">
            <a class="nav-link clear" data-toggle="dropdown">
                        <span class="avatar w-32">
                        <img src="../asstes/a0.jpg" alt="...">
                        <i class="on b-white bottom"></i>
                        </span>
            </a>
            <div class="dropdown-menu pull-right dropdown-menu-scale">
               <a class="dropdown-item" ui-sref="access.signin">Sign out</a>
            </div>
          </li>
          <li class="nav-item hidden-md-up">
            <a class="nav-link" data-toggle="collapse" data-target="#collapse">
              <i class="material-icons">?</i>
            </a>
          </li>
        </ul>
        <!-- / navbar right -->
        <!-- navbar collapse -->
        <div class="collapse navbar-toggleable-sm" id="collapse">
          <form class="navbar-form form-inline pull-right pull-none-sm navbar-item v-m" role="search">
            <div class="form-group l-h m-a-0">
              <div class="input-group"><input type="text" class="form-control form-control-sm p-x b-a rounded" placeholder="Search projects..."></div>
            </div>
          </form>

        </div>
        <!-- / navbar collapse -->
      </div>
    </div>

   