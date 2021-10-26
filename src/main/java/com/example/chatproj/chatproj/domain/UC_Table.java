package com.example.chatproj.chatproj.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

@Entity
@Table(name="uc_table")
public class UC_Table {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int cnum;
	private int unum;
	private String cname;
	
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getUnum() {
		return unum;
	}
	public void setUnum(int unum) {
		this.unum = unum;
	}
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
}

