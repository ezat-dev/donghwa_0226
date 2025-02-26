package com.ace.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.ace.service.RecipeStartService;


public class RecipeStartProcessor {
	
	@Autowired
	private RecipeStartService recipeStartService;
	
	@Scheduled(fixedRate = 1000)
	public void handle() throws InterruptedException, ExecutionException{
		recipeStartService.timerStart();
	}
}
