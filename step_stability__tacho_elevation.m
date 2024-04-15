close_loop_unit_controller=feedback(tacho_elevation_model,1);
figure;
step(close_loop_unit)
%%
cancelation1=tf([1 59.495 9.908*10^4],[1 40 8.72*10^4]);
cancelation2=tf([1 21 1.806*10^4],[1 25.035 2.102*10^4]);
controller=tf(1,[1/(2*pi*6.43)^2 0.55/355 1]);
PI_tacho=4.5*(1+tf(2*pi*1.8,[1 0]));
notch_tacho_demo=tf([1 2*0.5*2*6.45*pi (2*pi*6.45)^2],[1 2*0.03*2*6.45*pi (2*pi*6.45)^2]);
notch_tacho_demo_1=tf([1 2*0.9*2*6.35*pi (2*pi*6.35)^2],[1 2*0.3*2*6.35*pi (2*pi*6.35)^2]);
notch_tacho=tf([1 2*0.08*2*35.6*pi (2*pi*35.6)^2],[1 2*0.94*2*35.6*pi (2*pi*35.6)^2]);
controller_tacho=notch_tacho*PI_tacho*controller*cancelation1*cancelation2;
figure;
g_tacho_el_open_loop=bodeplot(tacho_elevation_model*controller_tacho,2*pi*(real_system_tacho_el.o2i1x));
setoptions(g_tacho_el_open_loop,'FreqUnits','Hz','Grid','on');
title('open loop tacho-elevation model','FontSize',15)
figure;
close_loop_linear_tacho=feedback(tacho_elevation_model*controller_tacho,1);
g_tacho_el_close_loop=bodeplot(close_loop_linear_tacho,2*pi*(real_system_tacho_el.o2i1x));
setoptions(g_tacho_el_close_loop,'FreqUnits','Hz','Grid','on');
title('close loop tacho-elevation model','FontSize',15)
figure;
step(close_loop_linear_tacho)
grid on;
open_loop_tacho_elevation_real=controller_tacho*real_tacho_elevation_system;
close_loop_tacho_elevation_real=open_loop_tacho_elevation_real/(1+open_loop_tacho_elevation_real);
figure;
bode(open_loop_tacho_elevation_real)
grid on;
title('open loop tacho-elevation real system','FontSize',15)
xlim([1 500])
figure;
bode(close_loop_tacho_elevation_real)
grid on;
title('close loop tacho-elevation real system','FontSize',15)
xlim([1 500])
