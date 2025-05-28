* Sale price differences across Central Air Ameshousing;

* Perform an SGPLOT to observe these difference;
proc sgplot data = stat1.ameshousing3;
	vbox SalePrice/category=Central_Air connect=mean;
	title "Sale Price Differences across Central Air";
run; 

* the plot shows that houses with central air sell at higher price than those that do not;

