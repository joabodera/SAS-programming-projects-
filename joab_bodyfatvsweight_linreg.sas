* Linear Regression to investigate the relationship between % Body Fat and Weight;

ods graphics;

proc reg data=stat1.bodyfat2;
	model PctBodyFat2=Weight;
	title "Simple Regression with Weight as Regressor";
run;
quit;

title;