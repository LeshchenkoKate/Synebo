public with sharing class AnimalsCallouts {
    public static void makeGetCallout(integer idAnimal) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals' + idAnimal);
        request.setMethod('GET');
        System.debug('>>>>>>>'+idAnimal);
        HttpResponse response = http.send(request);
        
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            Animals animals = Animals.parse(response.getBody());
            Animal__c an = new Animal__c();
            an.AnimalId__c = animals.animal.id;
            an.Name__c = animals.animal.name;
            an.Eats__c = animals.animal.eats;
            an.Says__c = animals.animal.says;
            
            List <Animal__c> anList = [Select AnimalId__c from Animal__c where AnimalId__c = :animals.animal.id ];
            if(animals.animal.id !=0){
                if(anList.isEmpty()){
                    insert an;
                    system.debug('added Animal:' +an);
                }else
                    system.debug('Animal with id '+ animals.animal.id + 'is already entered');
                
            }else
                system.debug('animal id is null!!');
            
        }else
            system.debug('Error:' + response.getStatus());
                
                
            }
    
    
    public static HttpResponse makePostCallout(String name) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"'+ name +'"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }        
}