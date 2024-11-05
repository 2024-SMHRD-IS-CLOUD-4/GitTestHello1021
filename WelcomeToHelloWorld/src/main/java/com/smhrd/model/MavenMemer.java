package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
public class MavenMemer {


	String u_id;
	String u_pw;
	String u_nick;
	String u_tel;
	String u_email;
	String u_type;
	
	
	public MavenMemer(String id, String pw) {
		this.u_id = id;
		this.u_pw = pw;
	}
	
	

}