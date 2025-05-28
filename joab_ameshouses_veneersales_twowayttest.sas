* Do homes with Masonry Veneer have a higher sales price than those without?;

* Run a two way ttest to find out;
proc ttest data = stat1.ameshousing3 plots(shownull)=interval;
	class Masonry_Veneer;
	var SalePrice;
	format Masonry_Veneer $NoYes.;
	title "Two-Sample t-test Comparing masonry veneer, No vs. Yes";
run; 
	