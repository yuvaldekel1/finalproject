real_tacho_traverse_system=frd(real_system_tacho_tr.o2i1,real_system_tacho_tr.o2i1x,'FrequencyUnit','Hz');
real_gyro_traverse_system=frd(real_system_gyro_tr.o2i1/(-1),real_system_gyro_tr.o2i1x,'FrequencyUnit','Hz');
figure;
g_tacho_az=bodeplot(real_tacho_traverse_system,2*pi*(real_system_tacho_tr.o2i1x));
setoptions(g_tacho_az,'FreqUnits','Hz','Grid','on');
title('plant tacho-traverse')
hold on;
g_tacho_simulation_traverse=bodeplot(tacho_traverse_model,2*pi*(real_system_tacho_tr.o2i1x));
setoptions(g_tacho_simulation_traverse,'FreqUnits','Hz','Grid','on');
legend('real system','model')
figure;
g_gyro_az=bodeplot(real_gyro_traverse_system,2*pi*(real_system_gyro_tr.o2i1x));
setoptions(g_gyro_az,'FreqUnits','Hz','Grid','on');
title('plant-gyro-traverse');
hold on;
g_gyro_simulation_traverse=bodeplot(gyro_traverse_model,2*pi*(real_system_gyro_tr.o2i1x));
setoptions(g_gyro_simulation_traverse,'FreqUnits','Hz','Grid','on');
legend('real system','model')