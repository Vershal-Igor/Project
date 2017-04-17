package com.epam.hostel.service.impl;


import com.epam.hostel.dao.UserDAO;
import com.epam.hostel.dao.exception.DAOException;

import com.epam.hostel.model.room.Room;
import com.epam.hostel.model.user.User;
import com.epam.hostel.service.IUserService;
import com.epam.hostel.service.exception.DuplicateEntityException;
import com.epam.hostel.service.exception.InvalidDataException;
import com.epam.hostel.service.exception.NoEntityException;
import com.epam.hostel.service.exception.ServiceException;
import com.epam.hostel.service.validator.IUserValidator;
import com.epam.hostel.service.validator.impl.UserValidator;
import org.apache.log4j.Logger;
import org.apache.commons.codec.digest.DigestUtils;
//вроде есть и import org.springframework.util.DigestUtils;
// но не хочет подключаться md5Hex

import java.util.List;


public class UserServiceImpl implements IUserService {
    public static Logger log = Logger.getLogger(UserServiceImpl.class);

    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    private IUserValidator validator = UserValidator.getInstance();

    private static final int ZERO_RECORDS_COUNT = 0;

    @Override
    public List<User> findAll() throws ServiceException {
        List<User> users = null;
        try {
            users = userDAO.findAll();
        } catch (DAOException e) {
            throw new ServiceException("error while find All users", e);
        }
        return users;
    }

    @Override
    public User signIn(User user) throws ServiceException {
        if (validator.validateLogPass(user)) {
            try {
                String password = user.getPassword();
                user.setPassword(DigestUtils.md5Hex(password));

                //int recordCount = userDAO.checkUser(user);
                //if (recordCount == ZERO_RECORDS_COUNT) {
                //   throw new NoEntityException("there is no entity with such data");
                //} else {
                return userDAO.getUserInf(user);
                //}
            } catch (DAOException e) {
                throw new ServiceException("error while sign in user", e);
            }
        } else {
            throw new InvalidDataException("invalid data");
        }
    }

    @Override
    public long signUp(User user) throws ServiceException {
        if (validator.validate(user)) {
            try {
                String password = user.getPassword();
                user.setPassword(DigestUtils.md5Hex(password));

                int recordsCount = userDAO.checkUser(user);
                if (recordsCount != ZERO_RECORDS_COUNT) {
                    throw new DuplicateEntityException("there is a record with such data");
                } else {
                    return userDAO.add(user);
                }
            } catch (DAOException e) {
                throw new ServiceException("error while sign up user", e);
            }
        } else {
            throw new InvalidDataException("invalid user data");
        }
    }

    @Override
    public void add(User user) throws ServiceException {
        if (validator.validate(user)) {
            try {
                String password = user.getPassword();
                user.setPassword(DigestUtils.md5Hex(password));
                List<User> users = userDAO.findAll();
                for (User r : users) {
                    if (r.getLogin() == user.getLogin()) {
                        throw new DuplicateEntityException("duplicate user record");
                    }
                }
                userDAO.add(user);
            } catch (DAOException e) {
                throw new ServiceException("error while adding user record", e);
            }
        } else {
            throw new InvalidDataException("invalid user login");
        }
    }

    @Override
    public void delete(long userId) throws ServiceException {
        try {
            userDAO.delete(userId);
        } catch (DAOException e) {
            throw new ServiceException("error while deleting user", e);
        }
    }

    @Override
    public long update(User user) throws ServiceException {
        if (validator.validateNameSurnameLogin(user)) {
            try {
                return userDAO.update(user);
            } catch (DAOException e) {
                throw new ServiceException("error while sing in user", e);
            }
        } else {
            throw new InvalidDataException("invalid user data");
        }
    }

    @Override
    public boolean setBan(Long userId) throws ServiceException {
        boolean banned = false;
        try {
            banned = userDAO.setBan(userId);
        } catch (DAOException e) {
            throw new ServiceException("error while set Ban user", e);
        }
        return banned;
    }

    @Override
    public boolean setUnban(Long userId) throws ServiceException {
        boolean unbanned = false;
        try {
            unbanned = userDAO.setUnban(userId);
        } catch (DAOException e) {
            throw new ServiceException("error while set Unban user", e);
        }
        return unbanned;
    }


}

