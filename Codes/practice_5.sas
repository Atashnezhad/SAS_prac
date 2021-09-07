* insert data from sashelp class and insert into the work libs;

data WORK.class;
	set sashelp.class;
run;

*check out if a number is in the upper and lower confidence limits;

proc means data=work.class clm;
	class sex;
	var age;
run;

* define a new variable in the work.class lib;

data work.class;
	set work.class;
	agem=age-13;
run;

*check out the table;

proc print;
run;

* check out the t and prt values;

proc means data=work.class clm t prt;
	class sex;
	var agem;
run;

* use ttest as follow;

proc ttest data=work.class h0=12;
	var age;
run;