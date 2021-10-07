clc
close all

L1 = .20;
L2 = .15;
L3 = .15;
L4 = .15;
L5 = .05;
L6 = (L2^2 + L4^2)^0.5;
L7 = (L3^2 + L4^2)^0.5;
L8 = (L1^2 + L5^2)^0.5;
L9 = (L2^2 + L5^2)^0.5;
L10 = (L3^2 + L5^2)^0.5;

theta1 = atan(L4/L2);
theta2 = atan(L4/L3);
theta3 = atan(L5/L1);
theta4 = atan(L5/L2);
theta5 = atan(L5/L3);

L = [-(1/2)^(-1/2) -(1/2)^(-1/2) (1/2)^(-1/2)  (1/2)^(-1/2) 0 0 0 0;
      (1/2)^(-1/2) -(1/2)^(-1/2) (1/2)^(-1/2) -(1/2)^(-1/2) 0 0 0 0;
     0 0 0 0 1 1 1 1;
     0 0 0 0  L8*cos(theta3) -L8*cos(theta3)  L8*cos(theta3) -L8*cos(theta3);
     0 0 0 0 -L9*cos(theta4) -L9*cos(theta4)  L10*cos(theta5)  L10*cos(theta5);
     L6*cos(pi/4-theta1) -L6*cos(pi/4-theta1) -L7*cos(pi/4-theta2) L7*cos(pi/4-theta2) 0 0 0 0];

X_u = 10;
Y_v = 10;
Z_w = 10;
K_p = 10;
M_q = 10;
N_r = 10;
r_g = [0 0 0]';
I_g = diag([0.13, 0.16, 0.2]);
m = 10;

MRB_11 = m*eye(3);
MRB_12 = -m*Skew(r_g);
MRB_21 = m*Skew(r_g);
MRB_22 = I_g;

MA_11 = diag([X_u, Y_v, Z_w]);
MA_12 = zeros(3);
MA_21 = zeros(3);
MA_22 = diag([K_p, M_q, N_r]);

M_11 = MRB_11 + MA_11;
M_12 = MRB_12 + MA_12;
M_21 = MRB_21 + MA_21;
M_22 = MRB_22 + MA_22;

kp = 16;
kv = 6;
beta = 10;
k2 = 2;
k1 = 1;
condition1 = kp*kv - beta^2/4;
condition2 = k2 - beta/(2*kv);
