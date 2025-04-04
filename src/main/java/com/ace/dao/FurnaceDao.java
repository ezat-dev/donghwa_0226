package com.ace.dao;

import java.util.List;

import com.ace.domain.GlobalParameter;
import com.ace.domain.Recipe;

public interface FurnaceDao {

	List<Recipe> getRecipeList();

	List<Recipe> getRecipeDataList(Recipe recipe);

	void recipeDataWrite(Recipe recipe);

	void recipeNew();

	void recipeCopy(Recipe recipe);

	void recipeDelete(Recipe recipe);

	int recipeCheck(Recipe recipe);

	List<Recipe> graphicalProcessTrend(Recipe recipe);

	void globalDbSave(GlobalParameter globalParameter);

	List<GlobalParameter> globalDbList(GlobalParameter globalParameter);

}
