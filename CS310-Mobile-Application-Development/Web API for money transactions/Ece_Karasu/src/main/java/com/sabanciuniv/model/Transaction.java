package com.sabanciuniv.model;

import java.time.LocalDateTime;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.DocumentReference;

//@Document
public class Transaction {
	
	@Id private String id;
	
	@DBRef
	private Account from;
	
	@DBRef
	private Account to;

	private String createDate;
	private Double amount;
	
	
	public Transaction() {
		// TODO Auto-generated constructor stub
	}

	public Transaction(Account from, Account to, Double amount) {
		super();
		this.from = from;
		this.to = to;
		this.amount = amount;
		this.createDate = LocalDateTime.now().toString();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Account getFrom() {
		return from;
	}

	public void setFrom(Account from) {
		this.from = from;
	}

	public Account getTo() {
		return to;
	}

	public void setTo(Account to) {
		this.to = to;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getcreateDate() {
		return createDate;
	}

	public void setcreateDate(String createDate) {
		this.createDate = createDate;
	}

	
}

