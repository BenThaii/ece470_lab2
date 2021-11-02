close all;
clear;
% -------------------------------------4.2-------------------------------
% define robot parameters #theta=0 d a alpha
d1 = 400;
a1 = 25;
a2 = 315;
a3 = 35;
d4 = 365;
a6 = 296.23;
d6 = 161.44;
DH = [0, d1, a1, pi/2;
      0, 0, a2, 0;
      0, 0, a3, pi/2;
      0, d4, 0, -pi/2;
      0, 0, 0, pi/2;
      0, d6, -a6, 0];
% define the robot
kuka = mykuka(DH);
pose = forward_kuka([pi/5 pi/3 -pi/4 pi/4 pi/3 pi/4], kuka)
inverse_kuka(pose, kuka)

