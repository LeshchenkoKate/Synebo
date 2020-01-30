({
    doInit: function(component, event, helper) {
        // Create the action
        var str = component.get("c.accname");
        var action = component.get("c.getExpenses");
        action.setParams({
            "name":str 
        });
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.expenses", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    }
})
