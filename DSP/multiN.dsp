import ("stdfaust.lib");
gfi(i)= hslider("[%i] %i amp_noise ", 0,0,1,0.001) : si.smoo;

process=no.multinoise(8):par(i,8,_*gfi(i));