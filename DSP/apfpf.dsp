import("seam.lib");
t1 = hslider("tau1", 1, 1, 1000, 2);
t2 = hslider("tau2", 1,1, 1000, 2);
g1=1/sqrt(2) ;








//process=apf(g,t);
apfv(t1)=sms.apfvm(ma.SR,t1,1/sqrt(2));

apfpfs(t1,t2)=_<:*(-g1)+(+~(( de.sdelay(10000,512,t2):apfv(t1)):_*g1):*(1-g1*g1));
//apfpfc(t1)=_<:*(-g1)+(((+ : de.sdelay(10000,512,t3):seq(i,5,apfv((t1)*i)))~_*g1):*(1-g1*g1));
//process=_:seq(i,10,apfpfs(t1,t2));
process=seq(i,48,apfpfs(t1,t2));
