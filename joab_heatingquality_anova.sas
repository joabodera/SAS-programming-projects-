proc glm data = stat1.ameshousing3 plots=diagnostics;
	class Heating_QC;
	model SalePrice=Heating_QC;
	means Heating_QC/hovtest=levene;
	format Heating_QC $Heating_QC.;
	title "One-Way ANOVA with Heating Quality as Predictor";
run;
quit;

title; 