* Fitting a Binary Logistic Regression Model Using PROC LOGISTIC continuous variable Basement area vs categorical variable Bonus;

ods graphics on;

proc logistic data=stat1.ameshousing3 alpha=0.05
			  plots(only)=(effect oddsratio);
	model Bonus(event='1')=Basement_Area/clodds=pl;
	title 'LOGISTIC MODEL (1):Bonus=Basement_Area';
run; 