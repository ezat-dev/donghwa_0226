package com.ace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.dao.FurnaceDao;
import com.ace.domain.GlobalParameter;
import com.ace.domain.Recipe;

@Service
public class FurnaceServiceImpl implements FurnaceService{

	@Autowired
	private FurnaceDao furnaceDao;

	@Override
	public List<Recipe> getRecipeList() {
		return furnaceDao.getRecipeList();
	}

	@Override
	public List<Recipe> getRecipeDataList(Recipe recipe) {
		return furnaceDao.getRecipeDataList(recipe);
	}

	@Override
	public void recipeDataWrite(Recipe recipe) {
		furnaceDao.recipeDataWrite(recipe);
	}

	@Override
	public void recipeNew() {
		furnaceDao.recipeNew();
	}

	@Override
	public void recipeCopy(Recipe recipe) {
		furnaceDao.recipeCopy(recipe);
	}

	@Override
	public void recipeDelete(Recipe recipe) {
		furnaceDao.recipeDelete(recipe);
	}

	@Override
	public int recipeCheck(Recipe recipe) {
		return furnaceDao.recipeCheck(recipe);
	}

	@Override
	public List<Recipe> graphicalProcessTrend(Recipe recipe) {
		return furnaceDao.graphicalProcessTrend(recipe);
	}

	@Override
	public void globalDbSave(GlobalParameter globalParameter) {
		furnaceDao.globalDbSave(globalParameter);
	}

	@Override
	public List<GlobalParameter> globalDbList(GlobalParameter globalParameter) {
		return furnaceDao.globalDbList(globalParameter);
	}
	@Override
	public List<GlobalParameter> globalDbList0915(GlobalParameter globalParameter) {
		return furnaceDao.globalDbList0915(globalParameter);
	}

	

}
