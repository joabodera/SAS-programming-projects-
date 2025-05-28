proc corr data=stat1.bodyfat2 nosimple
    plots(only)=scatter(nvar=all);
    var Age Weight Height;   
run;