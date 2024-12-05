package in.vaish.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import in.vaish.entity.Customer;
import in.vaish.entity.Items;
import in.vaish.entity.Order;

public class CustomerDAO {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	private static final String SQL_FIND_BY_EMAIL_AND_PASSWORD = 
	        "SELECT * FROM customers WHERE email = ? AND password = ?";

	    /**
	     * Find customer by email and password.
	     */
	    public Customer findByEmailAndPassword(String email, String password) {
	        try {
	            // Query using two parameters (email and password)
	            return jdbcTemplate.queryForObject(SQL_FIND_BY_EMAIL_AND_PASSWORD, new Object[]{email, password}, 
	                new RowMapper<Customer>() {
	                    @Override
	                    public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
	                        Customer customer = new Customer();
	                        customer.setId(rs.getInt("id"));
	                        customer.setEmail(rs.getString("email"));
	                        customer.setPassword(rs.getString("password"));
	                        return customer;
	                    }
	                });
	        } catch (EmptyResultDataAccessException e) {
	            return null; // No customer found with the provided email and password
	        }
	    }
   
	
	public List<Customer> getAllCustomers() {
		String sql = "SELECT * FROM customers";
		return jdbcTemplate.query(sql, new RowMapper<Customer>() {
			@Override
			public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
				Customer customer = new Customer();
				customer.setId(rs.getInt("id"));
				customer.setName(rs.getString("name"));
				customer.setEmail(rs.getString("email"));
				return customer;
			}
		});
	}
	
	public String addCustomer(Customer customer) {
		String sql="INSERT INTO CUSTOMERS(name,email,password) VALUES (?, ?, ?)";
		int res=jdbcTemplate.update(sql, customer.getName(),customer.getEmail(),customer.getPassword());
		if(res==1) {
			return "Registered Successfull";
		}else {
			return "Not Registered Successfully";
		}
	}
	
}
