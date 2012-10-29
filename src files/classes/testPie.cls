@isTest
private class testPie {
	static testMethod void testPie() {
		PageReference pageRef = Page.PieDemo;
		Test.setCurrentPageReference(pageRef);
		
		Campaign newCampaign = new Campaign(Name='Test Campaign');
		insert newCampaign;
		
		Integer i;
		List<Opportunity> testOpps = new List<Opportunity>();
		for(i=1; i <13; i++){
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
		
		ApexPages.StandardController sc = new ApexPages.StandardController(newCampaign);
		PieDemoController testController = new PieDemoController(sc);
		
		String testName = 'test';
		Integer testSize = 1000;
		PieDemoController.pieWedgeData innerClass = new PieDemoController.pieWedgeData(testName, testSize);
		List<PieDemoController.pieWedgeData> testList = testController.getPieData();
	}
}