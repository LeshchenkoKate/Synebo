public with sharing class classForTrig {
    public static integer handlerInsert(List<Train__c> newTrains) {
        system.debug('Count of new edited trains is: ' + newTrains.size());
        for (Train__c tr :newTrains){
            if (tr.Number__c == null) {
                system.debug('Enter nymber of Train');
            }
            system.debug ('Nuber of edited train is: ' + tr.Number__c);
        }
        return newTrains.size();
    }
    public static List<Train__c> handlerUpdate(List<Train__c> newTrains){
        List<Train__c> trainList = [select id, Number__c, (select id from Railway_carriages__r) from Train__c where id in :newTrains];
  
        for(Train__c tr :newTrains){
            for (Train__c t :trainList){
                if(tr.id == t.id){
                    tr.CountOfRailwayCarriages__c = t.Railway_carriages__r.size();
                    system.debug ('Number of updated train is: ' + tr.Number__c + 'Which consists of: ' + t.Railway_carriages__r.size() + 'railway carrige(s)');
                    
                }
                
            }
        }
        return trainList;
    }

    public static List<Train__c> handlerDelete(List<Train__c> oldTrains){
        List<Train__c> trainList = [select id, Number__c, (select id from Railway_carriages__r) from Train__c where id in :oldTrains];
        system.debug ('Count of delete trains is: ' + trainList.size());
        for (Train__c t :trainList){
            system.debug ('Number of deleted train is: ' + t.Number__c + 'Which consists of: ' + t.Railway_carriages__r.size() + 'railway carrige(s)');
        }
        return trainList;

    }
}