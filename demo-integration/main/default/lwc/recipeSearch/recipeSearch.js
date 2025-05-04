/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 04-05-2025
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   04-05-2025   Sangram Keshari Upadhyaya   Initial Version
**/
import { LightningElement } from "lwc";
import getRandomRecipe from "@salesforce/apex/Demo_UseSpoonacularAPI.getRandomRecipes";
import getRecipeByIngredients from "@salesforce/apex/Demo_UseSpoonacularAPI.getRecipesByIngredients";

export default class RecipeSearch extends LightningElement {
  recipes = [];
  fetchRandomRecipe() {
    getRandomRecipe()
      .then((data) => {
        this.recipes =
          JSON.parse(data) && JSON.parse(data).recipes
            ? JSON.parse(data).recipes
            : [];
      })
      .catch((error) => {
        console.error(error);
      });
  }

  fetchRecipesByIngredients() {
    const ingredients = this.template.querySelector(".ingredient-input").value;
    getRecipeByIngredients({ ingredients })
      .then((data) => {
        this.recipes = JSON.parse(data);
      })
      .catch((error) => {
        console.error(error);
      });
  }
}
