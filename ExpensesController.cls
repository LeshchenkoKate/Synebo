public with sharing class ExpensesController {
    // STERN LECTURE ABOUT WHAT'S MISSING HERE COMING SOON
    
    @AuraEnabled
    public static List<Account> getExpenses(String Name1) {
        List<Account> acc = new List<Account>();
        String queryString = 'SELECT Id, Name, AccountNumber, NumberOfEmployees, Fax, Industry from Account';
        if(String.isNotBlank(queryString)){
            queryString = queryString +' WHERE Name LIKE  \'%'+Name1+ '%\'';
        }
        acc = Database.query(queryString);
        return acc;
    }

}
