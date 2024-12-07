package in.vaish.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import in.vaish.entity.Items;

public class ItemDAO {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Items> getallitem() {
		String sql = "SELECT * FROM ITEMS";
		return jdbcTemplate.query(sql, new RowMapper<Items>() {
			@Override
			public Items mapRow(ResultSet rs, int rowNum) throws SQLException {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setPrice(rs.getDouble("price"));
				return item;
			}
		});
	}

}
