@isTest
private class DemoTaskControllerTest {
    @isTest
    static void testGetDemoTasks() {
        // Setup test data
        Demo_Task__c task = new Demo_Task__c(
            Name = 'Demo Task',
            Demo_Status__c = 'Planned'
        );
        insert task;

        // Test method
        Test.startTest();
        List<Demo_Task__c> tasks = DemoTaskController.getDemoTasks();
        Test.stopTest();

        System.assert(tasks.size() > 0);
    }
}