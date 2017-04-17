<%@ taglib prefix="spr_c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Admin Managment</title>
    <link rel="stylesheet" type="text/css"
          href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="<spr_c:url value="/css/index.css"/>">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>

    <style>
        .col-xs-4 {
            text-align: center;
        }
    </style>
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
            <a href="index.html" class="navbar-brand">HOSTEL&trade;</a>
        </div>
        <div id="nbC" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><img src="img/admin.png" class="img-circle" style="width: 43px; height: 43px; margin-top: 4px"></li>
                <li><a href="#">Admin</a></li>
                <li style="margin-top: 6px"><a href="/" type="submit" class="the_lame_button plavno1">Sign Out</a></li>
            </ul>
            <div class="navbar-form navbar-right">
                <a href="#" type="submit" class="btn btn-success">EN</a>
                <a href="#" type="submit" class="btn btn-success" style="margin-right: 240px">BY</a>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron">
    <div class="container" style="text-align: center">
        <h2 style="margin-bottom: 50px"><i class="fa fa-arrow-down"></i> Choose your managment <i
                class="fa fa-arrow-down"></i></h2>
    </div>
    <div class="container" style="margin-top: 20px">
        <div class="row">
            <div class="col-xs-4">
                <a href="/admin-rooms" class="btn btn-success btn-lg">Rooms Managment</a>
            </div>
            <div class="col-xs-4">
                <a href="/admin-users" class="btn btn-success btn-lg">Users Managment</a>
            </div>
            <div class="col-xs-4">
                <a href="/admin-orders" class="btn btn-success btn-lg">Orders Managment</a>
            </div>
        </div>
    </div>
</div>

<div id="content">
    <h2 style="text-align: center; padding: 0 10px 20px 10px">Add new Room</h2>
    <div class="container" style="padding: 0 10px 20px 10px">
        <table class="table">
            <thead>
            <tr>
                <th>Room Number</th>
                <th>Place(-s)</th>
                <!-- <th>OrderStatus</th> -->
                <th>Price &#36;</th>
                <th>M. Buttons</th>
            </tr>
            </thead>
            <tbody>
            <spring:form method="post" modelAttribute="roomJSP" action="add-room" class="form-horizontal">
                <tr>
                    <td>
                        <div class="form-group">
                            <spring:input path="roomNumber" class="form-control" id="check1" type="number"
                                          placeholder="Room Number" name="id" min="1" required="required"/>
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <spring:input path="roomPlaces" class="form-control" id="check2" type="number"
                                          placeholder="Places" name="number" min="1" max="12" required="required"/>
                        </div>
                    </td>

                    <td>
                        <div class="form-group">
                            <spring:input path="price" class="form-control" id="check4" type="number"
                                          placeholder="Total Price" name="money" min="1" step="0.01"
                                          required="required"/>
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <div class="col-xs-offset-3 col-xs-2">
                                <spring:button type="submit" class="btn btn-success">ADD</spring:button>
                            </div>
                        </div>
                    </td>
                </tr>
            </spring:form>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>


