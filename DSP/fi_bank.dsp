import("stdfaust.lib");
gfi(i)= hslider("%i amp_band ", 0,0,1,0.001) : si.smoo;
O=5;
M=hslider("FpO ", 3,2,10,0.01);
N=20;
//fibank=fi.highpass(order,50),par(i,15,(fi.lowpass(order,((i+1)*100)+q) :fi.highpass(order,((i+1)*100)-q))),fi.lowpass(order,16000);
fibank=an.mth_octave_analyzer(O,M,5000,N);
process=_:fibank:par(i,N,_*gfi(i));
//process=_<:(fibank);