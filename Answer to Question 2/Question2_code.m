clear all
clc

h = 0.01; % Steps
x = 0:h:1; % Time
k1 = 100; % Initial forward rate
k2 = 600; % Initial reverse rate
k3 = 150; % Initial forward rate
E = 1; % Initial value
S = 10; % Initial value
ES = 0; % Initial value
P = 0; % Initial value

% Equation 1
% y(1) = E; % Derivative of variable E with respect to time dE/dx
% F_xy = @(x,y) k2*ES+k3*ES-k1*y*S; % Equation 1 for rate of changes

% Equation 2
% y(1) = S; % Derivative of variable S with respect to time dS/dx
% F_xy = @(x,y) k2*ES-k1*E*y; % Equation 2 for rate of changes

% Equation 3
% y(1) = ES; % Derivative of variable ES with respect to time dES/dx
% F_xy = @(x,y) k1*E*S-k2*y-k3*y; % Equation 3 for rate of changes

% Equation 4
y(1) = P; % Derivative of variable P with respect to time dP/dx
F_xy = @(x,y) k3*ES; % Equation 4 for rate of changes

for i = 1:(length(x)-1)
    k_1 = F_xy(x(i),y(i)); % Slope at the beginning of the time period
    k_2 = F_xy(x(i)+0.5*h,y(i)+0.5*h*k_1); % Slope at the middle time
    k_3 = F_xy(x(i)+0.5*h,y(i)+0.5*h*k_2); % Slope at the midpoint
    k_4 = F_xy(x(i)+h,y(i)+k_3*h); % Slope at the end of the time period
    y(i+1) = y(i)+(1/6)*(k_1+2*k_2+2*k_3+k_4)*h; % The slope of the midpoint has a greater weight
end

% figure,
% plot(y)
