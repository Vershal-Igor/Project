package com.epam.hostel.service;


import com.epam.hostel.dao.exception.DAOException;
import com.epam.hostel.model.order.Order;
import com.epam.hostel.service.exception.ServiceException;

import java.util.List;

public interface IOrderService {
    List<Order> findAll() throws ServiceException;

    void add(Order order) throws ServiceException;

    void delete(long orderId) throws ServiceException;
}
