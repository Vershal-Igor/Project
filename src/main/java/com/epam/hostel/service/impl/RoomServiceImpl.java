package com.epam.hostel.service.impl;


import com.epam.hostel.dao.RoomDAO;
import com.epam.hostel.dao.exception.DAOException;
import com.epam.hostel.model.room.Room;
import com.epam.hostel.service.IRoomService;
import com.epam.hostel.service.exception.DuplicateEntityException;
import com.epam.hostel.service.exception.InvalidDataException;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.validator.impl.RoomValidator;
import org.apache.log4j.Logger;

import java.util.List;

public class RoomServiceImpl implements IRoomService {
    public static Logger log = Logger.getLogger(RoomServiceImpl.class);
    private RoomValidator validator = RoomValidator.getInstance();

    private RoomDAO roomDAO;

    public void setRoomDAO(RoomDAO roomDAO) {
        this.roomDAO = roomDAO;
    }


    @Override
    public List<Room> findAll() throws ServiceException {
        List<Room> rooms = null;
        try {

            rooms = roomDAO.findAll();

        } catch (DAOException e) {
            throw new ServiceException("error while selecting all room records", e);
        }
        return rooms;
    }

    @Override
    public void add(Room room) throws ServiceException {
        if (validator.validate(room)) {
            try {
                List<Room> rooms = roomDAO.findAll();
                for (Room r : rooms) {
                    if (r.getRoomNumber() == room.getRoomNumber()) {
                        throw new DuplicateEntityException("duplicate room record");
                    }
                }
                roomDAO.add(room);
            } catch (DAOException e) {
                throw new ServiceException("error while adding room record", e);
            }
        } else {
            throw new InvalidDataException("invalid room number");
        }
    }

    @Override
    public void delete(long roomId) throws ServiceException {
        try {
            roomDAO.delete(roomId);
        } catch (DAOException e) {
            throw new ServiceException("error while deleting room", e);
        }
    }

    @Override
    public void updatePrice(long roomId) throws ServiceException {
        try {
            Room room = new Room();
            room.setId(roomId);
            roomDAO.update(room);
        } catch (DAOException e) {
            throw new ServiceException("error while update price", e);
        }
    }

    @Override
    public void changeStatus(long roomId) throws ServiceException {
        try {
            Room room = new Room();
            room.setId(roomId);
            roomDAO.changeStatus(room);
        } catch (DAOException e) {
            throw new ServiceException("error while change status", e);
        }
    }

}
