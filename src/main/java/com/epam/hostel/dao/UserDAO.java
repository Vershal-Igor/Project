package com.epam.hostel.dao;


import com.epam.hostel.dao.exception.DAOException;
import com.epam.hostel.model.user.Role;
import com.epam.hostel.model.user.UserStatus;
import com.epam.hostel.model.user.User;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


public class UserDAO extends DAO<User> {
    private static Logger log = Logger.getLogger(UserDAO.class);

    public static final String SELECT_ALL_USERS = "SELECT user.u_id, user.name, user.surname, " +
            "user.login, user.password, user.status FROM user WHERE user.role=1";
    public static final String INSERT_USER = "INSERT INTO user (name, surname, login, password) " +
            "VALUES (?, ?, ?, ?)";
    public static final String SELECT_USER_INF = "SELECT user.u_id, user.role, user.name, user.surname FROM user " +
            "WHERE login=? AND password=?;";
    private static final String CHECK_USER = "SELECT EXISTS(SELECT * FROM user WHERE login=? AND password=?);";
    private static final String DELETE_USER = "DELETE FROM user WHERE u_id=?;";
    private static final String UPDATE_USER = "UPDATE user SET user.name=?, user.surname=?, user.login=? WHERE u_id=?;";
    public static final String SET_BAN = "UPDATE user SET status = ? WHERE user.u_id = ?";
    public static final int IS_BANNED = 0;
    public static final int NOT_BANNED = 1;


    private BasicDataSource dataSource;

    public UserDAO(DataSource dataSource) {
        super(dataSource);
    }

    public void setDataSource(BasicDataSource dataSource) {
        this.dataSource = dataSource;
    }


    @Override
    public List<User> findAll() throws DAOException {
        List<User> users = new ArrayList<>();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = jdbcTemplate.getDataSource().getConnection().createStatement();
            resultSet = statement.executeQuery(SELECT_ALL_USERS);
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getLong(1));
                user.setName(resultSet.getString(2));
                user.setSurname(resultSet.getString(3));
                user.setLogin(resultSet.getString(4));
                user.setPassword(resultSet.getString(5));
                user.setUserStatus(UserStatus.valueOf(resultSet.getInt(6)));
                users.add(user);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            closeSt(statement);
            closeRs(resultSet);
        }
        return users;
    }

    @Override
    public long add(User user) throws DAOException {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement
                    (INSERT_USER, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getSurname());
            preparedStatement.setString(3, user.getLogin());
            preparedStatement.setString(4, user.getPassword());

            preparedStatement.executeUpdate();

            resultSet = preparedStatement.getGeneratedKeys();
            resultSet.next();

            return resultSet.getLong(1);
        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
            closeRs(resultSet);
        }
    }

    @Override
    public boolean delete(Long id) throws DAOException {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(DELETE_USER);
            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();

            return true;
        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
        }
    }

    @Override
    public Long update(User user) throws DAOException {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(UPDATE_USER);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getSurname());
            preparedStatement.setString(3, user.getLogin());
            preparedStatement.setLong(4, user.getId());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
        }
        return user.getId();
    }

    public User getUserInf(User user) throws DAOException {
        User infUser = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(SELECT_USER_INF);
            preparedStatement.setString(1, user.getLogin());
            preparedStatement.setString(2, user.getPassword());

            resultSet = preparedStatement.executeQuery();
            resultSet.next();

            infUser = new User();
            ;
            infUser.setId(resultSet.getLong(1));
            infUser.setRole(Role.valueOf(resultSet.getInt(2)));
            infUser.setName(resultSet.getString(3));
            infUser.setSurname(resultSet.getString(4));

            return infUser;
        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
            closeRs(resultSet);
        }
    }

    public int checkUser(User user) throws DAOException {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(CHECK_USER);

            preparedStatement.setString(1, user.getLogin());
            preparedStatement.setString(2, user.getPassword());

            resultSet = preparedStatement.executeQuery();
            resultSet.next();

            return resultSet.getInt(1);
        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
            closeRs(resultSet);
        }
    }

    public boolean setBan(Long id) throws DAOException {
        boolean isBanned = false;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(SET_BAN);
            preparedStatement.setInt(1, IS_BANNED);
            preparedStatement.setLong(2, id);
            preparedStatement.executeUpdate();
            isBanned = true;

        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
        }
        return isBanned;
    }

    public boolean setUnban(Long id) throws DAOException {
        boolean isUnbanned = false;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(SET_BAN);
            preparedStatement.setInt(1, NOT_BANNED);
            preparedStatement.setLong(2, id);
            preparedStatement.executeUpdate();

            isUnbanned = true;

        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
        }
        return isUnbanned;
    }


}
