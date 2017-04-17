package com.epam.hostel.dao;


import com.epam.hostel.dao.exception.DAOException;
import com.epam.hostel.model.room.Room;;
import com.epam.hostel.model.room.RoomStatus;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class RoomDAO extends DAO<Room> {
    private static Logger log = Logger.getLogger(RoomDAO.class);

    private static final String SELECT_ALL_ROOMS = "SELECT * FROM room;";
    private static final String INSERT_ROOM = "INSERT INTO room(room_number, room_places, price) VALUES(?, ?, ?);";
    private static final String DELETE_ROOM = "DELETE FROM room WHERE r_id=?;";
    private static final String UPDATE_ROOM_PRICE = "UPDATE room SET price=? WHERE r_id=?;";
    private static final String CHANGE_STATUS = "UPDATE room SET status=? WHERE r_id=?;";


    private BasicDataSource dataSource;

    public RoomDAO(DataSource dataSource) {
        super(dataSource);
    }

    public void setDataSource(BasicDataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public List<Room> findAll() throws DAOException {
        List<Room> rooms = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(SELECT_ALL_ROOMS);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Room room = new Room();

                room.setId(resultSet.getLong(1));
                room.setRoomNumber(resultSet.getByte(2));
                room.setRoomPlaces(resultSet.getByte(3));
                room.setPrice(resultSet.getBigDecimal(4));
                room.setRoomStatus(RoomStatus.valueOf(resultSet.getInt(5)));

                rooms.add(room);
            }
        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
            closeRs(resultSet);
        }
        return rooms;
    }


    @Override
    public long add(Room room) throws DAOException {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement
                    (INSERT_ROOM, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setByte(1, room.getRoomNumber());
            preparedStatement.setByte(2, room.getRoomPlaces());
            preparedStatement.setBigDecimal(3, room.getPrice());

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
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(DELETE_ROOM);
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
    public Long update(Room room) throws DAOException {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(UPDATE_ROOM_PRICE);
            preparedStatement.setBigDecimal(1, room.getPrice());
            preparedStatement.setLong(2, room.getId());
            preparedStatement.executeUpdate();

            return room.getId();
        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
        }
    }

    public Long changeStatus(Room room) throws DAOException {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(CHANGE_STATUS);
            preparedStatement.setString(1, String.valueOf(room.getRoomStatus()));
            preparedStatement.setLong(2, room.getId());
            preparedStatement.executeUpdate();

            return room.getId();
        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
        }
    }


}
