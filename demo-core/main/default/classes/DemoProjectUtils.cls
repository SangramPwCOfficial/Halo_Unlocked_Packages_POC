public class DemoProjectUtils {
    public static String getStatusMessage(Demo_Project__c project) {
        return 'Project ' + project.Name + ' is currently: ' + project.Demo_Status__c;
    }

    public static void logProjectInfo(Demo_Project__c project) {
        System.debug(getStatusMessage(project));
        System.debug('Logging: ' + project.Name + ' - ' + project.Demo_Status__c);
    }
    
    @InvocableMethod(label='Log Project Info')
	public static void logProject(List<Demo_Project__c> projects) {
    	for (Demo_Project__c p : projects) {
        	logProjectInfo(p);
    	}
	}

}