package com.epam.hostel.controller.command.admin.delete;


import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class DeleteUser {
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping(value = "/user-delete")
    public String addRoom(@ModelAttribute("userJSP") User user, @RequestParam("id") Long id) throws ServiceException {
        user.setId(id);
        long userId = Long.parseLong(String.valueOf(id));
        userService.delete(userId);
        userService.findAll();
        return "redirect:/admin-users";
    }
}
