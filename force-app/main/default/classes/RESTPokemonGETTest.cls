@isTest
public class RESTPokemonGETTest {

    @isTest
    public static void testMyPostMethod(){
        List<String> abilityList = new List<String>();
        abilityList.add('Water Squirt');
        abilityList.add('Fire');
        abilityList.add('Lick');
       RESTPokemonGET.pokeCreate('Lapras', abilityList);
        List<Poke__c> oohHereWeGo= [SELECT ID FROM Poke__c WHERE abilities__c = 'Water Squirt'];
        List<Poke__c> pokeMoon = [SELECT ID FROM Poke__c WHERE abilities__c = 'Lick'];
        System.assertEquals(1, pokeMoon.size());  
        System.assertNotEquals(null, oohHereWeGo.size());
    }
    
    @isTest
    public static void returnGETMethod(){
        RestRequest request = new RestRequest();

        Poke__c pokeIo = new Poke__c(name = 'Loopy');
        pokeIo.Abilities__c = 'Fire';
        insert pokeIo;
        ID recordId = pokeIo.Id;
       request.requestUri =
    'https://brave-unicorn-83zdju-dev-ed.trailblaze.lightning.force.com/services/apexrest/Poke__c/'
    + recordId;
request.httpMethod = 'GET';
        
        RestContext.request = request;
        
        Poke__c thisPoke = RESTPokemonGET.pokeGet();
        
        System.Assert(thisPoke != null, thisPoke);
        System.assertEquals('Fire', thisPoke.abilities__c);
    }
}