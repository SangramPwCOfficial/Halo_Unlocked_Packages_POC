@isTest
private class DemoProjectUtilsTest {
    @isTest
    static void testStatusMessage() {
        Demo_Project__c project = new Demo_Project__c(
            Name = 'Test Project',
            Demo_Status__c = 'Planned'
        );
        String message = DemoProjectUtils.getStatusMessage(project);
        System.assert(message.contains('Planned'));
    }

    @isTest
    static void testLogProjectInfo() {
        Demo_Project__c project = new Demo_Project__c(
            Name = 'Test Project 2',
            Demo_Status__c = 'In Progress'
        );
        DemoProjectUtils.logProjectInfo(project);
        System.assertEquals('Project Test Project 2 is currently: In Progress', DemoProjectUtils.getStatusMessage(project));
    }
}