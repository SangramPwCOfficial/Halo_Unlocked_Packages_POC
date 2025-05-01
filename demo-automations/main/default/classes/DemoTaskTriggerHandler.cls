public class DemoTaskTriggerHandler {

    public static void handleBeforeInsert(List<Demo_Task__c> newTasks) {
        DemoTaskHelper.setDefaultStatus(newTasks);
    }
    
    public static void handleBeforeUpdate(List<Demo_Task__c> newTasks, Map<Id, Demo_Task__c> oldTaskMap) {
        // (Optional) Future: Add update-specific logic here
    }
}