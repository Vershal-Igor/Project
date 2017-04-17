<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spr_c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Header</title>
    <link rel="stylesheet" type="text/css"
          href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="<spr_c:url value='css/bootstrap-datetimepicker.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<spr_c:url value="/css/index.css"/>">
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!--  CSS widget "Bootstrap datetimepicker" -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <!-- FAVICON -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
    <!--Skype-->
    <a data-config="commands=*;size=22;status=off;theme=logo;language=ru;bgcolor=#2a92f3" id="skaip-buttons"
       href="http://www.skaip.su/">Skype</a>
    <script src="//apps.skaip.su/buttons/widget/core.min.js" defer="defer"></script>

    <!--DATETIMEPICKER-->
    <!--Script moment-with-locales.min.js for work with dates -->
    <script type="text/javascript" src="js/moment-with-locales.min.js"></script>
    <!--Script "Bootstrap datetimepicker" -->
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>


</head>
<body>
<div class="navbar navbar-inverse navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="submit" data-target="#nbC" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand">HOSTEL&trade;</a>
        </div>
        <spring:form method="post" modelAttribute="userJSP" action="sign-in" id="signIn">
            <div id="nbC" class="collapse navbar-collapse">
                <div class="navbar-form navbar-right">
                    <a href="#" type="submit" class="btn btn-success">EN</a>
                    <a href="#" type="submit" class="btn btn-success" style="margin-right: 80px">BY</a>
                    <spring:input path="login" type="text" id="login" class="form-control" placeholder="Login"
                                  required="required"/>
                    <spring:input path="password" type="password" id="password" class="form-control"
                                  placeholder="Password"
                                  required="required"/>
                    <spring:button type="submit" class="btn btn-success">Sign in</spring:button>
                </div>
            </div>
        </spring:form>
    </div>
</div>
<script type="text/javascript" src="js/validation.js"></script>


