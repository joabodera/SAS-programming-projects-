*Step 1;
ods graphics on;

proc glm data=stat1.ameshousing3
		 order=internal
		 plots(only)=intplot;
	class Season_Sold Heating_QC;
	model SalePrice = Heating_QC Season_Sold Heating_QC*Season_Sold;
	lsmeans Heating_QC*Season_Sold/diff slice=Heating_QC;
	format Season_Sold Season.;
	store out=interact;
	title "Model with Heating Quality and Season as Interacting Predictors";
run;
quit;

* Step 2;
proc plm restore=interact plots=all;
	slice Heating_QC*Season_Sold/sliceby=Heating_QC adjust=tukey;
	effectplot interaction(sliceby=Heating_QC)/clm;
run;

title;