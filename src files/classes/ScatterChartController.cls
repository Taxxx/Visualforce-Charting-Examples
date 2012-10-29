public class ScatterChartController {
	public String source {get;set;}

    public ScatterChartController(ApexPages.StandardController controller){
    	source = 'all';
    }
    
    public List<SelectOption> getSources(){
    	List<SelectOption> sources = new List<SelectOption>();
    	sources.add(new SelectOption('All','All'));
    	sources.add(new SelectOption('Web','Web')); 
    	sources.add(new SelectOption('Phone Inquiry','Phone Inquiry'));
    	sources.add(new SelectOption('Partner Referral','Partner Referral'));
    	sources.add(new SelectOption('Purchased List','Purchased List'));
    	sources.add(new SelectOption('Other','Other'));
    	return sources;
    }
    
    @RemoteAction
    public static List<scatterData> getRemoteScatterData() {
    	String campId = ApexPages.currentPage().getParameters().get('id');
        List<scatterData> data = new List<scatterData>();
        
        List<Opportunity> opps = [select Name, Id, Amount, ExpectedRevenue, LeadSource from Opportunity where CampaignId =: campId]; //'701x0000000jDf8'
        for(Opportunity opp : opps){
       		data.add(new scatterData(opp.Name, opp.LeadSource, Integer.valueOf(opp.ExpectedRevenue), Integer.valueOf(opp.Amount)));
        }
        return data;
    }
    
    public PageReference getNoOp() {
    	return null;
    }
    
    public class scatterData {
        public String name { get; set; }
        public String type { get;set; }
        public Integer expected { get;set; }
        public Integer amount { get;set; }      

        public scatterData(String name, String type, Integer data1, Integer data2) {
            this.name = name;
            this.type = type;
            this.expected = data1;
            this.amount = data2;
        }
    }
}