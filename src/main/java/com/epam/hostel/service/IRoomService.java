package com.epam.hostel.service;

import com.epam.hostel.dao.exception.DAOException;
import com.epam.hostel.model.room.Room;
import com.epam.hostel.service.exception.ServiceException;

import java.util.List;

public interface IRoomService {
    List<Room> findAll() throws ServiceException;

    void add(Room room) throws ServiceException;

    void delete(long roomId) throws ServiceException;

    void updatePrice(long roomId) throws ServiceException;

    void changeStatus(long roomId) throws ServiceException;


}
