clc;
clear all;
close all;
% frecuencia de muestreo, muestras que toma por segundo ( en este caso cada
% 10)
% periodo, tiempo que tarda en tomar una muestra

t=0.1:0.1:59;


BMS_data=readtable('corriente_voltaje.csv','VariableNamingRule','preserve');

% Nombre del archivo, Para que lea los encabezados pero no los guarde como
% datos, para que los mantenga y no los elimine

Amp = table2array(BMS_data(:,1));
Volt = table2array(BMS_data(:,2));

Amp_f = lowpass(Amp,50*pi/180,10);
Volt_f = lowpass(Volt,59*pi/180,10);

% Señal ,frecuencia de corte, frecuencia de muestreo

subplot(4,1,1)
plot(t,Amp,'k')
legend('Amperaje original')
xlabel("Tiempo (ms)")
ylabel("Corriente (A)")
subplot(4,1,2)
plot(t,Amp_f,'m')
legend('Amperaje filtrado')
xlabel("Tiempo (ms)")
ylabel("Corriente (A)")
subplot(4,1,3)
plot(t,Volt,'k')
legend('Voltaje original')
xlabel("Tiempo (ms)")
ylabel("Voltaje (V)")
subplot(4,1,4)
plot(t,Volt_f,'m')
legend('Voltaje filtrado')
xlabel("Tiempo (ms)")
ylabel("Voltaje (V)")
