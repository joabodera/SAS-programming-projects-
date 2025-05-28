* Montana Gourmet Garlic is a company that uses organic methods to grow garlic. It specializes in hardneck varieties. Knowing a little about experimental methods, the owners design an experiment to test whether growth of the garlic is affected by the type of fertilizer. They limit the experimentation to a Rocambole variety named Spanish Roja, and test three organic fertilizers and one chemical fertilizer (as a control). They "blind" themselves to the fertilizer by using containers with numbers 1 through 4. (In other words, they design the experiment in such a way that they do not know which fertilizer is in which container.) One acre of farmland is set aside for the experiment. The land is divided into 32 beds, and they randomly assign fertilizers to the beds. At harvest, they calculate the average weight of garlic bulbs in each of the beds. The data are in the stat1.garlic data set.;

* Consider an experiment to study four types of fertilizer, labeled 1, 2, 3, and 4. One fertilizer is chemical and the rest are organic. You want to see whether the average weights of the garlic bulbs are significantly different for plants in beds that use different fertilizers.

Test the hypothesis that the means are equal. Use PROC MEANS to generate descriptive statistics for the four groups, and use PROC SGPLOT to produce box plots of bulb weight for the four groups. Submit the code and view the results.

Which fertilizer has the highest mean? Note: for your answer, type the fertilizer number (1, 2, 3, or 4).;

* Step 1 - explore the data;

proc print data=stat1.garlic;
run; 

* Step 2 - determine whether means are equal;
proc means data=stat1.garlic;
run;

* Step 3 use PROC SGPLOT to produce box plots of bulb weight for the four groups;
proc sgplot data=stat1.garlic; 
	vbox BulbWt/category=Fertilizer connect=mean;
	title "Bulb Weight Differences across Different Fertilizer Teatments";
run; 

* Step 4 -Are there any significant differences between fertilizer effects on bulb weight ;
proc glm data = stat1.garlic plots=diagnostics;
	class Fertilizer;
	model BulbWt=Fertilizer;
	means Fertilizer/hovtest=levene;
	title "One-Way ANOVA with BulbWt as Predictor";
run;
quit;

* Consider the analysis of the garlic data set. In the previous exercise, you used PROC GLM to perform one-way ANOVA, and found that there was a statistically significant difference among mean garlic bulb weights for the different fertilizers. Now, perform a post hoc test to look at the individual differences among means.

Use PROC GLM to conduct pairwise comparisons with an experimentwise error rate of α=0.05. (Use the Tukey adjustment.) Submit the code and view the results.

Which types of fertilizer are significantly different?;

ods graphics;

ods select lsmeans diff diffplot controlplot;
proc glm data=stat1.garlic plots(only)=(diffplot(center) controlplot);
	class Fertilizer;
	model BulbWt=Fertilizer;
	lsmeans Fertilizer/pdiff=all adjust=tukey;
	lsmeans Fertilizer/pdiff=control('Average/Typical') adjust=dunnet;
	title "Post-Hoc Analysis of ANOVA with BulbWt as Predictor";
run;
quit;

* Use level 4 (the chemical fertilizer) as the control group and perform a Dunnett's comparison with the organic fertilizers to see whether they affected the average weights of garlic bulbs differently from the control fertilizer.;
ods graphics;

ods select lsmeans diff diffplot controlplot;
proc glm data=stat1.garlic plots(only)=(diffplot(center) controlplot);
	class Fertilizer;
	model BulbWt=Fertilizer;
	lsmeans Fertilizer/pdiff=all adjust=tukey;
	lsmeans Fertilizer/pdiff=control('4') adjust=dunnet;
	title "Post-Hoc Analysis of ANOVA -  BulbWt as Predictor";
run;
quit;

title; 
