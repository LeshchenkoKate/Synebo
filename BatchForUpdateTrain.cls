global class BatchForUpdateTrain implements Database.Batchable<sObject>, Database.Stateful{

    global Integer recordsProcessed = 0;
    global Decimal allCount = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'select id, Number__c, CountOfRailwayCarriages__c from Train__c'
        );
    }
    
     global void execute(Database.BatchableContext bc, List<Train__c> scope){
         List<Railway_carriage__c> carriages = [select id, Railway_carriage_Train__c from Railway_carriage__c where Railway_carriage_Train__c in :scope]; 
         for (Train__c train : scope) {
             Integer count =0;
             for(Railway_carriage__c carr: carriages){
                 if(carr.Railway_carriage_Train__c == train.Id){
                     ++count;
                 }
             }
             train.CountOfRailwayCarriages__c = count;
                allCount =+ train.CountOfRailwayCarriages__c;
                // increment the instance member counter
                recordsProcessed = recordsProcessed + 1;
            
        }
        update scope;
         
     }
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed.');
        System.debug('Number of all railway carriages is' + allCount);
        
    }    
    
}
