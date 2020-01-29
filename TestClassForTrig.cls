@isTest
public class TestClassForTrig {

     @isTest static void handlerInsertTest(){
       integer count = 7;
         List<Train__c> newTrains = generateRandomTrains(count);
        system.assertEquals(classForTrig.handlerInsert(newTrains), count);
    }
    @isTest static void handlerUpdateTest(){
       integer count = 7;
        integer count2 = 4;
         List<Train__c> Train = generateRandomTrainsAndRailwayCarriages(count, count2);
        List<Train__c> upTr = classForTrig.handlerUpdate(Train);
        for(Train__c tr : upTr){
            system.assertEquals(tr.CountOfRailwayCarriages__c, count2);
        }
        
    }
    @isTest static void handlerDeleteTest(){
       integer count = 7;
        integer count2 = 4;
         List<Train__c> Train = generateRandomTrainsAndRailwayCarriages(count, count2);
        List<Train__c> upTr = classForTrig.handlerDelete(Train);
        for(Train__c tr : upTr){
            system.assertEquals(tr.CountOfRailwayCarriages__c, count2);
        }
        
    }
    public static List<Train__c> generateRandomTrains(integer countOfTrains){
        List<Train__c> newTrains = new List<Train__c>();
        for(Integer i = 0 ; i<countOfTrains; i++){
             Train__c train = new Train__c(Number__c='test'+i, Name__c='lastname'+i);
            newTrains.add(train);
        }
        insert newTrains;
        return newTrains;
    } 
    public static List<Train__c> generateRandomTrainsAndRailwayCarriages(integer countOfTrains, integer countOfRailwayCarriages){
        List<Train__c> Trains = generateRandomTrains(countOfTrains);
        List<Railway_carriage__c> newRailwayCarriages = new List<Railway_carriage__c>();
        for(Train__c tr :Trains){
            for(Integer i = 0 ; i<countOfRailwayCarriages; i++){
                newRailwayCarriages.add(new Railway_carriage__c(Number__c = i, Name = 'test'+i, Railway_carriage_Train__c = tr.id));
            }
        }
        insert newRailwayCarriages;
        return Trains;
    } 
}