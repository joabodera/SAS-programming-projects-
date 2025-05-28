* The percentage of body fat, age, weight, height, and 10 body circumference measurements (for example, abdomen) were recorded for 252 men by Dr. Roger W. Johnson of Calvin College in Minnesota. The data are in the stat1.bodyfat2 data set. Body fat, one measure of health, has been accurately estimated by a water displacement measurement technique.;

* Step 1- view the data;

proc print data=stat1.bodyfat2;
run; 

proc univariate data=stat1.bodyfat2;
run;

* Step 2 - run the correlations;
%let variable1=Age Weight Height Neck Chest 
Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist; 

ods graphics/reset=all imagemap; 
proc corr data=stat1.bodyfat2 rank
	      plots(only)=scatter(nvar=all ellipse=none);
	var &variable1;
	with PctBodyFat2;
	title "Correlations and Scatter Plots of Variables against %Bodyfat";
run;

title;

*Write another PROC CORR step, to look at only the last three variables, Biceps, Forearm, and Wrist;
%let variable2=Biceps Forearm Wrist;

ods graphics/reset = all imagemap;
ods select scatterplot;
proc corr data=stat1.bodyfat2 rank
	      plots(only)=scatter(nvar=all ellipse=none);
	var &variable2;
	with PctBodyFat2;
	title "Correlations and Scatter Plots of Biceps, Forearm, and Wrist Variables against %Bodyfat";
run;

*Determine whether any of the predictor variables are connected to each other to 
determine whther there is any colinearity between variables;

ods graphics off;
proc corr data=STAT1.bodyfat2
		  nosimple
		  best=5;
	var &variable1;
	title "Correlations and Scatter Plot Matrix of Top 5 Predictors";
run;

title;
