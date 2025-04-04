package com.ace.domain;

public class BatchReport {

	private int idx;
	private int recipe_number;
	private String recipe_name;
	private String recipe_comment;
	private String recipe_stime;
	private String recipe_etime;
	private String recipe_worker;
	
	public int getIdx() {
		return idx;		
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getRecipe_number() {
		return recipe_number;
	}
	public void setRecipe_number(int recipe_number) {
		this.recipe_number = recipe_number;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getRecipe_comment() {
		return recipe_comment;
	}
	public void setRecipe_comment(String recipe_comment) {
		this.recipe_comment = recipe_comment;
	}
	public String getRecipe_stime() {
		return recipe_stime;
	}
	public void setRecipe_stime(String recipe_stime) {
		this.recipe_stime = recipe_stime;
	}
	public String getRecipe_etime() {
		return recipe_etime;
	}
	public void setRecipe_etime(String recipe_etime) {
		this.recipe_etime = recipe_etime;
	}
	public String getRecipe_worker() {
		return recipe_worker;
	}
	public void setRecipe_worker(String recipe_worker) {
		this.recipe_worker = recipe_worker;
	}
	
	
}
