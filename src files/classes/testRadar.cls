@isTest
private class testRadar {
	static testMethod void testRadar() {
		PageReference pageRef = Page.RadarDemo;
		Test.setCurrentPageReference(pageRef);
		Account newAccount = new Account(name='Test Account', Value__c = 5, Usefulness__c = 8, Satisfaction__c = 7, 
		Responsiveness__c = 4, Reliability__c = 10, Helpfulness__c = 7, Friendliness__c = 8, Effectiveness__c = 7, 
		Content__c = 10, Consistency__c = 6);
		
		insert newAccount;
		
		ApexPages.StandardController sc = new ApexPages.standardController(newAccount);
		RadarChartController testController = new RadarChartController(sc);
		List<Map<Object,Object>> testMap = testController.getData();
		
	}
}