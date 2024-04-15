ts3=10^-3;
load("eldist.mat")
load("trdist.mat")
load("firegz.mat")
load("firegy.mat")
load("gz.mat")
load("gy.mat")
load("targety.mat")
load("targetx.mat")
fric_gear_motor=0.0226;
fric_gear_turrent_gun=100/(185);
fric_gear_turrent_gun_traverse=1.272;
fric_gear_motor_traverse=0.021;
fric_gear_motor_pod_elevation=0.23125*0.42;
real_system_tacho_el=load ("OE2_plant_tacho_gun_el.mat") ;
real_system_gyro_el=load("OE1_plant_gyro_gun_el.mat");
real_system_tacho_tr=load ("DAABC2_plant_tacho_tr.mat") ;
real_system_gyro_tr=load("DAABC1_plant_gyro_tr.mat");