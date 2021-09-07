*proc print data=sashelp.class;

*read data from sas lib and insert it into the work lib;

data WORK.class;
set sashelp.class;
run;

* now sort by height and desc for name;
proc sort data=class;
by height descending name ;
