<%@ taglib prefix="spr_c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
            <a href="/" class="navbar-brand">HOSTEL&trade;</a>
        </div>
        <div id="nbC" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><img src="img/admin.png" class="img-circle" style="width: 43px; height: 43px; margin-top: 4px"></li>
                <li><a href="#">${userJSP.name}</a></li>
                <li style="margin-top: 6px"><a href="/" type="submit" class="the_lame_button plavno1">Sign
                    Out</a></li>
            </ul>
            <div class="navbar-form navbar-left" style="color: #eeeeee">
                Welcome,${userJSP.name} ${userJSP.surname}!
            </div>
            <div class="navbar-form navbar-right">
                <a href="#" type="submit" class="btn btn-success">EN</a>
                <a href="#" type="submit" class="btn btn-success" style="margin-right: 240px">BY</a>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron">
    <div class="container" style="text-align: center">
        <h2 style="margin-bottom: 50px">Welcome to your account,<br>
            ${userJSP.name} ${userJSP.surname}!</h2>
    </div>
    <div class="container" style="text-align: center">
        <h2 style="margin-bottom: 50px"><i class="fa fa-arrow-down"></i> Choose your managment <i
                class="fa fa-arrow-down"></i></h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xs-4">
                <a href="/admin-rooms" class="btn btn-success btn-lg">Rooms Managment</a>
            </div>
            <div class="col-xs-4">
                <%--<a href="/admin-users" class="btn btn-success btn-lg">Users Managment</a>--%>
                <a href="/admin-users" class="btn btn-success btn-lg">Users Managment</a>
            </div>
            <div class="col-xs-4">
                <a href="/admin-orders" class="btn btn-success btn-lg">Orders Managment</a>
            </div>
        </div>
    </div>
</div>

<div id="content">
    <h2 style="text-align: center; padding: 0 10px 20px 10px">Users Managment</h2>
    <div class="container" style="padding: 0 10px 20px 10px">
        <table class="table">
            <thead>
            <tr>
                <th>Client</th>
                <th>Login</th>
                <th>Password</th>
                <th>Ban</th>
                <th>M. Buttons</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><a href="#">${user.name} ${user.surname}</a></td>
                    <td>${user.login}</td>
                    <td>${user.password}</td>
                    <td>${user.userStatus}</td>
                    <td>
                        <div class="btn-group">
                            <a href="/user-delete" class="btn btn-danger">DEL</a>
                            <a href="#" class="btn btn-warning">EDIT</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div style="padding: 5px 57px 0 0">
            <a href="/show-add-user" class="btn btn-success pull-right">Add New User</a>
        </div>
    </div>
</div>

<!-- PAGINATION-->
<div id="pagination">
    <c:url value="/admin-users" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/admin-users" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/admin-users" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>

<jsp:include page="../common/footer.jsp"/>
