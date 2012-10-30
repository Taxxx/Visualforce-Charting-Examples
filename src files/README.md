This folder contains classes and pages for each chart type. Each class also comes with an associated test class.

All of these chart types work off of standard objects and fields with the exception of the radar chart that works off of custom fields stored to a field set called 'Radar Set.'


Use case by chart type:
Gauge Chart: Displays total value of all opportunities related to an account that will close or have closed this month.

Radar Chart: Displays customer satisfaction ratings. In my field set I have 10 custom fields (Value__c, Usefulness__c, Satisfaction__c,Responsiveness__c, Reliability__c, Helpfulness__c, Friendliness__c, Effectiveness__c, Content__c, Consistency__c) that are all number fields on a scale between 1-10, These fields are stored to the 'RadarSet' field set, and are queried for in the getter method for the chart data.

Scatter Chart: Displays all opportunities related to a campaign with the x-axis being the expected value, and the y-axis being the actual amount of each opportunity. The select list allows you to change which opportunities you want to plot by showing only opportunities of a particular lead source. This chart uses JS Remoting to handle the advanced rendering.

Line and Bar Chart: Displays all closed won opportunities from 2011. This will plot The monthly sales total in a bar chart with the total number of opportunities overlaid using a line graph.

Pie Chart: Displays the sum of total opportunity values for each month related to a given campaign.
