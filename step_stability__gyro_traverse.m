notch_gyro1_traverse=tf([1 2*0.05*2*13*pi (2*pi*13)^2],[1 2*0.65*2*13*pi (2*pi*13)^2]);
notch_gyro2_traverse=tf([1 2*0.08*2*30*pi (2*pi*30)^2],[1 2*0.94*2*30*pi (2*pi*30)^2]);
notch_gyro3_traverse=tf([1 2*0.08*2*68*pi (2*pi*68)^2],[1 2*0.94*2*68*pi (2*pi*68)^2]);
notch_gyro4_traverse=tf([1 2*0.5*2*18*pi (2*pi*18)^2],[1 2*0.05*2*18*pi (2*pi*18)^2]);
notch_gyro6_traverse=tf([1 2*0.08*2*450*pi (2*pi*450)^2],[1 2*0.94*2*450*pi (2*pi*450)^2]);
phase_lead_gyro_traverse=tf([0.012 1],[0.0069 1]);
PI_gyro_traverse=tf([24*0.014 24 26*2*pi*1.7],[1 0]);
controller_gyro_traverse=PI_gyro_traverse*notch_gyro4_traverse*notch_gyro1_traverse*notch_gyro2_traverse*notch_gyro3_traverse*notch_gyro6_traverse;
open_loop_gyro_real_traverse=real_gyro_traverse_system*controller_gyro_traverse;
open_loop_gyro_simulation_traverse=gyro_traverse_model*controller_gyro_traverse;
close_loop_gyro_real_traverse=open_loop_gyro_real_traverse/(1+open_loop_gyro_real_traverse);
close_loop_gyro_simulation_traverse=feedback(open_loop_gyro_simulation_traverse,1);
figure;
g_gyro_az_open_loop=bodeplot(open_loop_gyro_real_traverse,2*pi*(real_system_gyro_tr.o2i1x));
setoptions(g_gyro_az_open_loop,'FreqUnits','Hz','Grid','on');
title('open loop gyro-traverse real system','FontSize',15)
figure;
g_gyro_az_close_loop=bodeplot(close_loop_gyro_real_traverse,2*pi*(real_system_gyro_tr.o2i1x));
setoptions(g_gyro_az_close_loop,'FreqUnits','Hz','Grid','on');
title('close loop gyro-traverse real system','FontSize',15)
figure;
g_gyro_az_open_loop_simulation=bodeplot(open_loop_gyro_simulation_traverse,2*pi*(real_system_gyro_tr.o2i1x));
setoptions(g_gyro_az_open_loop_simulation,'FreqUnits','Hz','Grid','on');
title('open loop gyro-traverse simulation','FontSize',15)
figure;
g_gyro_az_close_loop_simulation=bodeplot(close_loop_gyro_simulation_traverse,2*pi*(real_system_gyro_tr.o2i1x));
setoptions(g_gyro_az_close_loop_simulation,'FreqUnits','Hz','Grid','on');
title('close loop gyro-traverse simulation','FontSize',15)
figure;
step(close_loop_gyro_simulation_traverse)
grid on;
