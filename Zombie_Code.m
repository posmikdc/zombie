%% Munz et al. (2009) Basic SZR model (Section 2)
function [ ] = zombies(a,b,ze,d,T,dt)
% This function will solve the system of ODE’s for the basic model used in
% the Zombie Dynamics project for MAT 5187. It will then plot the curve of
% the zombie population based on time.
% Function Inputs: 
% a - alpha value in model: "zombie destruction" rate
% b - beta value in model: "new zombie" rate
% ze - zeta value in model: zombie resurrection rate
% d - delta value in model: background death rate
% T - Stopping time
% dt - time step for numerical solutions
% Created by Philip Munz, November 12, 2008

%Initial set up of solution vectors and an initial condition

%Model parameters
N = 500; %Daniel's code
a = 0.005; %Daniel's code
b = 0.0095; %Daniel's code
ze = 0.0001; %Daniel's code
d = 0.0001; %Daniel's code

%Time parameters
T = 10; %Daniel's code
dt = 0.01; %Daniel's code
n = T/dt;
t = zeros(1,n+1);
s = zeros(1,n+1);
z = zeros(1,n+1);
r = zeros(1,n+1);

s(1) = N;
z(1) = 0;
r(1) = 0;
t = 0:dt:T;

% Define the ODE’s of the model and solve numerically by Euler’s method:
for i = 1:n
s(i+1) = s(i) + dt*(-b*s(i)*z(i)); % here we assume birth rate
% = background deathrate, so only term is -b term
z(i+1) = z(i) + dt*(b*s(i)*z(i) -a*s(i)*z(i) +ze*r(i));
r(i+1) = r(i) + dt*(a*s(i)*z(i) +d*s(i) - ze*r(i));
if s(i)<0 || s(i) >N
break
end
if z(i) > N || z(i) < 0
break
end
if r(i) <0 || r(i) >N
break
end
end
hold on
plot(t,s,'b'); %Plot of time (x) vs susceptible (y)
plot(t,z,'r'); %Plot of time (x) vs zombies (y)
legend('Suscepties','Zombies')
