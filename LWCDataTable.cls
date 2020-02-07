public with sharing class LWCDataTable {
    @AuraEnabled(Cacheable=true)
    public static List <Contact> getContacts(String strLastName) {
        List<List<sObject>> Li = [find :strLastName in all fields  returning Contact(Id,FirstName,LastName,Account.Name), Account(Id, Name, AccountNumber, NumberOfEmployees, Fax, Industry), Lead(Name)];
        List<Contact> contList = (Contact[])Li[0];
        List<Account> acc = (Account[])Li[1];
        List<Lead> Leads = (Lead[])Li[1];
        return contList;
    } 
}
