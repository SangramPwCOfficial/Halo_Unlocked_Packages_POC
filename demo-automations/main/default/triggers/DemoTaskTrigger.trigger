trigger DemoTaskTrigger on Demo_Task__c (before insert, before update) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            DemoTaskTriggerHandler.handleBeforeInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            DemoTaskTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
}