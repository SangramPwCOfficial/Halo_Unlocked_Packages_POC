public class DemoTaskHelper {

    public static void setDefaultStatus(List<Demo_Task__c> tasks) {
        for (Demo_Task__c task : tasks) {
            if (String.isBlank(task.Demo_Status__c)) {
                task.Demo_Status__c = 'Planned';
            }
        }
    }
}