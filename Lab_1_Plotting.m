% A Plot showing your velocity step response and how you obtained your plant parameters from it

% A Plot showing your velocity step response overlaid with the simulated velocity step response

% Three Plots showing the response, tracking error and the input voltage of the P-Controller applied to the cart system and the estimated plant overlaid on each other.

% A plot showing the theoretical closed-loop frequency response overlaid with the measured ones

%% Load Data

clear
load('LAB1_DATA.mat')

%% 5-1c
load('5_1_DATA.mat');
figure(1)
hold on
% Plot measured velocity
plot(velocity_Ex1(:,1), velocity_Ex1(:, 2), 'r', 'LineWidth',2.5);
% Plot K_v
K_v = 153.7;
Tau_v = 0.07;
fplot(K_v, 'b', 'LineWidth', 2.5)
% Formatting
xlim([1.556-Tau_v, 2])
xticks([1.556-Tau_v 1.556 1.556+Tau_v 1.556+2*Tau_v 1.556+3*Tau_v 1.556+4*Tau_v 1.556+5*Tau_v 1.556+6*Tau_v])
xticklabels({'-\tau_v','0','\tau_v','2\tau_v', '3\tau_v', '4\tau_v', '5\tau_v', '6\tau_v'})
ylim([0, 160])
set(gca,'fontsize',30);
title('5-1c Velocity Step Response','fontsize',35);
xlabel('Time [s]','fontsize',30)
ylabel('Velocity [mm/s]','fontsize',30)
grid minor
legend('Velocity','K_v = 153.7','fontsize',30)
hold off

%% 5-1d
figure(2)
% Subplot 1
% Plot measured velocity
subplot(2,1,1);
plot(velocity_Ex1(:,1), velocity_Ex1(:, 2), 'r', 'LineWidth',2.5);
hold on
% Plot simulated velocity
plot(tout,velocity_ave_5_1(:, 2), 'b', 'LineWidth', 2.5);
hold off
% Subplot 1 formatting
xlim([1.556-Tau_v, 2])
xticks([1.556-Tau_v 1.556 1.556+Tau_v 1.556+2*Tau_v 1.556+3*Tau_v 1.556+4*Tau_v 1.556+5*Tau_v 1.556+6*Tau_v])
xticklabels({'-\tau_v','0','\tau_v','2\tau_v', '3\tau_v', '4\tau_v', '5\tau_v', '6\tau_v'})
ylim([0, 160]);
title('5-1d Measured and Simulated Velocity Step Response','fontsize',35);
ylabel('Velocity [mm/s]','fontsize',30)
legend('Measured Velocity','Simulated Velocity','fontsize',30)
set(gca,'fontsize',30);
% Subplot 2
% Plot input square wave
subplot(2,1,2);
plot(input_Ex1(:,1), input_Ex1(:, 2), 'g', 'LineWidth',2.5);
% Subplot 2 Formatting
xlim([1.556-Tau_v, 2])
xticks([1.556-Tau_v 1.556 1.556+Tau_v 1.556+2*Tau_v 1.556+3*Tau_v 1.556+4*Tau_v 1.556+5*Tau_v 1.556+6*Tau_v])
xticklabels({'-\tau_v','0','\tau_v','2\tau_v', '3\tau_v', '4\tau_v', '5\tau_v', '6\tau_v'})
ylim([0, 3]);

set(gca,'fontsize',30);
xlabel('Time [s]','fontsize',30)
ylabel('Input [V]','fontsize',30)
grid minor

%% 5-2a

K_v = 153.7;
Tau_v = 1.626;


[omega_n_1,zeta_1] = calculate(0.15,K_v,Tau_v);
[omega_n_2,zeta_2] = calculate(0.25,K_v,Tau_v);
[omega_n_3,zeta_3] = calculate(0.50,K_v,Tau_v);




%% 5-2b

figure (3)
subplot(2,1,1)
title('Position Step Response for 𝐾𝑝=0.15','fontsize',35)
hold on
plot(input_Ex2_1(:,1),input_Ex2_1(:,2),'r--','Linewidth',2)
plot(position_Ex2_1(:,1),position_Ex2_1(:,2),'b','Linewidth',2)
ylabel('Position [mm]')
legend('Command','Measured')
grid on
hold off
set(gca,'fontsize',30)

subplot(2,1,2)
plot(control_input_Ex2_1(:,1),control_input_Ex2_1(:,2),'r','Linewidth',2)
ylabel('Control [V]')
grid on

xlabel('Time [s]')
set(gca,'fontsize',30)


figure (4)
subplot(2,1,1)
title('Position Step Response for 𝐾𝑝=0.25','fontsize',35)
hold on
plot(input_Ex2_2(:,1),input_Ex2_2(:,2),'r--','Linewidth',2)
plot(position_Ex2_2(:,1),position_Ex2_2(:,2),'b','Linewidth',2)
ylabel('Position [mm]')
legend('Command','Measured')
grid on
hold off
set(gca,'fontsize',30)

subplot(2,1,2)
plot(control_input_Ex2_2(:,1),control_input_Ex2_2(:,2),'r','Linewidth',2)
ylabel('Control [V]')
grid on

xlabel('Time [s]')
set(gca,'fontsize',30)


figure (5)
subplot(2,1,1)
title('Position Step Response for 𝐾𝑝=0.5','fontsize',35)
hold on
plot(input_Ex2_3(:,1),input_Ex2_3(:,2),'r--','Linewidth',2)
plot(position_Ex2_3(:,1),position_Ex2_3(:,2),'b','Linewidth',2)
ylabel('Position [mm]')
legend('Command','Measured')
grid on
hold off
set(gca,'fontsize',30)

subplot(2,1,2)
plot(control_input_Ex2_3(:,1),control_input_Ex2_3(:,2),'r','Linewidth',2)
ylabel('Control [V]')
grid on

xlabel('Time [s]')
set(gca,'fontsize',30)

%% 5-2c

%% 5-3a







function [zeta, omega] = calculate(K_p,K_v,Tau_v)
    zeta = 1/(2*sqrt(K_p * K_v * Tau_v));
    omega = sqrt((K_p * K_v)/Tau_v);
end
