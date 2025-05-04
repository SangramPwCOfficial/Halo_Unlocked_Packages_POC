/**
 * @description       : This is a class to learn salesforce integrations
 * @author            : Sangram Keshari Upadhyaya
 * @group             : Practice Developers
 * @last modified on  : 04-05-2025
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   03-05-2025   Sangram Keshari Upadhyaya   Initial Version
**/
public class Demo_UseSpoonacularAPI {

    private static final String SPOONACULAR_API = 'https://api.spoonacular.com/';
    private static final String API_KEY = '92cb6bd1e02e4d0aa403bc3e8c6c906f';

    /**
    * @description This method retrieves a random recipe from the Spoonacular API.
    * @return void
    **/
    @AuraEnabled
    public static void getRandomRecipes(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'recipes/random?apiKey='+ API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
    
        System.debug(response.getStatusCode());
    
        if(response.getStatusCode() == 200){
            System.debug('response = ' + response.getBody());
        }
    
    }
    
    /**
    * @description 
    * @author Sangram Keshari Upadhyaya | 04-05-2025 
    * @param String recipeId 
    **/
    @AuraEnabled
    public static void getRecipes(String recipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + 'recipes/'+recipeId+'/information?apiKey=' + API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        System.debug(response.getStatusCode());
    
        if(response.getStatusCode() == 200){
            System.debug('response = ' + response.getBody());
        }
    }
    
    // apples,+flour,+sugar
    /**
    * @description 
    * @author Sangram Keshari Upadhyaya | 04-05-2025 
    * @param String ingredientNames 
    **/
    @AuraEnabled
    public static void getRecipesByIngredients(String ingredientNames){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API + 'recipes/findByIngredients?apiKey=' + API_KEY+'&ingredients=' + ingredientNames);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        System.debug(response.getStatusCode());
    
        if(response.getStatusCode() == 200){
            System.debug('response = ' + response.getBody());
        }
    }

}