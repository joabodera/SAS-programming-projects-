*Data were collected to determine whether different dosage levels of a drug have an effect on blood pressure for people with one of three types of heart disease. The data are in the stat1.drug data set.

Examine the data with a vertical line plot. Put BloodP on the Y axis, and DrugDose on the X axis, and then stratify by Disease.;

*Step 1;
proc print data=stat1.drug;
run;

/*st103s01.sas*/ /*Part A*/ 

proc sgplot data=STAT1.drug; 
   vline DrugDose / group=Disease stat=mean response=BloodP markers; 
   format DrugDose dosefmt.; 
run;

* Test the hypothesis that the means are equal. Be sure to include an interaction term if the graphical analysis that you performed indicates that would be advisable. ;
ods graphics on;

proc glm data=stat1.drug
		 order=internal
		 plots(only)=intplot;
	class DrugDose Disease;
	model BloodP = DrugDose Disease DrugDose*Disease;
	lsmeans DrugDose*Disease/diff slice=DrugDose;
	store out=interact;
	title "Model with Drug Dose and Disease as Interacting Predictors";
run;
quit;

* To investigate the interaction effect between the two factors, include the SLICE option in the code you just wrote.;
proc plm restore=interact plots=all;
	slice DrugDose*Disease/sliceby=DrugDose adjust=tukey;
	effectplot interaction(sliceby=DrugDose)/clm;
run;

title;

/*st103s01.sas*/ /*Part B*/
ods graphics on;
proc glm data=STAT1.drug plots(only)=intplot;
   class DrugDose Disease;
   model BloodP=DrugDose|Disease;
   lsmeans DrugDose*Disease;
run;
quit;


