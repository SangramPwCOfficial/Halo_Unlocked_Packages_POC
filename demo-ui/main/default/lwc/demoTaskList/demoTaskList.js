/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 26-04-2025
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   26-04-2025   Sangram Keshari Upadhyaya   Initial Version
**/
import { LightningElement, wire } from 'lwc';
import getDemoTasks from '@salesforce/apex/DemoTaskController.getDemoTasks';

export default class DemoTaskList extends LightningElement {
    tasks = [];

    @wire(getDemoTasks)
    wiredTasks({ error, data }) {
        if (data) {
            this.tasks = data;
        }
    }
}