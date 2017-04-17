/*
package com.epam.hostel.validator;




import com.epam.hostel.model.user.User;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegisterValidator {
    private static final String REGEX_LETTERS = "[a-zA-ZА-Яа-я]{2,24}";
    private static final String REGEX_LOGIN = "[\\wА-Яа-я1-9]{4,14}";
    private static final String REGEX_PASSWORD = "[\\wА-Яа-я1-9]{4,12}";

    public static String checkRegistration(User user) {
        String message = null;
        if (user == null) {
            return "message.make_application";
        }
        Pattern lettersPattern = Pattern.compile(REGEX_LETTERS);
        Pattern loginPattern = Pattern.compile(REGEX_LOGIN);
        Pattern passwordPattern = Pattern.compile(REGEX_PASSWORD);

        Matcher loginMatcher = loginPattern.matcher(user.getLogin());
        Matcher passwordMatcher = passwordPattern.matcher(user.getPassword());
        Matcher nameMatcher = lettersPattern.matcher(user.getName());
        Matcher surnameMatcher = lettersPattern.matcher(user.getSurname());

        if (!nameMatcher.matches()) {
            user.setName(null);
            message = "message.wrong_name";
        }
        if (!surnameMatcher.matches() && message == null) {
            user.setSurname(null);
            message = "message.wrong_surname";
        }
        if (!loginMatcher.matches() && message == null) {
            user.setLogin(null);
            message = "message.login_reg_error";
        }
        if (!passwordMatcher.matches() && message == null) {
            user.setPassword(null);
            message = "message.password_error";
        }
        return message;
    }
}
*/
