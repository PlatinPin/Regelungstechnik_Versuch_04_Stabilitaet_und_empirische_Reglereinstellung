T1= 1e-3;
T2=0.75e-3;
T3=0.5e-3;
K1=1;
K2=1;
K3=1;
gewicht=4;
Kr_array = [2,4,6,8,10];

for count=1:length(Kr_array)
Kr = Kr_array(count);
opt=simset('MaxStep', 0.00001);
simout=sim("Aufgabe2_sim.slx" , [0,0.007*Kr], opt);
time=simout.tout;
fuehrungsgroesse=simout.fuehrungsgroesse.signals.values;
stellgroesse=simout.stellgroesse.signals.values;
regelgroesse=simout.regelgroesse.signals.values;

f=figure(count); clf;
title(strcat('Aufgabe 2a Tn =', num2str(Kr)));
hold on;
plot(time, regelgroesse,'b', 'LineWidth', 2);
plot(time, fuehrungsgroesse, 'r', 'LineWidth', 2);
ylabel('Regelgröße [rad/s], Führungsgröße [rad/s]');
plot(time, stellgroesse, 'g', 'LineWidth', 2);
xlabel('Zeit[t]');
ylabel('Stellgröße [V]');

legend("Regelgröße [rad/s]", "Führungsgröße [rad/s]", "Stellgröße [V]");
hold off;
end