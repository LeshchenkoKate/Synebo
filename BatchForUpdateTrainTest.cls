@isTest
public class BatchForUpdateTrainTest {

    @testSetup
    static void generateRandomTrainsAndRailwayCarriages(){
        Integer count = 190;
        Integer count2 = 7;
        List<Train__c> newTrains = new List<Train__c>();
        List<Railway_carriage__c> newRailwayCarriages = new List<Railway_carriage__c>();
        for(Integer i = 0 ; i<count; i++){
             Train__c train = new Train__c(Number__c='test'+i, Name__c='lastname'+i);
            newTrains.add(train);
        }
        insert newTrains;
        for(Train__c tr :newTrains){
            for(Integer i = 0 ; i<count2; i++){
                newRailwayCarriages.add(new Railway_carriage__c(Number__c = i, Name = 'test'+i, Railway_carriage_Train__c = tr.id));
            }
        }
        insert newRailwayCarriages;
       
    }
    
    static testmethod void test() {        
        Test.startTest();
        BatchForUpdateTrain uca = new BatchForUpdateTrain();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(190, [select count() from Train__c]);
    }
    
}