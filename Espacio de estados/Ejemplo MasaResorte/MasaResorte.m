clc
close all
clear variables
% Constante de resorte
k = 1.2; %  N/m
% Masa
m = 2; % kg
% Coeficiente de amortiguamiento
b = 0.6; %  N*s/m

A=  [0 1; -k/m -b/m];
B = [0;1/m];
C = [1 0];
D = [0];

 
% Crear el sistema en espacio de estado continuo
sys = ss(A, B, C, D);
sysc = tf(sys)
% Definir el paso de muestreo T
Ts = 0.04; % Tiempo de muestreo en segundos

% Convertir el sistema continuo a discreto
sys_d = c2d(sys, Ts, 'zoh');
sysd = tf(sys_d)
% Extraer las matrices A, B, C, D del sistema discreto
Ad = sys_d.A;
Bd = sys_d.B;
Cd = sys_d.C;
Dd = sys_d.D;
out = sim("MasaResorteSpS.slx");
%%
% 
plot(out.mass.time,out.mass.signals.values(:,1),'b', out.mass.time,out.mass.signals.values(:,2),'r')
legend('Sys Mass Con','Sys Mass Dis')
title('Respuesta dinámica en Espacio de estados sistema Masa Resorte')
xlabel("Tiempo (seg)")
ylabel("Posición (m)")
grid on