package com.epam.hostel.controller.command.admin.addNew;

import com.epam.hostel.dao.exception.DAOException;
import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class AddNewUser {
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping(value = "/add-user")
    public String addUser(@RequestParam("name") String name, @RequestParam("surname") String surname,
                          @RequestParam("login") String login, @RequestParam("password") String password)
            throws ServiceException, DAOException {
        User user = new User();

        user.setName(name);
        user.setSurname(surname);
        user.setLogin(login);
        user.setPassword(password);

        userService.add(user);

        return "redirect:/admin-users";
    }
}
