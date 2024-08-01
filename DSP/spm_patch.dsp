import("SPM.lib");

gfi = hslider("    amp_noise ", 0,0,1,0.001) : si.smoo;


//param input
azi = 0-hslider("[1]azymuth",0,-180,180,0.01):si.smoo;
group_azy(x)=vgroup("[2]azy_mode",x);
gazy= group_azy(hslider("[0]amp_azy ", 0,0,360,0.001) : si.smoo);
freq_azy = group_azy(hslider("[1]freq azymuth",0,0,1000,0.01));
pp=(hslider("[0]Polar Pattern",50,1,100,1)/100);



process=_,_<:SPM;
//process=par(i,4,_*arad(i));
//process=rev(a,x);

