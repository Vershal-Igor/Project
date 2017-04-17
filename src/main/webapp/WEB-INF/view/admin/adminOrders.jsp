<%@ taglib prefix="spr_c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h2 style="text-align: center; padding: 0 10px 20px 10px">Orders Managment</h2>
    <div class="container" style="padding: 0 10px 20px 10px">
        <table class="table">
            <thead>
            <tr>
                <th>№ Order</th>
                <th>Client</th>
                <th>Data</th>
                <th>№ Room</th>
                <th>Pay Type</th>
                <th>Discount%</th>
                <th>Final price&#36;</th>
                <th>Status</th>
                <th>M. Buttons</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td><a href="#">${order.user}</a></td>
                    <td style="width: 30%">${order.arrivalDate}<br>${order.departureDate}</td>
                    <td><a href="#">${order.roomId}</a></td>
                    <td>${order.payType}</td>
                    <td>${order.discount}</td>
                    <td>${order.finalPrice}</td>
                    <td>${order.orderStatus}</td>
                    <td style="width: 50%">
                        <div class="btn-group btn-group-sm">
                            <a href="#" class="btn btn-danger">DEL</a>
                            <a href="#" class="btn btn-warning">EDIT</a>
                            <a href="#" class="btn btn-success">UPDATE</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            <%--<tr>
                <td>1</td>
                <td>Ivan Golovach</td>
                <td>12.02.2017<br>13.02.2017</td>
                <td>1</td>
                <td>2</td>
                <td>complete</td>
                <td>
                    <div class="form-group">
                        <input class="form-control" id="check1" type="number" placeholder="discount" name="number"
                               min="1" max="100">
                    </div>
                </td>
                <td>
                    <div class="col-xs-offset-3 col-xs-2">
                        <input type="submit" class="btn btn-success" value="confirm">
                    </div>
                </td>
                <td style="width: 100%">
                    <div class="btn-group btn-group-sm">
                        <a href="#" class="btn btn-danger">DEL</a>
                        <a href="#" class="btn btn-warning">EDIT</a>
                        <a href="#" class="btn btn-success">UPDATE</a>
                    </div>
                </td>
            </tr>--%>
            </tbody>
        </table>
    </div>
</div>

<div id="pagination">
    <c:url value="/admin-orders" var="prev">
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
                <c:url value="/admin-orders" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/admin-orders" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>

<jsp:include page="../common/footer.jsp"/>

