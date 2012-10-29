@isTest
private class testLineAndBar {
	static testMethod void testLineAndBar() {
		PageReference pageRef = Page.LineAndBarDemo;
		Test.setCurrentPageReference(pageRef);
		
		Integer i;
		List<Opportunity> testOpps = new List<Opportunity>();
		for(i=1; i <13; i++){
			Opportunity oTest = new Opportunity();
			oTest.name = 'Opp Test'+i;
			oTest.Amount = 1111;
			oTest.LeadSource = 'Phone Inquiry';
			oTest.StageName = 'Closed Won';
			oTest.CloseDate = date.newinstance(2011,i,1);
			testOpps.add(oTest);
		}
		insert testOpps;
		
		LineAndBarController testController = new LineAndBarController();
		List<AggregateResult> testList = testController.getData();
	}
}