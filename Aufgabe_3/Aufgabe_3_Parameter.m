T1= 1e-3;
T2=0.75e-3;
T3=0.5e-3;
K1=1;
K2=1;
K3=1;
gewicht=5;

R1 = 10e3;
R2 = 10e3;
R3 = 10e3;
R5 = 10e3;
R4 = 1e3;

C2 = 1e-7;
R6 = 2e3;
C3 = 1e-9;

opt=simset('MaxStep', 0.01);
simout=sim("Aufgabe3_sim.slx" , [0,50], opt);
time=simout.tout;
fuehrungsgroesse=simout.fuehrungsgroesse.signals.values;
stellgroesse=simout.stellgroesse.signals.values;
regelgroesse=simout.regelgroesse.signals.values;

f=figure(count); clf;
title(strcat('Aufgabe 3 R6 =', num2str(R6)));
hold on;
plot(time, regelgroesse,'b', 'LineWidth', 2);
plot(time, fuehrungsgroesse, 'r', 'LineWidth', 2);
ylabel('Regelgröße [rad/s], Führungsgröße [rad/s]');
plot(time, stellgroesse, 'g', 'LineWidth', 2);
xlabel('Zeit[t]');
ylabel('Stellgröße [V]');

legend("Regelgröße [rad/s]", "Führungsgröße [rad/s]", "Stellgröße [V]");
hold off;