data faradars_1;
input sex$ 1-1 age 2-3 hight 4-6;
datalines;
f23504
m32543
f32424
;
run;

proc print data=faradars_1;
run;