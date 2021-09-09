title "read rop csv data";

/*read data from dir and insert it into the work lib*/
proc import 
		datafile="/home/u59157287/sasuser.v94/Data_Operational_Parameters.csv" 
		out=ROP_data dbms=csv replace;
	getnames=yes;
	options validvarname=V7;
run;

title "print rop csv data";

proc print data=work.ROP_data (obs=5);
run;

title "print means rop csv data";

proc means data=work.ROP_data;
run;

/*
proc means data=work.ROP_data clm;
run;

proc means data=work.ROP_data clm t prt;
run;
*/
title "WOB vs RPM plot";

proc plot data=work.ROP_data;
	plot RPM*WOB__lbf_;
	run;
	
/* generate stat for all vars*/
title "stats for all var";
proc univariate NORMAL PLOT DATA=work.ROP_data;
run;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	