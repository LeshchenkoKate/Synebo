trigger TriggerTrain on Train__c (before insert) {

    if(trigger.isInsert){
        classForTrig.handlerInsert(Trigger.new);
    }
    if(trigger.isUpdate){
        classForTrig.handlerUpdate(Trigger.new);
    }
    if(trigger.isDelete){
        classForTrig.handlerDelete(Trigger.new);
    }
}
