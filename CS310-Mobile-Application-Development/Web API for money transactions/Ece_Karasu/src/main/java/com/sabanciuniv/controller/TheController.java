package com.sabanciuniv.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sabanciuniv.model.Account;
import com.sabanciuniv.model.Transaction;
import com.sabanciuniv.model.Payload;
import com.sabanciuniv.model.Summary;
import com.sabanciuniv.repo.AccountRepository;
import com.sabanciuniv.repo.TransactionRepository;


@RestController
@RequestMapping("")
public class TheController {
	
	@Autowired private AccountRepository accountRepository;
	@Autowired private TransactionRepository transactionRepository;
	
	private static final Logger logger = LoggerFactory.getLogger(TheController.class);
	
	@PostConstruct
	public void init() {
		if(accountRepository.count() == 0) {
			logger.info("Database is empty, initializing..");
			Account acc1 = new Account("1111", "Jack Johns");
			Account acc2 = new Account("2222", "Henry Williams");
			
			accountRepository.save(acc1);
			accountRepository.save(acc2);
			
			Transaction a1 = new Transaction(acc1, acc2, 1500.0);
			Transaction a2 = new Transaction(acc2, acc1, 2500.0);
			
			transactionRepository.save(a1);
			transactionRepository.save(a2);
			
			
			
			List<Account> authors = accountRepository.findAll();
			List<Transaction> pubs = transactionRepository.findAll();
			
			
			logger.info("All sample data saved!");	
		}
		else if(transactionRepository.count() == 0) {
			logger.info("Account is not empty but transactions are empty!");	
		}
	}
	
	
	
//	@GetMapping("/account/{account_id}")
//	@ResponseBody
//	public Account account(@PathVariable String account_id){
//		Account account = accountRepository.findByIdContainsIgnoreCase(account_id);
//		return account;
//	
//	}
	
//	public Map get_map(Account account) {
//		HashMap<String, String> map = new HashMap<>();
//		map.put("id", account.getId());
//		map.put("owner", account.getOwner());
//		map.put("createDate", account.getDate());
//		return map;
//	}
	
	@PostMapping("/account/save")
	public Map<String,Object> saveAccount(@RequestBody Payload payload) {
		HashMap<String, Object> map = new HashMap<>();
		
		
		if(payload.getOwner() == null || payload.getId() == null) {
			map.put("Message", "ERROR:missing fields");
			map.put("data",null);
			return map;
		}
		
		Account account = new Account(payload.getId(), payload.getOwner());
		
		Account accountSaved = accountRepository.save(account);
		
		map.put("Message","SUCCESS");
		map.put("data",accountSaved);
		
		return map;
	}
	
	@PostMapping("/transaction/save")
	public Map<String,Object> saveTransaction(@RequestBody Payload payload) {
		HashMap<String, Object> map = new HashMap<>();
		
		
		if(payload.getFromAccountId() == null || payload.getToAccountId() == null || payload.getAmount() == null) {
			map.put("Message", "ERROR:missing fields");
			map.put("data",null);
			return map;
		}
		Account from_account = accountRepository.findByIdContainsIgnoreCase(payload.getFromAccountId());
		Account to_account = accountRepository.findByIdContainsIgnoreCase(payload.getToAccountId());
		
		if (from_account == null || to_account == null) {
			map.put("Message", "ERROR: account id");
			map.put("data",null);
			return map;
		}
		
		Transaction transaction = new Transaction(from_account, to_account, payload.getAmount());
		
		transactionRepository.save(transaction);
		
		map.put("Message","SUCCESS");
		map.put("data",transaction );
		
		return map;
	}
	
	@GetMapping("/transaction/to/{account_id}")
	@ResponseBody
	public Map<String,Object> list_incoming(@PathVariable String account_id){
		HashMap<String, Object> map = new HashMap<>();
		Account account = accountRepository.findByIdContainsIgnoreCase(account_id);
		if (account == null) {
			map.put("Message", "ERROR:account doesn’t exist");
			map.put("data",null);
			return map;
		}

		List<Transaction> transactions = transactionRepository.findByTo(account);
		
		map.put("Message","SUCCESS");
		map.put("data",transactions );
		return map;
	
	}
	
	@GetMapping("/transaction/from/{account_id}")
	@ResponseBody
	public Map<String,Object> list_outgoing(@PathVariable String account_id){
		HashMap<String, Object> map = new HashMap<>();
		Account account = accountRepository.findByIdContainsIgnoreCase(account_id);
		if (account == null) {
			map.put("Message", "ERROR:account doesn’t exist");
			map.put("data",null);
			return map;
		}

		List<Transaction> transactions = transactionRepository.findByFrom(account);
		
		map.put("Message","SUCCESS");
		map.put("data",transactions );
		return map;
	
	}
	
	@GetMapping("/account/{account_id}")
	@ResponseBody
	public Map<String,Object> summary(@PathVariable String account_id){
		HashMap<String, Object> map = new HashMap<>();
		
		Account account = accountRepository.findByIdContainsIgnoreCase(account_id);
		if (account == null) {
			map.put("Message", "ERROR:account doesnt exist!");
			map.put("data",null);
			return map;
		}

		List<Transaction> incoming_transactions = transactionRepository.findByTo(account);
		List<Transaction> outgoing_transactions = transactionRepository.findByFrom(account);
		
		double balance = 0;
		
		for (Transaction trans : incoming_transactions) {
			balance = balance + trans.getAmount();
		}
		for (Transaction trans : outgoing_transactions) {
			balance = balance - trans.getAmount();
		}
		
		Summary summary = new Summary();
		
		summary.setId(account.getId());
		summary.setOwner(account.getOwner());
		summary.setCreateDate(account.getCreateDate());
		summary.setTransactionsOut(outgoing_transactions);
		summary.setTransactionsIn(incoming_transactions);
		summary.setBalance(balance);
		
		
		map.put("Message","SUCCESS");
		map.put("data",summary);
	
		return map;
	
	}
}
