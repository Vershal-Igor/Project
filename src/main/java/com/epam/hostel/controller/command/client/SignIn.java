package com.epam.hostel.controller.command.client;


import com.epam.hostel.model.user.Role;
import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SignIn {
    @Autowired
    private UserServiceImpl userService;

    private static final String CLIENT_PAGE = "client/client";
    private static final String ADMIN_PAGE = "admin/adminUsers";

    @RequestMapping(value = "/sign-in")
    public ModelAndView signIn(@ModelAttribute("userJSP") User user, @RequestParam("login") String login,
                               @RequestParam("password") String password)
            throws ServiceException {
        user = new User();

        user.setLogin(login);
        user.setPassword(password);

        //int recordCount = userDAO.checkUser(user);
        //if (recordCount == 0) {
        //throw new NoEntityException("there is no entity with such data");
        //} else {
        //return userDAO.getUserInf(user);
        //}
        User authUser = userService.signIn(user);

        ModelAndView modelAndView = new ModelAndView();

        if (authUser.getRole().equals(Role.CLIENT)) {  //как настроить сессию? @SessionAttributes("person")
            modelAndView.setViewName(CLIENT_PAGE);
            //modelAndView.addObject("userJSP", user);
            modelAndView.addObject("userJSP", authUser);
            return modelAndView;
            //return "redirect:/client";
        } else {
            modelAndView.setViewName(ADMIN_PAGE);
            modelAndView.addObject("userJSP", user);
            modelAndView.addObject("userJSP", authUser);
            return modelAndView;
            //return "redirect:/admin-users";
        }
    }

    // }


}
