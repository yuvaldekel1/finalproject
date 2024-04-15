s=tf('s');
delay=-1.5*(6.2*10^-3/1.9);
y=exp(delay*s);
elev_tacho_pod=load ("OE1_POD_taho.mat") ;
elev_gyro_pod=load("OE1_POD_gyro.mat");
pod_tacho_elevation_system=frd(elev_tacho_pod.o2i1,elev_tacho_pod.o2i1x,'FrequencyUnit','Hz');
pod_gyro_elevation_system=frd(elev_gyro_pod.o2i1,elev_gyro_pod.o2i1x,'FrequencyUnit','Hz');
figure;
g_pod_el=bodeplot(pod_tacho_elevation_system,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el,'FreqUnits','Hz','Grid','on');
title('POD tacho-elevation');
hold on;
g_pod_el_simulation=bodeplot(y*tacho_pod_model,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_simulation,'FreqUnits','Hz','Grid','on');
legend('real system','simulation')
figure;
g_gyro_el_pod=bodeplot(pod_gyro_elevation_system,2*pi*(elev_gyro_pod.o2i1x));
setoptions(g_gyro_el_pod,'FreqUnits','Hz','Grid','on');
title('POD gyro-elevation')
hold on;
g_pod_el_simulation_gyro=bodeplot(y*gyro_pod_model,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_simulation_gyro,'FreqUnits','Hz','Grid','on');
legend('real system','simulation')
close_loop_pod_tacho=pod_tacho_elevation_system/(1+pod_tacho_elevation_system);
close_loop_pod_gyro=pod_gyro_elevation_system/(1+pod_gyro_elevation_system);
close_loop_pod_tacho_sim=feedback(y*tacho_pod_model,1);
close_loop_pod_gyro_sim=feedback(y*gyro_pod_model,1);
figure;
g_pod_el_cl=bodeplot(close_loop_pod_tacho,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_cl,'FreqUnits','Hz','Grid','on');
title('POD tacho-elevation close loop');
hold on;
g_pod_el_simulation_cl=bodeplot(close_loop_pod_tacho_sim,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_simulation_cl,'FreqUnits','Hz','Grid','on');
legend('real system','simulation')
figure;
g_gyro_el_pod_cl=bodeplot(close_loop_pod_gyro,2*pi*(elev_gyro_pod.o2i1x));
setoptions(g_gyro_el_pod_cl,'FreqUnits','Hz','Grid','on');
title('POD gyro-elevation close loop')
hold on;
g_pod_el_simulation_gyro_cl=bodeplot(close_loop_pod_gyro_sim,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_simulation_gyro_cl,'FreqUnits','Hz','Grid','on');
legend('real system','simulation')