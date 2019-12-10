%Задание 2
%исследование распределение звукового давления в ванне
clear all
clc
%эксперимент


%вертикальный разрез
%R=60 см, h0= 12 см.
z1= 60;
h1=[12.4 13.2 13.7 14.4 14.9 15.5  15.9 16.5 17   17.6 18.2 18.7 19.3 ...
    19.9  20.4 21 21.7 22.5 22.9 23.4 24 24.6 25.2 25.8 26.4 26.9 27.6];
A1=[0.2  0.72 0.2  0.8  0.2  0.704 0.15 0.79 0.17 0.8  0.18 0.83 0.19 ...
    0.856 0.16 0.856 0.088 0.808 0.064 0.8 0.112 0.768 0.144 0.736 0.16 0.648 0.2];

%R=90 см, h0= 12 см.
z2= 90;
h2=[26.4 25.5 24.6 23.9 23 22.1 21.2 20.6 19.5 18.7 17.9 17. 16.2 15.4 14.6 13.6];
A2=[0.056 0.616 0.088 0.584 0.104 0.560 0.112 0.512 0.112 0.504 0.088 0.464 0.080 0.456 0.020 0.476];

%R=12 см, 2U_0=1,4 В, h3= 3 см.
z3=120;
h3=[14 15.5 16.5 17.7 18.8 19.8 20.8 22 23.1 24.3 25.5 26.6 27.7];
A3=[0.328 0.020 0.332 0.040 0.350 0.045 0.368 0.052 0.4 0.050 0.432 0.056 0.448];

T1=table(h1',A1');
T2=table(h2',A2');
T3=table(h3',A3');

writetable(T1,'exp.xlsx','Sheet',1,'Range','H2')
writetable(T2,'exp.xlsx','Sheet',1,'Range','J2')
writetable(T3,'exp.xlsx','Sheet',1,'Range','L2')

A1=A1/max(A1)*2;
A2=A2/max(A2)*2;
A3=A3/max(A3)*2;
%теоретическая зависимость определяется формулой из методички

R= @(x,h) sqrt((x).^2+(h-3).^2);
R1=@(x,h) sqrt((x).^2+(h+3).^2);
b=@(theta) 2*besselj(1,pi*10/1.5*theta)./(pi*10/1.5*theta);

x1=[min(h1):0.1:max(h1)]-12.1;
R_1=R(60,x1);
R1_1=R1(60,x1);
dR1=R_1-R1_1;
theta01=(x1+3)./R1_1;
theta21=(x1-3)./R1_1;
b01=b(theta01);
b21=b(theta21);
p1=sqrt(1./R_1.^2+1./R1_1.^2-2./R_1./R1_1.*cos(2*pi/0.15.*dR1));
p1=p1/max(p1);

p1th=sqrt(b21.^2./R_1.^2+b01.^2./R1_1.^2-2.*b01.*b21./R_1./R1_1.*cos(2*pi/0.15.*dR1));
p1th=p1th/max(p1th);

x2=[min(h2):0.1:max(h2)]-12.1;
R_2=R(90,x2);
R1_2=R1(90,x2);
dR2=R_2-R1_2;
theta02=(x2+3)./R1_2;
theta22=(x2-3)./R1_2;
b02=b(theta02);
b22=b(theta22);
p2=sqrt(1./R_2.^2+1./R1_2.^2-2./R_2./R1_2.*cos(2*pi/0.15.*dR2));
p2=p2/max(p2);

p2th=sqrt(b22.^2./R_2.^2+b02.^2./R1_2.^2-2.*b02.*b22./R_2./R1_2.*cos(2*pi/0.15.*dR2));
p2th=p2th/max(p2th);

x3=[min(h3):0.1:max(h3)]-12.1;
R_3=R(120,x3);
R1_3=R1(120,x3);
dR3=R_3-R1_3;
theta03=(x3+3)./R1_3;
theta23=(x3-3)./R1_3;
b03=b(theta03);
b23=b(theta23);
p3=sqrt(1./R_3.^2+1./R1_3.^2-2./R_3./R1_3.*cos(2*pi/0.15.*dR3));
p3=p3/max(p3);

p3th=sqrt(b23.^2./R_3.^2+b03.^2./R1_3.^2-2.*b03.*b23./R_3./R1_3.*cos(2*pi/0.15.*dR3));
p3th=p3th/max(p3th);

figure(1)
hold on
plot(h1-12.1,A1/2,'b');
plot(x1,p1,'r');
plot(x1,p1th,'g');
grid on;
legend({'experiment','theory','theory2'},'FontSize',16)
xlabel('h, см','FontSize',16)
saveas(figure(1),'z3_1th','png')

figure(2)
hold on
plot(h2-12.1,A2/2,'b');
plot(x2,p2,'r');
plot(x2,p2th,'g');
grid on;
legend({'experiment','theory','theory2'},'FontSize',16)
xlabel('h, см','FontSize',16)
saveas(figure(2),'z3_2th','png')

figure(3)
hold on
plot(h3-12.1,A3/2,'b');
plot(x3,p3,'r');
plot(x3,p3th,'g');
grid on;
legend({'experiment','theory','theory2'},'FontSize',16)
xlabel('h, см','FontSize',16)
saveas(figure(3),'z3_3th','png')