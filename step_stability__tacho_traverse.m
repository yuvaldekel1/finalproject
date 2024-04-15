cancel_zero=tf([1/(2*pi*4.5)^2 0.014/1.7 1],[1/(2*pi*3.62)^2 0.014/1.7 1]);
cancel_zero_1=tf(1,[1/(2*pi*6.06)^2 0.6/328.057 1]);
notch_tacho_traverse1=tf([1 2*0.08*2*36.1*pi (2*pi*36.1)^2],[1 2*0.94*2*36.1*pi (2*pi*36.1)^2]);
phase_lead_tacho=tf([0.0083 1],[0.0011 1]);
PI_tacho_traverse=tf([1 2*pi*3],[1 0]);
controller_tacho_traverse=tf([1 2*0.03*2*6.06*pi (2*pi*6.06)^2],[1 2*0.03*2*6.06*pi (2*pi*6.06)^2])*cancel_zero_1*phase_lead_tacho*25.6*PI_tacho_traverse*notch_tacho_traverse1;
try2=tf([1 6.575 798.3],[1 4.421 536.8])*tf(1439,[1 2.626 1439])* tf([1 2*0.08*2*30*pi (2*pi*30)^2],[1 2*0.94*2*30*pi (2*pi*30)^2])*tf([1 2*pi*15],[1 0])*6*tf([0.042 1],[0.0053 1])*tf([0.016 1],[0.008 1]);
open_loop_tacho_simulation_traverse=tacho_traverse_model*try2;
close_loop_tacho_simulation_traverse=feedback(open_loop_tacho_simulation_traverse,1);
open_loop_tacho_traverse_real=try2*real_tacho_traverse_system;
close_loop_tacho_traverse_real=open_loop_tacho_traverse_real/(1+open_loop_tacho_traverse_real);
figure;
g_tacho_az_open_loop=bodeplot(open_loop_tacho_traverse_real,2*pi*(real_system_tacho_tr.o2i1x));
setoptions(g_tacho_az_open_loop,'FreqUnits','Hz','Grid','on');
title('open loop tacho-traverse real system','FontSize',15)
figure;
g_tacho_az_close_loop=bodeplot(close_loop_tacho_traverse_real,2*pi*(real_system_tacho_tr.o2i1x));
setoptions(g_tacho_az_close_loop,'FreqUnits','Hz','Grid','on');
title('close loop tacho-traverse real system','FontSize',15)
figure;
g_tacho_az_open_loop_simulation=bodeplot(open_loop_tacho_simulation_traverse,2*pi*(real_system_tacho_tr.o2i1x));
setoptions(g_tacho_az_open_loop_simulation,'FreqUnits','Hz','Grid','on');
title('open loop tacho-traverse simulation','FontSize',15)
figure;
g_tacho_az_close_loop_simulation=bodeplot(close_loop_tacho_simulation_traverse,2*pi*(real_system_tacho_tr.o2i1x));
setoptions(g_tacho_az_close_loop_simulation,'FreqUnits','Hz','Grid','on');
title('close loop tacho-traverse simulation','FontSize',15)
figure;
step(close_loop_tacho_simulation_traverse)
grid on;