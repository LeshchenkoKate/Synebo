({
    doInit: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Id', fieldName: 'Id', type: 'text'},
            {label: 'Account name', fieldName: 'UrlLink__c', type: 'url', typeAttributes: { label: { fieldName: 'Name'}}},
            {label: 'Account number', fieldName: 'AccountNumber', type: 'number'},
            {label: 'Number Of Employees', fieldName: 'NumberOfEmployees', type: 'number'},
            {label: 'Fax', fieldName: 'Fax', type: 'phone'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'}
           
        ]);

        var str = cmp.get("v.accname");
        var action = cmp.get("c.getExpenses");
        action.setParams({
            "Name1":str 
        });
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                var rec = response.getReturnValue();
                rec.forEach(function(record){
                    record.UrlLink__c = '/' + record.Id;
                });
                cmp.set("v.data", rec);
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    
    }
})
       

        
