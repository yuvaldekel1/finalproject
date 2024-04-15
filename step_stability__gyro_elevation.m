PID_gyro=tf([1.6 50],[1 0]);
notch_gyro1=tf([1 2*pi*22.3*2*0.01 (2*pi*22.3)^2],[1 2*pi*22.3*2*0.5 (2*pi*22.3)^2]);
notch_gyro2=tf([1 16.78 (2*pi*36)^2],[1 188.3 (2*pi*36)^2]);
notch_gyro3=tf([1 2*pi*16*2*0.1 (2*pi*16)^2],[1 2*pi*16*2*0.03 (2*pi*16)^2]);
notch_gyro4=tf([1 2*pi*30*2*0.1 (2*pi*30)^2],[1 2*pi*30*2*0.5 (2*pi*30)^2]);
controller_gyro=notch_gyro1*notch_gyro2*PID_gyro*0.8*notch_gyro3;
try1=tf([1 59.49 9.908*10^4],[1 40 8.72*10^4])*tf([1 21 1.806*10^4],[1 11.06 9607])*notch_gyro2*PID_gyro*tf([0.016 1],[0.008 1]);
open_loop_gyro_elevation=try1*real_gyro_elevation_system;
close_loop_gyro_elevation=open_loop_gyro_elevation/(1+open_loop_gyro_elevation);
figure;
bode(open_loop_gyro_elevation);
grid on;
xlim([1 500])
title("open loop real system gyroscope",'FontSize',15);
figure;
bode(close_loop_gyro_elevation);
grid on;
xlim([1 500])
title("close loop real system gyroscope",'FontSize',15);
figure;
g_gyro_elevation_simulation_open_loop=bodeplot(gyro_elevation_model*try1,2*pi*(real_system_tacho_el.o2i1x));
setoptions(g_gyro_elevation_simulation_open_loop,'FreqUnits','Hz','Grid','on');
title("open loop simulation gyroscope",'FontSize',15);
close_loop_gyro_simulation=feedback(gyro_elevation_model*try1,1);
figure;
g_gyro_elevation_simulation_close_loop=bodeplot(close_loop_gyro_simulation,2*pi*(real_system_tacho_el.o2i1x));
setoptions(g_gyro_elevation_simulation_close_loop,'FreqUnits','Hz','Grid','on');
title("close loop simulation gyroscope",'FontSize',15);
figure;
step(close_loop_gyro_simulation)
grid on;