* Fitting a Multiple Linear Regression Model Using PROC REG;
proc reg data=stat1.ameshousing3;
	model SalePrice=Basement_Area Lot_Area;
	title "Model with Basement Area and Lot Area";
run;
quit;

* Step 2;
proc glm data=stat1.ameshousing3
		 plot(only)=(contourfit);
		model SalePrice=Basement_Area Lot_Area;
		store out=multiple;
		title "Model with Basement Area and Gross Living Area";
run;
quit;

*Step 3;
proc plm restore=multiple plots=all;
	effectplot contour (y=Basement_Area x=Lot_Area);
	effectplot slicefit(x=Lot_Area sliceby=Basement_Area=250 to 1000 by 250);
run;

title;