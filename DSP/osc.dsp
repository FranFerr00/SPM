import("stdfaust.lib");
f=hslider("freq", 100, 20, 10000,1):si.smoo;
g=hslider("gain", 0.5, 0, 1,0.01):si.smoo;
process=os.osc(f)*g;
