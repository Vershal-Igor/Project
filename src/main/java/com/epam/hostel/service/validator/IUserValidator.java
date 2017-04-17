package com.epam.hostel.service.validator;


import com.epam.hostel.model.user.User;

public interface IUserValidator extends Validator<User> {

    boolean validateLogPass(User user);

    boolean validateNameSurnameLogin(User user);
}
