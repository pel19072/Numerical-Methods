%% metodo de NR
clc;
close all;
clear all;
syms x;
f = 2.52*10^(-9)*(exp(x/(1.752*0.026))-1)+x/1000 - 0.01;
fx= inline(f);
g=diff(f); %The Derivative of the Function
gx = inline(g);
x0 = input('Enter the intial approximation:');
i = 0;
error = 1;
fprintf('\ti  \txi  \terror \n');
while(abs(error)>0.0000001)
        i = i + 1;
        f0=feval(fx,x0); %Calculating the value of function at x0
        f0_der=feval(gx, x0); %Calculating the value of function derivative at x0
        y=x0-f0/f0_der; % The Formula
        error=abs(y-x0);
        x0 = y;
        fprintf('\t%d  \t%f  \t%f \n',i,y,error)
end
%% Regresion cuadratica 
load('proyecto.mat')
A = [10 sum(voltaje) sum(voltaje.^2);
    sum(voltaje) sum(voltaje.^2) sum(voltaje.^3);
    sum(voltaje.^2) sum(voltaje.^3) sum(voltaje.^4)];
for c=1:10
    b2(c) = voltaje(c)*Potencia(c);
end
for c=1:10
    b3(c) = voltaje(c)^2*Potencia(c);
end
b = [sum(Potencia);
    sum(b2);
    sum(b3)]
x = linsolve(A,b);
t1 = linspace(1,10,10);
syms p t
p1 = -0.0010*t1.^2 + 0.01*t1-3.8712*10^-9;
t1 = linspace(1,10,10);
figure(1)
plot(voltaje, Potencia,'bo');
hold on 
plot(t1,p1,'r-');
legend('Datos registrados', 'Regresión obtenida');
xlabel('voltaje (v)');   % Etiqueta al eje x
ylabel('Potencia (w)');   % Etiqueta al eje y
title('Potencia dicipada en la resistencia de carga'); 
save('proyecto.mat')