import("stdfaust.lib");
import("seam.lib");

frw= hslider("freqrw", 1, 0, 10, 0.001);
maxf = hslider("maxrw", 0.001, 0.001, 1, 0.001);
grw= hslider("gainrw", 0, 0, 10, 0.01):si.smoo;

rndwmc(frw,imin,imax,omin,omax) = no.multinoise(8): par(i,8,_*grw*(i+1):sfi.lp1p(frw*(i+1))) : par(i,8,sba.scalel(imin,imax,omin,omax)*maxf);

t = hslider("tau", 0.001, 0.001, 1, 0.001);
g= hslider("feed", 0, -0.99, 0.99, 0.01):si.smoo;

dfl(x,rw)=x:sms.dflcvm(ma.SR*2,(t+rw)*ma.SR,g);
apfprw(x,rw)= x:sms.apfvm(ma.SR*2,((t+rw)*ma.SR),1/sqrt(2));
//process=dfl;rndwmc(frw,-1,1,0,maxf)
shrederrw = _<:si.bus(4),rndwmc(frw,-1,1,0,1):(_,ro.crossn1(6):_,_,_,ro.crossn1(4):_,_,_,_,_,ro.crossn1(2):par(i,4,dfl):>_),si.bus(4):apfprw,si.bus(3):apfprw,si.bus(2):apfprw,si.bus(1):apfprw;


mspan(pp,rad,x)= mid(pp,rad,x),side(rad,x)
with{
mid(pp,rad,x)=(x*(1-pp)) + (x*cos(rad)*pp);
side(rad,x)=x*sin(rad);
};
pp=(hslider("Polar Pattern",50,1,100,1)/100);

azi = 0-hslider("azymuth1",0,-180,180,0.01):si.smoo;
azirev = 0-hslider("azymuthrev",0,-180,180,0.01):si.smoo;
a=(azi)*(ma.PI/180);
a1=(azirev)*(ma.PI/180);


i=0-hslider("vmicrev",0,-180,180,0.01):si.smoo;


vmicMSrev(i) = _*cos(rad(i))+_*sin(rad(i))
with{
    rad(i) = (0-i)*ma.PI/180;
};

vmicMS(i) = _*cos(rad(i))+_*sin(rad(i))
with{
    rad(i) = (0-i)*90*ma.PI/180;
};
rev=vmicMSrev(i):shrederrw:mspan(pp,(i*ma.PI/180));
dec=par(i,4,vmicMS(i));
process=rev;