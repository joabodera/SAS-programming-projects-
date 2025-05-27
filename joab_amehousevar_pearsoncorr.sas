* Run multiple correlation scatter plots to observe relationships between Sale Price and other variables;
%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
	Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
	
ods graphics/reset=all imagemap; 
proc corr data=stat1.ameshousing3 rank
	      plots(only)=scater(nvar=all ellipse=none);
	var &interval;
	with SalePrice;
	id PID;
	title "Correlations and Scatter Plots with Sale Price";
run;

title;

* Run a correlation between predictor variables;
ods graphics off;
proc corr data=STAT1.ameshousing3
		  nosimple
		  best=3;
	var &interval;
	title "Correlations and Scatter Plot Matrix of Predictors";
run;

title;