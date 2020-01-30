public with sharing class ExpensesController {
    // STERN LECTURE ABOUT WHAT'S MISSING HERE COMING SOON
    
    @AuraEnabled
    public static List<Account> getExpenses(String accName) {
        List<Account> acc = new List<Account>();
        if (accName == null || accName ==''){
            acc = [SELECT Id, AccountNumber 
                FROM Account];
        }else {
            acc = [SELECT Id, AccountNumber 
                FROM Account where Name = :accName];
        }
        return acc;
    }
}
