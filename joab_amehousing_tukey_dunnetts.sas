ods graphics;

ods select lsmeans diff diffplot controlplot;
proc glm data=stat1.ameshousing3 plots(only)=(diffplot(center) controlplot);
	class Heating_QC;
	model SalePrice=Heating_QC;
	lsmeans Heating_QC/pdiff=all adjust=tukey;
	lsmeans Heating_QC/pdiff=control('Average/Typical') adjust=dunnet;
	format Heating_QC $Heating_QC.;
	title "Post-Hoc Analysis of ANOVA - Heating Quality as Predictor";
run;
quit;

title; 