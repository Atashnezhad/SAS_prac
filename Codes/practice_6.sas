* insert data from sashelp class and insert into the work libs;

data WORK.class;
	set sashelp.class;
run;

* lets check out and see ig height and weight affect the age;

proc reg data=WORK.class;
	model age=height weight;
	run;
	* as it is seen in the results section, weight affects the age (pr<0.05) unlike the height;
	* also there should be no trend for residual plots;