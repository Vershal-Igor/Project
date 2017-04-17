<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spr_c" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Payment</title>
    <link rel="stylesheet" type="text/css"
          href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="<spr_c:url value="/css/index.css"/>">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>

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
            <a href="/" class="navbar-brand">HOSTEL&trade;</a>
        </div>
        <div id="nbC" class="collapse navbar-collapse">
            <div class="navbar-form navbar-right">
                <a href="#" type="submit" class="btn btn-success">EN</a>
                <a href="#" type="submit" class="btn btn-success" style="margin-right: 540px">BY</a>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron">

    <div class="container" style="text-align: center">
        <h2 style="margin-bottom: 20px">Your Details</h2>
    </div>

    <div class="row">
        <div class="panel-group col-xs-offset-2 col-xs-4" style="padding: 10px">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: center">
                        <a href="#signup1" data-toggle="collapse" style="text-decoration: none">Sign Up</a>
                    </h3>
                </div>
                <div class="panel-collapse collapse" id="signup1">
                    <div class="panel-body">
                        <spring:form method="post" modelAttribute="userJSP" action="sign-up" style="margin-top: 10px"
                                     id="signUp">
                            <div class="form-group">
                                <div class="row" style="padding: 0 10px 10px 10px">
                                    <label class="col-xs-2 control-label" for="inputsignup1">Name: </label>
                                    <div class="col-xs-4">
                                        <spring:input path="name" type="text" class="form-control" placeholder="Name"
                                                      id="inputsignup1"
                                                      required="required" style="margin-left: -18px"/>
                                    </div>
                                    <label class="col-xs-2 control-label" for="inputsignup2">Surname: </label>
                                    <div class="col-xs-4">
                                        <spring:input path="surname" type="text" class="form-control"
                                                      placeholder="Surname" id="inputsignup2"
                                                      required="required"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row" style="padding: 0 10px 0 10px">
                                    <label class="col-xs-2 control-label" for="inputsignup3">Login: </label>
                                    <div class="col-xs-4">
                                        <spring:input path="login" type="text" class="form-control" placeholder="Login"
                                                      id="inputsignup3"
                                                      required="required" style="margin-left: -18px"/>
                                    </div>
                                    <label class="col-xs-2 control-label" for="inputsignup4">Password: </label>
                                    <div class="col-xs-4">
                                        <spring:input path="password" class="form-control" placeholder="Password"
                                                      id="inputsignup4" required="required"/>
                                    </div>
                                    <div class="col-xs-3" style="margin-top: 20px">
                                        <div class="form-group">
                                            <div class="col-xs-offset-3 col-xs-2">
                                                <input type="submit" class="btn btn-success" value="Sign up">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </spring:form>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel-group col-xs-4" style="padding: 10px">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title" style="text-align: center">
                        <a href="#signup2" data-toggle="collapse">Sign In</a>
                    </h3>
                </div>
                <div class="panel-collapse collapse" id="signup2">
                    <div class="panel-body">
                        <spring:form method="post" modelAttribute="userJSP" action="sign-in" style="margin-top: 10px"
                                     id="signIn">
                            <div class="form-group">
                                <div class="row" style="padding: 0 10px 10px 10px">
                                    <label class="col-xs-2 control-label" for="login">Login: </label>
                                    <div class="col-xs-4">
                                        <spring:input path="login" type="text" class="form-control" placeholder="Login"
                                                      id="login"
                                                      required="required" style="margin-left: -18px"/>
                                    </div>
                                    <label class="col-xs-2 control-label" for="password">Password: </label>
                                    <div class="col-xs-4">
                                        <spring:input path="password" type="password" class="form-control"
                                                      placeholder="Password"
                                                      id="password" required="required"/>
                                    </div>
                                    <div class="col-xs-3" style="margin-top: 20px">
                                        <div class="form-group">
                                            <div class="col-xs-offset-3 col-xs-2">
                                                <input type="submit" class="btn btn-success" value="Sign in">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </spring:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <hr>

    <div class="container" style="text-align: center">
        <h2 style="margin-bottom: 20px">Payment Details</h2>

        <form>
            <div class="form-group">
                <div class="row" style="padding: 20px; font-size: 135%">
                    <label class="radio-inline col-xs-offset-3 col-xs-3">
                        <input type="radio" name="payment" value="pay1">Compleate Payment
                    </label>
                    <label class="radio-inline col-xs-3">
                        <input type="radio" name="payment" value="pay2">Booking
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-3" style="margin-left: 210px; font-size: 130%; color: orange">
                    TOTAL: <span></span>
                </div>
                <div class="col-xs-3" style="margin-left: 70px">
                    <a href="client.html" class="btn btn-success">Confirm</a>
                </div>
            </div>
        </form>

    </div>

</div>

<br>

<jsp:include page="common/footer.jsp"/>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/validation2.js"></script>


