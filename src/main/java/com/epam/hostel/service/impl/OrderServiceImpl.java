package com.epam.hostel.service.impl;


import com.epam.hostel.dao.OrderDAO;
import com.epam.hostel.dao.exception.DAOException;
import com.epam.hostel.model.order.Order;
import com.epam.hostel.service.IOrderService;
import com.epam.hostel.service.exception.ServiceException;
import org.apache.log4j.Logger;

import java.util.List;

public class OrderServiceImpl implements IOrderService {
    public static Logger log = Logger.getLogger(OrderServiceImpl.class);

    private OrderDAO orderDAO;

    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    @Override
    public List<Order> findAll() throws ServiceException {
        List<Order> orders = null;
        try {

            orders = orderDAO.findAll();

        } catch (DAOException e) {
            throw new ServiceException("error while selecting all order records", e);
        }
        return orders;
    }

    public List<Order> findUserOrder(long userId) throws ServiceException {
        List<Order> orders = null;
        try {

            orders = orderDAO.historyUser(userId);

        } catch (DAOException e) {
            throw new ServiceException("error while selecting all order records", e);
        }
        return orders;
    }

    @Override
    public void add(Order order) throws ServiceException {

    }

    @Override
    public void delete(long orderId) throws ServiceException {

    }

}
