/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 01-05-2025
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   01-05-2025   Sangram Keshari Upadhyaya   Initial Version
**/
@isTest
private class DemoTaskTriggerTest {

    @isTest
    static void testDefaultStatusOnInsert() {
        Demo_Task__c taskWithoutStatus = new Demo_Task__c(
            Name = 'Demo Task 1'
        );

        insert taskWithoutStatus;

        Demo_Task__c insertedTask = [SELECT Id, Demo_Status__c FROM Demo_Task__c WHERE Id = :taskWithoutStatus.Id];

        System.assertEquals('Planned', insertedTask.Demo_Status__c);
    }

    @isTest
    static void testStatusNotOverwrittenOnInsert() {
        Demo_Task__c taskWithStatus = new Demo_Task__c(
            Name = 'Demo Task 2',
            Demo_Status__c = 'In Progress'
        );

        insert taskWithStatus;

        Demo_Task__c insertedTask = [SELECT Id, Demo_Status__c FROM Demo_Task__c WHERE Id = :taskWithStatus.Id];

        System.assertEquals('In Progress', insertedTask.Demo_Status__c);
    }

    @isTest
    static void testBeforeUpdatePath() {
        // Create task
        Demo_Task__c task = new Demo_Task__c(
            Name = 'Demo Task 3',
            Demo_Status__c = 'Planned'
        );
        insert task;

        // Update task to simulate update event
        task.Demo_Status__c = 'Done';
        update task;

        // Assert updated status (no change logic now but triggers the update handler path)
        Demo_Task__c updatedTask = [SELECT Id, Demo_Status__c FROM Demo_Task__c WHERE Id = :task.Id];

        System.assertEquals('Done', updatedTask.Demo_Status__c);
    }
}