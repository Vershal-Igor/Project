<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<title>Hostel&trade;</title>
<jsp:include page="common/header.jsp"/>

<div class="jumbotron">

    <div class="container" style="text-align: center">
        <h1 style="margin-bottom: 50px">Welcome to our Hostel!</h1>
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
                                   name="numOfClient" min="1" max="15" required="required">
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

<spring:form method="get" modelAttribute="userJSP" action="/procced-to-check" id="payment">
    <!--Расценки на комнаты-->
    <div class="container">

        <h1 style="text-align: center; padding: 10px">FREE ROOMS</h1>

        <table>
            <thead>
            <tr>
                <th>Room type</th>
                <th>Average price per night</th>
                <th>Choose</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Single</td>
                <td>10&#36;</td>
                <td>
                    <input type="radio" name="rb" value="option1" required="required">
                </td>
            </tr>
            <tr>
                <td>Double</td>
                <td>20&#36;</td>
                <td>
                    <input type="radio" name="rb" value="option2">
                </td>
            </tr>
            <tr>
                <td>Tripe</td>
                <td>30&#36;</td>
                <td>
                    <input type="radio" name="rb" value="option3">
                </td>
            </tr>
            <tr>
                <td>4 places room</td>
                <td>40&#36;</td>
                <td>
                    <input type="radio" name="rb" value="option4">
                </td>
            </tr>
            <tr>
                <td>5 places room</td>
                <td>50&#36;</td>
                <td>
                    <input type="radio" name="rb" value="option5">
                </td>
            </tr>
            <tr>
                <td>6 places room</td>
                <td>60&#36;</td>
                <td>
                    <input type="radio" name="rb" value="option6">
                </td>
            </tr>
            <tr>
                <td>7 places room</td>
                <td>70&#36;</td>
                <td>
                    <input type="radio" name="rb" value="option7">
                </td>
            </tr>
            <tr>
                <!--После тотал в спане будет появляться посчитаное значение (с js легко выводится)-->
                <td colspan="3" style="text-align: left; color: orange">
                    TOTAL: <span>&#36;</span>
                </td>
            </tr>

            </tbody>
        </table>


        <input type="submit" class="btn btn-warning pull-right" value="Proceed to checkout" style="margin-bottom: 45px">
            <%--<span class="glyphicon glyphicon-chevron-right"/>--%>

    </div>
</spring:form>

<jsp:include page="common/footer.jsp"/>

