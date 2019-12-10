%Построение диаграммы направленности в полярных осях и в обычных
%теория
theta=[-10:0.1:10];
theta_r=theta/180*pi;
theta_r=theta_r+pi/2;
D10=2*besselj(1,pi*10/1.5*cos(theta_r))./(pi*10/1.5*cos(theta_r));
D20=2*besselj(1,pi*20/1.5*cos(theta_r))./(pi*20/1.5*cos(theta_r));

%эксперимент
phi=[7 8 9 10 11 12 13 14 15];
A=[44 132 276 380 452 440 336 200 80];
phi=phi-11;
A=A/452;
phi_r=phi/180*pi;

% figure(1)
% hold on
polar(theta_r-pi/2,D10)
hold on
polar(theta_r-pi/2,D20)
polar(phi_r,A)
legend({'theory (d=10 mm)','theory (d=20 mm)','experimental'},'FontSize',16)
hold off
% print('diag1.pdf','-dpdf','-fillpage')
saveas(figure(1),'diag1','png')

figure(2)
hold on
plot(theta_r-pi/2,D10)
plot(theta_r-pi/2,D20)
plot(phi_r,A)
legend({'theory (d=10 mm)','theory (d=20 mm)','experimental'},'FontSize',16)
xlabel('\phi, радианы','FontSize',16)
% ylabel('I(t)')
hold off
saveas(figure(2),'diag2','png')