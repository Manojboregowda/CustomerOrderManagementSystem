package in.vaish.entity;

import lombok.Data;

@Data
public class Customer {
	private int id;
	private String name;
	private String email;
	private String password;
}
