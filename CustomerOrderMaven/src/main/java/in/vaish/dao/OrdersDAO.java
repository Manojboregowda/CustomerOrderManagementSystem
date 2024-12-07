package in.vaish.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import in.vaish.entity.Order;

public class OrdersDAO {
	
	private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Order> getOrdersByCustomerId(int customerId) {
        String sql = "SELECT * FROM orders WHERE customerId = ?";
        return jdbcTemplate.query(sql, new Object[]{customerId}, new RowMapper<Order>() {
            @Override
            public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setOrderDate(rs.getDate("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setCustomerId(rs.getInt("customerId"));
                return order;
            }
        });
    }

    public int createOrder(Order order) {
        String sql = "INSERT INTO orders (orderDate, totalAmount, customerId) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql, order.getOrderDate(), order.getTotalAmount(), order.getCustomerId());
    }

    public int updateOrder(Order order) {
        String sql = "UPDATE orders SET orderDate = ?, totalAmount = ? WHERE id = ?";
        return jdbcTemplate.update(sql, order.getOrderDate(), order.getTotalAmount(), order.getId());
    }

    public int deleteOrder(int orderId) {
        String sql = "DELETE FROM orders WHERE id = ?";
        return jdbcTemplate.update(sql, orderId);
    }
}
