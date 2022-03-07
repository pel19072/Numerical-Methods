%% Ejercicio 2: Método SOR

format longg

A=[ 3e+3 -1e+3 -1e+3 0 0 0 0 0;...
    -1e+3 4e+3 0 -1e+3 0 0 0 0;...
    -1e+3 0 3e+3 -1e+3 -1e+3 0 0 0;...
    0 -1e+3 -1e+3 3e+3 0 -1e+3 0 0;...
    0 0 -1e+3 0 2e+3 0 -1e+3 0;...
    0 0 0 -1e+3 0 1e+3 0 1e+3;...
    0 0 0 0 -1e+3 0 2e+3 0;...
    0 0 0 0 0 1 0 -1;];

b=[2 0 -2 0 1 0 -1 1]';
x=[0 0 0 0 0 0 0 0]';
% Tolerence for method
tol=1e-3;

w = 1.01;
[x1, itr] = SOR(A,b,x,tol,w);

disp('La solución del sistema con SOR y w=1.01 es:');
disp(x1);
disp('en')
disp(itr);
disp('iteraciones')