clc
close all
clear variables
k1 =1;
k2 =1; 
k3 = 2;
A1 = 1;

A=  [-k1 0; k2 -k3];
B = [1/A1;0];
C = [0 1];
D = [0];

% Crear el sistema en espacio de estado continuo
sys = ss(A, B, C, D);
sysc = tf(sys)
% Definir el paso de muestreo T
Ts = 0.5; % Tiempo de muestreo en segundos

% Convertir el sistema continuo a discreto
sys_d = c2d(sys, Ts, 'zoh');

sysd = tf(sys_d)
% Extraer las matrices A, B, C, D del sistema discreto
Ad = sys_d.A;
Bd = sys_d.B;
Cd = sys_d.C;
Dd = sys_d.D;

out = sim("Tanque.slx");
%% 
plot(out.Tank.time,out.Tank.signals.values(:,1),'b', out.Tank.time,out.Tank.signals.values(:,2),'r',out.Tank.time,out.Tank.signals.values(:,3),'k')
legend('Step','Tank Con','Tank Dis')
xlabel("Tiempo (seg)")
ylabel("Flujo")
grid on
