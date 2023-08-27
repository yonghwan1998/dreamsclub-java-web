package xyz.dreams.dto;

import lombok.Data;

@Data
public class Userinfo {
	private String userid;
	private String password;
	private String name;
	private String email;
	private int status;
}
