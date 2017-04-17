package com.epam.hostel.service;

import com.epam.hostel.dao.exception.DAOException;
import com.epam.hostel.model.user.User;
import com.epam.hostel.service.exception.ServiceException;

import java.util.List;

public interface IUserService {
    List<User> findAll() throws ServiceException;

    User signIn(User user) throws ServiceException;

    long signUp(User user) throws ServiceException;

    void add(User user) throws ServiceException;

    void delete(long userId) throws ServiceException;

    long update(User user) throws ServiceException;

    boolean setBan(Long userId) throws ServiceException;

    boolean setUnban(Long userId) throws ServiceException;

}
