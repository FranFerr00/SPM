import ("stdfaust.lib");
f=hslider("freq", 20, 20, 5000,1):si.smoo;
g(i)=hslider("gain %i", 0, 0, 1,0.01):si.smoo;
dev=hslider("dev", 1, 0.01, 100,0.01):si.smoo;
osc_bank=par(i, 10,os.osc(f+((i)*dev))*g(i));
process=osc_bank;
