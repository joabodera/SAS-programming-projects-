* Comparing sale price to multiple home variables;

proc sgscatter data=stat1.ameshousing3;
	plot SalePrice*Gr_Liv_Area/reg;
	title "Associations Above Grade Living Are with Sale Price";
run;

* Run multiple scatter plots to observe relationships between Sale Price and other variables;
%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
	Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
	
options nolabel;
proc sgscatter data=stat1.ameshousing3;
	plot SalePrice*(&interval)/reg;
	title "Associations of Interval Variables with Sale Price";
run;

