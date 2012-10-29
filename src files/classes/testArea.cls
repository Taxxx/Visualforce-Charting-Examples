@isTest
private class testArea {
	static testMethod void testArea() {
		PageReference pageRef = Page.AreaDemo;
		Test.setCurrentPageReference(pageRef);
		
		AreaDemoController testController = new AreaDemoController();
		
		String testName = 'test';
		Integer testData1 = 1;
		Integer testData2 = 2;
		Integer testData3 = 3;
		AreaDemoController.Data innerClass = new AreaDemoController.Data(testName, testData1, testData2, testData3);
		List<AreaDemoController.Data> testList = testController.getData();
	}
}