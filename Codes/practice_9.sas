* insert data from sashelp class and insert into the work libs;
title "call data and insert";

data WORK.class;
	set sashelp.class;
	* define a new variable as follow;
	diff=height - 60;
run;

* print the table;
title "print the table";

proc print;
run;

* do univar as follow and check out the output;
title "print uni-var results";

proc univariate;
run;

