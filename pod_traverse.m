s=tf('s');
delay=-1.2*(6.2*10^-3/1.9);
y=exp(delay*s);
controller_pod_traverse_tacho=tf([1 2*pi*50*2*0.05 (2*pi*50)^2],[1 2*pi*0.5*50*2 (2*pi*50)^2])*tf([60 60*2*pi*1],[1 0]);
controller_pod_traverse_gyro=tf([1 2*pi*43*2*0.4  (2*pi*43)^2],[1 2*pi*43*2*4 (2*pi*43)^2])*tf([1 87.96 3948],[1 62.83 3948])*tf([1 157.1 1.053*10^5],[1 28.47 1.911*10^4])*tf([1 2*pi*26.5*0.4*2 (2*pi*26.5)^2],[1 2*pi*26.5*0.7*2 (2*pi*26.5)^2])*tf([1 2*pi*20*0.35*2 (2*pi*20)^2],[1 2*pi*20*0.7*2 (2*pi*20)^2])*tf([0.199 18.6 18.6],[1 0])*tf([0.0095 1],[0.0067 1]);
trav_tacho_pod=load ("OT2_pod_taho.mat") ;
trav_gyro_pod=load("OT2_pod_gyro.mat");
pod_tacho_traverse_system=frd(trav_tacho_pod.o2i1,trav_tacho_pod.o2i1x,'FrequencyUnit','Hz');
pod_gyro_traverse_system=frd(trav_gyro_pod.o2i1,trav_gyro_pod.o2i1x,'FrequencyUnit','Hz');
figure;
g_tacho_pod_traverse=bodeplot(pod_tacho_traverse_system,2*pi*(trav_tacho_pod.o2i1x));
setoptions(g_tacho_pod_traverse,'FreqUnits','Hz','Grid','on');
title('POD tacho-traverse');
hold on;
bode(linsys1*y)
xlim([1 100]);
figure;
g_gyro_el=bodeplot(pod_gyro_traverse_system*controller_pod_traverse_gyro,2*pi*(trav_gyro_pod.o2i1x));
setoptions(g_gyro_el,'FreqUnits','Hz','Grid','on');
hold on;
delay1=-2*(6.2*10^-3/1.9);
y=exp(delay1*s);
bode(linsys2*y*controller_pod_traverse_gyro)
xlim([1 100])
title('POD gyro-traverse ');
figure;
step(feedback(linsys2*controller_pod_traverse_gyro*y,1))