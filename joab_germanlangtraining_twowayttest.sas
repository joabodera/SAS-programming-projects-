* Elli Sagerman, a Masters of Education candidate in German Education at the University of North Carolina at Chapel Hill in 2000, collected data for a study. She looked at the effectiveness of a new type of foreign language teaching technique on grammar skills. She selected 30 students to receive tutoring. Fifteen received the new type of training during the tutorials and 15 received standard tutoring. Two students moved from the district before completing the study. Scores on a standardized German grammar test were recorded immediately before the 12-week tutorials and again 12 weeks later at the end of the trial. Sagerman wanted to see the effect of the new technique on grammar skills.;

* Take a look at the variables first; 
proc print data = stat1.german;
run; 

* Run a two way ttest to find out;
proc ttest data = stat1.german plots(shownull)=interval;
	class Group;
	var Change;
	title "Two-Sample t-test Improvement in grammar skills treatment vs control";
run; 