@RestResource(urlMapping='/Poke__c/*')
global with sharing class RESTPokemonGET {
   
    public RESTPokemonGET() {
    }
//Note: Must already have a custom Poke__c object in org
//
    @HttpPost
    global static void pokeCreate(String name, List<String> ability){
       
        Poke__c newPokemon = new Poke__C();
        newPokemon.Name = name;
        for(String abi:ability){
        newPokemon.abilities__c = abi;
	//possible values: Spit, Water Squirt, Fire, Lick, Snooze
        }
        insert newPokemon;
    } 

    @HttpGet
    global static Poke__c pokeGet(){
        
        RestRequest request = RestContext.request;
        String pokeId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        
        Poke__c pokeList = [SELECT Name, abilities__c FROM Poke__c WHERE Id =: pokeId];
        return pokeList;
    }
}