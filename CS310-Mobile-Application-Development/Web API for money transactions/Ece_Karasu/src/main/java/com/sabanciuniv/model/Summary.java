package com.sabanciuniv.model;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;

public class Summary {
	private String id;
	private String owner;
	private String createDate ;
	private List<Transaction> transactionsOut;
	private List<Transaction> transactionsIn;
	private Double balance;
	
	public Summary(String id, String owner, String createDate, List<Transaction> transactionsOut,
			List<Transaction> transactionsIn, Double balance) {
		super();
		this.id = id;
		this.owner = owner;
		this.createDate = createDate;
		this.transactionsOut = transactionsOut;
		this.transactionsIn = transactionsIn;
		this.balance = balance;
	}

	public Summary() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public List<Transaction> getTransactionsOut() {
		return transactionsOut;
	}

	public void setTransactionsOut(List<Transaction> transactionsOut) {
		this.transactionsOut = transactionsOut;
	}

	public List<Transaction> getTransactionsIn() {
		return transactionsIn;
	}

	public void setTransactionsIn(List<Transaction> transactionsIn) {
		this.transactionsIn = transactionsIn;
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}
	
	
	
}
 
