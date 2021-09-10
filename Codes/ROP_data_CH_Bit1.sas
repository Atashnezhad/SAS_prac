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

title "WOB vs RPM plot";

proc plot data=work.ROP_data;
	plot RPM*WOB__lbf_;
	run;

	/* generate stat for all vars*/
	title "stats for all var";

proc univariate NORMAL PLOT DATA=work.ROP_data;
run;

proc Reg data=work.ROP_data;
	title "Example of linear regression";
	model ROP_data_ft_hr=RPM WOB__lbf_ depth__ft_;
	run;

proc corr data=work.ROP_data plots(MAXPOINTS=NONE)=matrix(HISTOGRAM);
	var WOB__lbf_ RPM depth__ft_ ROP_data_ft_hr;
run;