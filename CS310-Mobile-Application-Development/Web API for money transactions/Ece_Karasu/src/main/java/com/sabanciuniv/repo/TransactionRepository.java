package com.sabanciuniv.repo;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.sabanciuniv.model.Transaction;
import com.sabanciuniv.model.Account;

public interface TransactionRepository extends MongoRepository<Transaction, String>{
	public List<Transaction> findByFrom(Account account);
	public List<Transaction> findByTo(Account account);
}
