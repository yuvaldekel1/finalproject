real_tacho_elevation_system=frd(real_system_tacho_el.o2i1,real_system_tacho_el.o2i1x,'FrequencyUnit','Hz');
real_gyro_elevation_system=frd(real_system_gyro_el.o2i1,real_system_gyro_el.o2i1x,'FrequencyUnit','Hz');
figure;
g_tacho_el=bodeplot(real_tacho_elevation_system,2*pi*(real_system_tacho_el.o2i1x));
setoptions(g_tacho_el,'FreqUnits','Hz','Grid','on');
title('plant tacho-elevation')
hold on;
g_tacho_simulation_elevation=bodeplot(tacho_elevation_model,2*pi*(real_system_tacho_el.o2i1x));
setoptions(g_tacho_simulation_elevation,'FreqUnits','Hz','Grid','on');
legend('real system','model')
figure;
g_gyro_el=bodeplot(real_gyro_elevation_system,2*pi*(real_system_gyro_el.o2i1x));
setoptions(g_gyro_el,'FreqUnits','Hz','Grid','on');
title('plant-gyro-elevation');
hold on;
g_gyro_simulation_elevation=bodeplot(gyro_elevation_model,2*pi*(real_system_tacho_el.o2i1x));
setoptions(g_gyro_simulation_elevation,'FreqUnits','Hz','Grid','on');
legend('real system','model')
