package com.epam.hostel.controller.command.admin.show;

import com.epam.hostel.model.user.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShowAddUser {
    private static final String ADD_USER_PAGE = "admin/addNewUser";

    @RequestMapping(value = "/show-add-user")
    public ModelAndView addRoom(@ModelAttribute("userJSP") User user) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(ADD_USER_PAGE);
        modelAndView.addObject("roomJSP", user);

        return modelAndView;
    }
}
