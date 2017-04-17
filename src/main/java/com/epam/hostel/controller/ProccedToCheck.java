package com.epam.hostel.controller;

import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProccedToCheck {

    /*@Autowired
    private UserServiceImpl userService;*/

    private static final String PROCCED_PAGE = "payment";

    @RequestMapping(value = "/procced-to-check", method = RequestMethod.GET)
    public ModelAndView startPage() throws ServiceException {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userJSP", new User());
        modelAndView.setViewName(PROCCED_PAGE);
        return modelAndView;
    }
}
