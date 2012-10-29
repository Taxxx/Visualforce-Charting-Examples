@isTest
private class testScatter {
	static testMethod void testScatter() {
		PageReference pageRef = Page.ScatterDemo;
		Test.setCurrentPageReference(pageRef);
		
		Campaign newCampaign = new Campaign(Name='Test Campaign');
		insert newCampaign;
		
		Integer i;
		List<Opportunity> testOpps = new List<Opportunity>();
		for(i=0; i <10; i++){
			Opportunity oTest = new Opportunity();
			oTest.name = 'Opp Test'+i;
			oTest.Amount = 1111;
			oTest.LeadSource = 'Phone Inquiry';
			oTest.CampaignId = newCampaign.Id;
			oTest.StageName = 'Closed Won';
			oTest.CloseDate = date.Today();
			testOpps.add(oTest);
		}
		insert testOpps;
		
		ApexPages.currentPage().getParameters().put('id', newCampaign.Id);
		ApexPages.StandardController sc = new ApexPages.StandardController(newCampaign);
		ScatterChartController testController = new ScatterChartController(sc);
		String testName = 'test';
		String testType = 'test type';
		Integer testExpected = 1000;
		Integer testAmount = 1000;
		ScatterChartController.scatterData innerClass = new ScatterChartController.scatterData(testName, testType, testExpected, testAmount);
		
		List<SelectOption> testOptions = testController.getSources();
		List<ScatterChartController.scatterData> testList = ScatterChartController.getRemoteScatterData();
		
		testController.getNoOp();
		
	}
}