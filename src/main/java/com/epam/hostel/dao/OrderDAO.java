package com.epam.hostel.dao;

import com.epam.hostel.dao.exception.DAOException;
import com.epam.hostel.model.order.Order;
import com.epam.hostel.model.order.PayType;
import com.epam.hostel.model.order.OrderStatus;
import com.epam.hostel.model.room.Room;
import com.epam.hostel.model.user.User;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DAO<Order> {
    private static Logger log = Logger.getLogger(OrderDAO.class);

    //private static final String SELECT_ALL_ORDERS = "SELECT * FROM `Order`;";
    private static final String SELECT_ALL_ORDERS = "SELECT `Order`.o_id, `Order`.arrival_date,`Order`.depature_date," +
            "User.name, User.surname, Room.room_number,`Order`.pay_type, `Order`.discount, " +
            "PERIOD_DIFF(`depature_date`, `arrival_date`)*room.price*((100-`Order`.discount)/100) AS final_pice," +
            "`Order`.status FROM `Order` INNER JOIN `User` ON `User_id` = `u_id` INNER JOIN `Room` ON `o_id` = `r_id`;";
    private static final String SELECT_ORDER_BY_ID = "SELECT `Order`.o_id,user.u_id,`Order`.arrival_date," +
            "`Order`.depature_date,`Order`.status,`Order`.discount,room.price*((100-`Order`.discount)/100) " +
            "AS final_pice,`Order`.pay_type FROM `Order` INNER JOIN `User` ON `User_id` = `u_id` INNER JOIN " +
            "`Room` ON `Room_id` = `r_id` WHERE user.u_id=?;";
    private static final String INSERT_ORDER = "INSERT INTO `Order` (User_id, Room_id, arrival_date," +
            " depature_date, places_amount, pay_type) VALUES (?, ?, ?, ?, ?, ?);";


    private BasicDataSource dataSource;

    public OrderDAO(DataSource dataSource) {
        super(dataSource);
    }

    public void setDataSource(BasicDataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public List<Order> findAll() throws DAOException {
        List<Order> orders = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(SELECT_ALL_ORDERS);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Order order = new Order();
                User user = new User();
                Room room = new Room();

                /*order.setId(resultSet.getLong(1));
                order.setArrivalDate(resultSet.getDate(2));
                order.setDepartureDate(resultSet.getDate(3));
                order.setPlacesAmount(resultSet.getInt(4));
                order.setPayType(PayType.valueOf(resultSet.getInt(5)));
                order.setDiscount(resultSet.getBigDecimal(6));
                order.setOrderStatus(OrderStatus.valueOf(resultSet.getInt(7)));
                order.setUserId(resultSet.getLong(8));
                order.setRoomId(resultSet.getLong(9));*/

                order.setId(resultSet.getLong(1));
                order.setArrivalDate(resultSet.getDate(2));
                order.setDepartureDate(resultSet.getDate(3));
                user.setName(resultSet.getString(4));
                user.setSurname(resultSet.getString(5));
                room.setRoomNumber(resultSet.getByte(6));
                order.setPayType(PayType.valueOf(resultSet.getInt(7)));
                order.setDiscount(resultSet.getBigDecimal(8));
                order.setFinalPrice(resultSet.getBigDecimal(9).setScale(2));
                order.setOrderStatus(OrderStatus.valueOf(resultSet.getInt(10)));

                orders.add(order);
            }
        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
            closeRs(resultSet);
        }
        return orders;
    }

    public List<Order> historyUser(long userId) throws DAOException {
        List<Order> orders = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement(SELECT_ORDER_BY_ID);

            preparedStatement.setLong(1, userId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Order order = new Order();

                order.setId(resultSet.getLong(1));
                order.setUserId(resultSet.getLong(2));
                order.setArrivalDate(resultSet.getDate(3));
                order.setDepartureDate(resultSet.getDate(4));
                order.setOrderStatus(OrderStatus.valueOf(resultSet.getInt(5)));
                order.setDiscount(resultSet.getBigDecimal(6));
                order.setFinalPrice(resultSet.getBigDecimal(7));
                order.setPlacesAmount(resultSet.getInt(8));
                order.setPayType(PayType.valueOf(resultSet.getInt(9)));

                orders.add(order);
            }
        } catch (SQLException e) {
            throw new DAOException("some sql exception", e);
        } finally {
            closeSt(preparedStatement);
            closeRs(resultSet);
        }
        return orders;
    }

    @Override
    public long add(Order order) throws DAOException {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = jdbcTemplate.getDataSource().getConnection().prepareStatement
                    (INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setLong(1, order.getUserId());
            preparedStatement.setLong(2, order.getRoomId());
            preparedStatement.setDate(3, order.getArrivalDate());
            preparedStatement.setDate(4, order.getDepartureDate());
            preparedStatement.setInt(4, order.getPlacesAmount());
            preparedStatement.setString(5, String.valueOf(order.getOrderStatus()));

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
        return false;
    }

    @Override
    public Long update(Order entity) throws DAOException {
        return null;
    }

}
