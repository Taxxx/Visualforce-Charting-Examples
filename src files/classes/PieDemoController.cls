public with sharing class PieDemoController {  
    public Campaign camp {get;set;}
    
    public PieDemoController(ApexPages.StandardController std){
        camp = (Campaign)std.getRecord();
        
    }
    
    public List<PieWedgeData> getPieData() {
        List<PieWedgeData> data = new List<PieWedgeData>();
        List<AggregateResult> opps = [SELECT SUM(Amount) monthlyRevenue, COUNT(Name) numOppsClosedWon,
                  CALENDAR_MONTH(CloseDate) theMonth
             FROM Opportunity
             WHERE CampaignId =: camp.id 
             GROUP BY CALENDAR_MONTH(CloseDate)];
        
        for(AggregateResult ar : opps){
        	String month = String.valueOf(ar.get('theMonth')); //this comes out as a number, not a word value
        	Integer revenue = Integer.valueOf(ar.get('monthlyRevenue'));
        	data.add(new PieWedgeData(month, revenue));
        }
        return data;
    }
    
    public class PieWedgeData {
        public String name { get; set; }
        public Integer data { get; set; }

        public PieWedgeData(String name, Integer data) {
            this.name = name;
            this.data = data;
        }
    }
}