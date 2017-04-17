package com.epam.hostel.controller.command.client;

import com.epam.hostel.model.order.Order;
import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.impl.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClientPage {
    @Autowired
    private OrderServiceImpl orderService;

    private static final String CLIENT_PAGE = "client/client";

    @RequestMapping(value = "/history-order")
    public ModelAndView clientPage(@ModelAttribute("userJSP") User user) throws ServiceException {
        return new ModelAndView(CLIENT_PAGE, "historyOrders", orderService.findUserOrder(user.getId()));
    }
}
