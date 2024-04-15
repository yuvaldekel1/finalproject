controller_pod_elevation=150*tf([1 2*pi*1],[1 0]);
close_loop_pod_tacho=pod_tacho_elevation_system*controller_pod_elevation/(1+pod_tacho_elevation_system*controller_pod_elevation);
close_loop_pod_gyro=pod_gyro_elevation_system*controller_pod_elevation/(1+pod_gyro_elevation_system*controller_pod_elevation);
close_loop_pod_tacho_sim=feedback(y*tacho_pod_model*controller_pod_elevation,1);
close_loop_pod_gyro_sim=feedback(y*gyro_pod_model*controller_pod_elevation,1);
close_loop_gyro_sim_angel=tf(1,[1 0])*feedback(gyro_pod_model*controller_pod_elevation,1);
figure;
g_pod_el_ol=bodeplot(pod_tacho_elevation_system*controller_pod_elevation,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_ol,'FreqUnits','Hz','Grid','on');
title('POD tacho-elevation open loop');
hold on;
g_pod_el_simulation_ol=bodeplot(y*tacho_pod_model*controller_pod_elevation,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_simulation_ol,'FreqUnits','Hz','Grid','on');
legend('real system','simulation')
figure;
g_gyro_el_pod_ol=bodeplot(pod_gyro_elevation_system*controller_pod_elevation,2*pi*(elev_gyro_pod.o2i1x));
setoptions(g_gyro_el_pod_ol,'FreqUnits','Hz','Grid','on');
title('POD gyro-elevation open loop')
hold on;
g_pod_el_simulation_gyro_ol=bodeplot(y*gyro_pod_model*controller_pod_elevation,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_simulation_gyro_ol,'FreqUnits','Hz','Grid','on');
legend('real system','simulation')


%%
figure;
g_pod_el_cl=bodeplot(close_loop_pod_tacho,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_cl,'FreqUnits','Hz','Grid','on');
title('POD tacho-elevation close loop');
hold on;
g_pod_el_simulation_cl=bodeplot(close_loop_pod_tacho_sim,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_simulation_cl,'FreqUnits','Hz','Grid','on');
legend('real system','simulation')
figure;
step(close_loop_pod_tacho_sim)
figure;
g_gyro_el_pod_cl=bodeplot(close_loop_pod_gyro,2*pi*(elev_gyro_pod.o2i1x));
setoptions(g_gyro_el_pod_cl,'FreqUnits','Hz','Grid','on');
title('POD gyro-elevation close loop')
hold on;
g_pod_el_simulation_gyro_cl=bodeplot(close_loop_pod_gyro_sim,2*pi*(elev_tacho_pod.o2i1x));
setoptions(g_pod_el_simulation_gyro_cl,'FreqUnits','Hz','Grid','on');
legend('real system','simulation')
figure;
step(close_loop_pod_gyro_sim)
