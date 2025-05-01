public class DemoTaskController {
    @AuraEnabled(cacheable=true)
    public static List<Demo_Task__c> getDemoTasks() {
        return [SELECT Id, Name, Demo_Status__c FROM Demo_Task__c LIMIT 10];
    }
}