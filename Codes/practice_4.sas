* insert data from sashelp class and insert into the work libs;

data WORK.class;
	set sashelp.class;
run;

*means data;

proc means data=work.class;
run;

*check out gnp lib;

data WORK.gnp;
	set sashelp.gnp;
run;

* check out the gnp table;

proc print data=work.gnp;
run;

* check out gnp lib;

proc means data=work.gnp;
run;

* check out the age and height in class data;

proc means data=work.class;
	var age height;
run;

* check out age based on sex;

proc means data=work.class;
	class sex;
	var age height;
run;