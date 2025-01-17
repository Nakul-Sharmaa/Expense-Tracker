package com.entity;

import javax.annotation.processing.Generated;

import jakarta.*;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity 
@Table(name = "user_dtls")
public class User {
	
	@Id
	@GeneratedValue(strategy=  GenerationType.AUTO)
	private int  id;
	
	@Column(name = "fullname")
	private String fullname;
	 private String email;
	 private String password;
	 private String about;
	public User() {
		super();
	}
	public User( String fullname, String email, String password, String about) {
		super();
		
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.about = about;
	}
	
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", fullname=" + fullname + ", email=" + email + ", password=" + password + ", about="
				+ about + "]";
	}
	 
	

}
