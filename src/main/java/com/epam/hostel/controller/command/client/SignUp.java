package com.epam.hostel.controller.command.client;

import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignUp {
    @Autowired
    private UserServiceImpl userService;

    private static final String CLIENT_PAGE = "client/client";

    @RequestMapping(value = "/sign-up")
    public ModelAndView signUp(@RequestParam("name") String name, @RequestParam("surname") String surname,
                               @RequestParam("login") String login, @RequestParam("password") String password)
            throws ServiceException {
        User user = new User();

        user.setName(name);
        user.setSurname(surname);
        user.setLogin(login);
        user.setPassword(password);

        userService.signUp(user);

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName(CLIENT_PAGE);
        modelAndView.addObject("userJSP", user);
        return modelAndView;

    }
}
