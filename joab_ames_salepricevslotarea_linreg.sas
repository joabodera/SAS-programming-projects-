*Linear Regression to determine the relationship between Saleprice and Lot Area;

ods graphics;

proc reg data=stat1.ameshousing3;
	model SalePrice=Lot_Area;
	title "Simple Regression with Lot Area as Regressor";
run;
quit;

title;