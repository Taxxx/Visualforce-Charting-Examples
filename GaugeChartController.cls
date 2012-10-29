public class GaugeChartController {
    public String acctId {get;set;}
    
    public GaugeChartController(ApexPages.StandardController controller){
        acctId = controller.getRecord().Id; //'001x00000035Sm4' ;
    }
    
    public List<gaugeData> getData() {
        Decimal TotalAmount = 0.00;
        Integer TotalOpptys = 0;
        List<Opportunity> ClosedWonOpptys = [select Amount, CloseDate 
                                                from Opportunity 
                                                where AccountId =: acctId 
                                                and StageName = 'Closed Won'];
        for(Opportunity opp : ClosedWonOpptys){
            if(opp.CloseDate.month() == date.Today().month()){
                TotalAmount += opp.Amount;
                TotalOpptys++;
            }
        }
        List<gaugeData> data = new List<gaugeData>();
        data.add(new gaugeData(TotalOpptys + ' Opptys', Integer.valueOf(TotalAmount)));
        return data;
    }

    public class gaugeData {
        public String name { get; set; }
        public Integer size { get; set; }

        public gaugeData(String name, Integer data) {
            this.name = name;
            this.size = data;
        }
    }
}