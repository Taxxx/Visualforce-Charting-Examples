@isTest
private class testGauge {
	static testMethod void testGauge() {
		PageReference pageRef = Page.GaugeDemo;
		Test.setCurrentPageReference(pageRef);
		
		Account newAccount = new Account(Name='Test Account');
		insert newAccount;
		
		Integer i;
		List<Opportunity> testOpps = new List<Opportunity>();
		for(i=0; i <10; i++){
			Opportunity oTest = new Opportunity();
			oTest.name = 'Opp Test'+i;
			oTest.Amount = 1111;
			oTest.LeadSource = 'Phone Inquiry';
			oTest.AccountId = newAccount.Id;
			oTest.StageName = 'Closed Won';
			oTest.CloseDate = date.Today();
			testOpps.add(oTest);
		}
		insert testOpps;
		
		ApexPages.StandardController sc = new ApexPages.StandardController(newAccount);
		GaugeChartController testController = new GaugeChartController(sc);
		
		String testName = 'test';
		Integer testSize = 1000;
		GaugeChartController.gaugeData innerClass = new GaugeChartController.gaugeData(testName, testSize);
		List<GaugeChartController.gaugeData> testList = testController.getData();
	}
}