/*
package com.epam.hostel.validator;


import com.epam.hostel.model.order.Order;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class OrderValidator {
    private static final String REGEX_NUMBERS = "[1-8]{1}";

    public static String checkApplication(Order order) {
        String message = null;
        Matcher placesMatcher;
        Pattern numbersPattern = Pattern.compile(REGEX_NUMBERS);
        if (order != null) {
            placesMatcher = numbersPattern.matcher(Integer.toString(order.getPlacesAmount()));
            if (!placesMatcher.matches()) {
                message = "message.places_error";
            }
            if (order.getDepartureDate().before(order.getArrivalDate())) {
                message = "message.date_error";
            }
        } else {
            message = "message.make_application";
        }
        return message;
    }


}
*/
