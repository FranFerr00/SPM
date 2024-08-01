import("stdfaust.lib");

gain = hslider("gain DISTORSION", 1, 0, 1,0.01) : si.smoo;
t1(in)=(in);
t2(in)=(2*((in)^2)-1);
t3(in)=(4*((in)^3)-3*(in));
t4(in)=(8*((in)^4)-8*((in)^2)+1);
t5(in)=(16*((in)^5)-20*((in)^3)+(in)*5);
t6(in)=(32*((in)^6)-48*((in)^4)+18*((in)^2)-1);
t7(in)=(64*((in)^7)-112*((in)^5)+56*((in)^3)-7*(in));
t8(in)=(128*((in)^8)-256*((in)^6)+160*((in)^4)-32*((in)^2)+1);

fun(in)=(in *gain);

//process=((os.phasor(2,200)-1)*gain)<:t3;//,t3,t4,t5,t6,t7,t8;
process=_*gain*10:ma.tanh/sqrt(2);//,t3,t4,t5,t6,t7,t8;
//process=par(i,100,(os.osc(10*(i+1))*(gain/(i+1)))):>t6;//,t3,t4,t5,t6,t7,t8;