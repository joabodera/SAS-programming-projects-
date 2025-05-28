* Analysis of normtemp. 
From an article in the Journal of Statistics Education by Dr. Allen L. Shoemaker from the Psychology Department at Calvin College. 
The data are based on an article in a 1992 edition of JAMA (Journal of the American Medical Association). The notion that the true mean body temperature is 98.6 is questioned. There are 65 males and 65 females. 
There is also some doubt about whether mean body temperatures for women are the same as for men;

* Step 1- understand the dataset;
proc univariate data = stat1.normtemp;
run; 

* Step 1.2 expand analysis of dataset; 
%let interval=BodyTemp HeartRate; 
ods graphics; 
ods select histogram; 
proc univariate data=stat1.NormTemp noprint; 
   var &interval; 
   histogram &interval / normal kernel; 
   inset n mean std / position=ne; 
   title "Interval Variable Distribution Analysis"; 
run;


* Step 2 Perform a one-sample t test to determine whether the mean of body temperatures is 98.6. 
Produce a confidence interval plot of BodyTemp. Use the value 98.6 as a reference;
proc ttest data = stat1.normtemp
	plots(shownull)=interval
	H0=98.6;
	var BodyTemp;
	title "One-Sample t-test testing whether mean BodyTemp = 98.6 degrees Fahrenheit";
run;