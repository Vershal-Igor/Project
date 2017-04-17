<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spr_c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Client page</title>
    <link rel="stylesheet" type="text/css"
          href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="<spr_c:url value='css/bootstrap-datetimepicker.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<spr_c:url value="/css/index.css"/>">
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!--  CSS widget "Bootstrap datetimepicker" -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

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

    <!-- FAVICON -->
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
            <ul class="nav navbar-nav navbar-right">
                <li><img src="img/client.png" class="img-circle" style="width: 43px; height: 43px; margin-top: 4px">
                </li>
                <li><a href="#">${userJSP.name} ${userJSP.surname}</a></li>
                <li style="margin-top: 6px"><a href="/" type="submit" class="the_lame_button plavno1">Sign
                    Out</a></li>
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
        <h2 style="margin-bottom: 50px">Welcome to your account,<br>
            ${userJSP.name} ${userJSP.surname}!</h2>
    </div>

    <hr>

    <div class="container" style="margin-top: 50px">
        <div class="row">
            <div class="col-xs-6">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="datetimepicker1">Check in Date: </label>
                        <div class="col-xs-6">
                            <div class="input-group date" id="datetimepicker1">
                                <input type="text" class="form-control" placeholder="Check in Date:" name="dateIn"
                                       required="required"/>
                                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                  </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="datetimepicker2">Check out Date: </label>
                        <div class="col-xs-6">
                            <div class="input-group date" id="datetimepicker2">
                                <input type="text" class="form-control" placeholder="Check out Date:" name="dateOut"
                                       required="required"/>
                                <span class="input-group-addon">
                  <span class="glyphicon glyphicon-calendar"></span>
                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="check3">Guests: </label>
                        <div class="col-xs-6">
                            <input class="form-control" id="check3" type="number" placeholder="guest's number"
                                   name="number" min="1" max="9" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-offset-3 col-xs-2">
                            <input type="submit" class="btn btn-success" value="Show existence">
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-xs-6">
                <ul class="list-unstyled pull-right" style="font-size: 150%">
                    <li><a href="tel: +375291234567">&#9742; +375 (29) 123-45-67</a></li>
                    <li>&#9993; <a href="mailto:hostelTravelBelarus@gmail.com">hostelTravelBelarus@gmail.com</a></li>
                    <li><a href="skype:HostelTravel">HostelTravel</a></li>
                    <li>Address: Belarus, Minsk, Kuprevicha street, 8</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div id="content">
    <h2 style="text-align: center; padding: 0 10px 20px 10px">History order</h2>
    <div class="container" style="padding: 0 10px 20px 10px">
        <table class="table">
            <thead>
            <tr>
                <th>Data</th>
                <th>Place(-s)</th>
                <th>Status</th>
                <th>Sale</th>
                <th>Total price</th>
                <th>Type of pay</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${historyOrders}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.user}</td>
                    <td style="width: 30%">${order.arrivalDate}<br>${order.departureDate}</td>
                    <td>${order.roomId}</td>
                    <td>${order.placesAmount}</td>
                    <td>${order.payType}</td>
                    <td>${order.discount}</td>
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
           <%-- <tr>
                <td>12.02.2017<br>13.02.2017</td>
                <td>3</td>
                <td>new</td>
                <td></td>
                <td>50$</td>
                <td>booking</td>
                <td>
                    <div class="btn-group">
                        <a href="#" class="btn btn-danger">DEL</a>
                        <a href="#" class="btn btn-warning">ARCHIVED</a>
                    </div>
                </td>
            </tr>--%>
            <%--<tr>
                <td>12.02.2017<br>13.02.2017</td>
                <td>3</td>
                <td>new</td>
                <td></td>
                <td>50$</td>
                <td>booking</td>
                <td>
                    <div class="btn-group">
                        <a href="#" class="btn btn-danger">DEL</a>
                        <a href="#" class="btn btn-warning">ARCHIVED</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td>15.02.2018<br>19.02.2018</td>
                <td>6</td>
                <td>confirm</td>
                <td>5%</td>
                <td>66.5%</td>
                <td>complete pay</td>
                <td>
                    <div class="btn-group">
                        <a href="#" class="btn btn-danger">DEL</a>
                        <a href="#" class="btn btn-warning">ARCHIVED</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td>14.01.2018<br>19.01.2018</td>
                <td>2</td>
                <td>reject</td>
                <td></td>
                <td>33$</td>
                <td>booking</td>
                <td>
                    <div class="btn-group">
                        <a href="#" class="btn btn-danger">DEL</a>
                        <a href="#" class="btn btn-warning">ARCHIVED</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td>01.01.2013<br>22.01.2013</td>
                <td>4</td>
                <td>archive</td>
                <td>5%</td>
                <td>20$</td>
                <td>complete pay</td>
                <td>
                    <div class="btn-group">
                        <a href="#" class="btn btn-danger">DEL</a>
                        <a href="#" class="btn btn-warning">ARCHIVED</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td>22.02.2012<br>01.03.2012</td>
                <td>4</td>
                <td>archive</td>
                <td>3%</td>
                <td>22$</td>
                <td>booking</td>
                <td>
                    <div class="btn-group">
                        <a href="#" class="btn btn-danger">DEL</a>
                        <a href="#" class="btn btn-warning">ARCHIVED</a>
                    </div>
                </td>
            </tr>--%>
            </tbody>
        </table>
        <!-- <div style="padding: 5px 57px 0 0">
            <a href="#" class="btn btn-success pull-right">Create new order</a>
        </div> -->
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>

