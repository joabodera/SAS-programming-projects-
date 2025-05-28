*Using the stat1.bodyfat2 table, fit a multiple regression model with multiple predictors, and then modify the model by removing the least significant predictors.  

Note: Turn off ODS Graphics.

Run a regression of PctBodyFat2 on the variables Age, Weight, Height, Neck, Chest, Abdomen, Hip, Thigh, Knee, Ankle, Biceps, Forearm, and Wrist. 

Compare the ANOVA table with this one from the model with only Weight. What is different?;

ods graphics off;

proc reg data=stat1.bodyfat2;
	model PctBodyFat2= Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist;
	title "Model with % Body Fat vs All Variables";
run;
quit;


* To simplify the model, rerun the model from Question 1, but eliminate the variable with the highest p-value. Compare the output with the model from Question 1.
Did the p-value for the model change?;

ods graphics off;

proc reg data=stat1.bodyfat2;
	model PctBodyFat2= Age Weight Height Neck Chest Abdomen Hip Thigh Ankle Biceps Forearm Wrist;
	title "Model with % Body Fat vs All Variables (except for Knee - the highest p-value variable)";
run;
quit;

* To simplify the model further, rerun the model from Question 4, but eliminate the variable with the highest p-value. How did the output change from the previous model?;

ods graphics off;

proc reg data=stat1.bodyfat2;
	model PctBodyFat2= Age Weight Height Neck Abdomen Hip Thigh Ankle Biceps Forearm Wrist;
	title "Model with % Body Fat vs All Variables (except for Chest and Knee - the highest p-value variables)";
run;
quit;
