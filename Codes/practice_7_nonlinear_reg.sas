* make a non-linear data;

data work.non_linear_data;
	input t y @@;
	datalines;
0 4.14 10 8.52 20 16.31
30 32.18 40 64.45 50
98.78 60 151.13 70 224.74 80 341.35 85 423.36
;
run;

* plot the data;

proc plot data=work.non_linear_data;
	plot t*y;
	run;



* fit the model;
proc nlin data=work.non_linear_data;
	parameters b1=5 b=50 g=1000;
	model y=b1*exp((b2*t)/(g+t));
	der.b1=exp((b2*t)/(g+t));
	der.b2=((b1*t)/(g+t))*exp((b2*t)/(g+t));
	der.g=(-(b1*b2*t)/(g+t)**2)exp((b2*t)/(g+t));
	output p=fit r=res;

proc plot;
	plot re*fit='1'/vref=0 box vpos=25;

proc rank normal=rw;
	var res ranks nscore;

proc plot;
	plot res*nscore='*;
run;
quit;