package com.sabanciuniv.model;

public class Payload {

	private String owner;
	private String id;
	private String fromAccountId;
	private String toAccountId;
	private Double amount;


	public Payload() {
		// TODO Auto-generated constructor stub
	}


	public Payload(String owner, String id, String fromAccountId, String toAccountId, Double amount) {
		super();
		this.owner = owner;
		this.id = id;
		this.fromAccountId = fromAccountId;
		this.toAccountId = toAccountId;
		this.amount = amount;
	}


	public String getOwner() {
		return owner;
	}


	public void setOwner(String owner) {
		this.owner = owner;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getFromAccountId() {
		return fromAccountId;
	}


	public void setFromAccountId(String fromAccountId) {
		this.fromAccountId = fromAccountId;
	}


	public String getToAccountId() {
		return toAccountId;
	}


	public void setToAccountId(String toAccountId) {
		this.toAccountId = toAccountId;
	}


	public Double getAmount() {
		return amount;
	}


	public void setAmount(Double amount) {
		this.amount = amount;
	}

	
}
