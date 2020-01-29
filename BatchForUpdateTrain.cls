global class BatchForUpdateTrain implements Database.Batchable<sObject>, Database.Stateful{

    global Integer recordsProcessed = 0;
    global Decimal allCount = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'select id, Number__c, CountOfRailwayCarriages__c (select id from Railway_carriages__r) from Train__c'
        );
    }
    
     global void execute(Database.BatchableContext bc, List<Train__c> scope){
         
         for (Train__c train : scope) {
                train.CountOfRailwayCarriages__c = train.Railway_carriages__r.size();
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