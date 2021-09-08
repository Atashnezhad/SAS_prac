* insert data from sashelp class and insert into the work libs;

data WORK.class;
	set sashelp.class;
run;


* run lg model on binary class data;

ods graphics on;
proc logistic data=work.class plots=ALL;
model sex = age height weight;
run;
ods graphics off;