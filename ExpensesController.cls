public with sharing class ExpensesController {
    // STERN LECTURE ABOUT WHAT'S MISSING HERE COMING SOON
    
    @AuraEnabled
    public static List<Account> getExpenses(String Name) {
        List<Account> acc = new List<Account>();
        if (Name == null || Name ==''){
            acc = [SELECT Id, Name, AccountNumber, NumberOfEmployees, Fax, Industry 
                FROM Account];
        }else {
            acc = [SELECT Id, Name, AccountNumber, NumberOfEmployees, Fax, Industry
                FROM Account where Name = :Name];
        }
        return acc;
    }
}
