package com.epam.hostel.controller.command.admin;

import com.epam.hostel.model.order.Order;
import com.epam.hostel.model.room.Room;
import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.impl.OrderServiceImpl;
import com.epam.hostel.service.impl.RoomServiceImpl;
import com.epam.hostel.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminManagment {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private RoomServiceImpl roomService;
    @Autowired
    private OrderServiceImpl orderService;

    private static final String ADMIN_ORDERS_PAGE = "admin/adminOrders";
    private static final String ADMIN_USERS_PAGE = "admin/adminUsers";
    private static final String ADMIN_ROOMS_PAGE = "admin/adminRooms";

    @RequestMapping(value = "/admin-orders")
    public ModelAndView listOfOrders(@RequestParam(required = false) Integer page) throws ServiceException {
        ModelAndView modelAndView = new ModelAndView(ADMIN_ORDERS_PAGE);
        List<Order> orders = orderService.findAll();
        PagedListHolder<Order> pagedListHolder = new PagedListHolder<>(orders);
        pagedListHolder.setPageSize(5);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) page = 1;

        modelAndView.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("orders", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("orders", pagedListHolder.getPageList());
        }

        return modelAndView;
    }

    @RequestMapping(value = "/admin-users")
    public ModelAndView listOfUsers(@RequestParam(required = false) Integer page) throws ServiceException {
        ModelAndView modelAndView = new ModelAndView(ADMIN_USERS_PAGE);

        List<User> users = userService.findAll();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(users);
        pagedListHolder.setPageSize(5);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) page = 1;

        modelAndView.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }

        return modelAndView;
    }

    @RequestMapping(value = "/admin-rooms")
    public ModelAndView listOfRooms(@RequestParam(required = false) Integer page) throws ServiceException {
        ModelAndView modelAndView = new ModelAndView(ADMIN_ROOMS_PAGE);

        List<Room> rooms = roomService.findAll();
        PagedListHolder<Room> pagedListHolder = new PagedListHolder<>(rooms);
        pagedListHolder.setPageSize(5);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) page = 1;

        modelAndView.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("rooms", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("rooms", pagedListHolder.getPageList());
        }

        return modelAndView;
    }
}
