package com.epam.hostel.controller;


import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes(value = "userJSP")

public class StartPage {

    private static final String START_PAGE = "startPage";

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView startPage(@ModelAttribute("userJSP") User user) throws ServiceException {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userJSP", new User());
        modelAndView.setViewName(START_PAGE);
        return modelAndView;
    }

    @ModelAttribute("userJSP")
    public User createUser() {
        return new User();
    }
}


