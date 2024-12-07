package in.vaish;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import in.vaish.dao.CustomerDAO;
import in.vaish.dao.ItemDAO;
import in.vaish.dao.OrdersDAO;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "in.vaish")
public class AppConfig implements WebMvcConfigurer {
    @Bean
    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/sb");
        dataSource.setUsername("root");
        dataSource.setPassword("Manoj@1999");
        return dataSource;
    }
    
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/views/"); // Points to /webapp/views folder
        resolver.setSuffix(".jsp");   // Adds .jsp suffix to view names
        return resolver;
    }

    @Bean
    public JdbcTemplate jdbcTemplate() {
        return new JdbcTemplate(dataSource());
    }

    @Bean
    public CustomerDAO customerDAO() {
        CustomerDAO dao = new CustomerDAO();
        dao.setJdbcTemplate(jdbcTemplate());
        return dao;
    }

    @Bean
    public OrdersDAO orderDAO() {
        OrdersDAO dao = new OrdersDAO();
        dao.setJdbcTemplate(jdbcTemplate());
        return dao;
    }
    
    @Bean
    public ItemDAO itemDAO() {
    	ItemDAO dao = new ItemDAO();
    	dao.setJdbcTemplate(jdbcTemplate());
    	return dao;
    }
}