import { LightningElement, track } from 'lwc';
//import fetchDataHelper from './fetchDataHelper';
import getContacts from 'force-app/main/default/classes/LWCDataTable.cls';
const columns = [

    { label: 'Id', fieldName: 'Id' }, 
    { label: 'First Name', fieldName: 'FirstName' }, 
    { label: 'Last Name', fieldName: 'LastName' },
];
export default class HelloWorld extends LightningElement {
    @track greeting = 'World';
    changeHandler(event) {
        this.greeting = event.target.value;
    }
    greeting
    @track data = [];
    @track columns = columns;
    @track error; 

    handleKeyChange( event ) { 
        this.greeting = event.target.value;
        const strLastName = event.target.value; 
        if ( strLastName ) { 
            getContacts( { strLastName } )   
            .then(result => { 
                this.data = result; 
                //console.log('I am here',this.data);
               // console.log(JSON.stringify(result, null, '\t'));
   
            }) 
            .catch(error => { 
                this.error = error; 
            }); 
        } else 
        this.data = undefined; 
    }

   

    //async connectedCallback() {
    //    const data = await fetchDataHelper({ amountOfRecords: 100 });
    //    this.data = data;
    //}
}


