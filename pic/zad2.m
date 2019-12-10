%«адание 2
%исследование распределение звукового давлени€ в ванне
clear all
clc
%эксперимент


%горизонтальный разрез
%R=12 см, 2U_0=2,56 ¬, h1= 1 см.
h1= 1;
z1=[1.8 5.3  8.8  16   25.5 47.5 111];
A1=[0.8 2.48 0.28 1.72 0.2  0.68 0.28];

%R=12 см, 2U_0=1,4 ¬, h2= 2 см.
h2=2;
z2=[1.4  3.1  4.5  6.3  9    10.7 14.2 18.3 24   31.6 45.7 62   105];
A2=[2.36 0.92 2.24 0.36 2.12 0.24 1.88 0.32 1.44 0.24 0.8  0.12 0.44];

%R=12 см, 2U_0=1,4 ¬, h3= 3 см.
h3=3;
z3=[1    1.7 2.9  3.8 5.2  6.3  7.6 9.5  11.3 13.7 16.3 19.8 25.5 27.8 34.2 41.5 54.5 69   101];
A3=[0.76 1.8 0.86 1.6 0.52 1.64 0.2 1.52 0.2  1.52 0.36 1.52 0.4  1.28 0.28 0.84 0.2  0.56 0.16];

T1=table(z1',A1');
T2=table(z2',A2');
T3=table(z3',A3');

writetable(T1,'exp.xlsx','Sheet',1,'Range','A2')
writetable(T2,'exp.xlsx','Sheet',1,'Range','C2')
writetable(T3,'exp.xlsx','Sheet',1,'Range','E2')

A1=A1/max(A1)*2;
A2=A2/max(A2)*2;
A3=A3/max(A3)*2;
%теоретическа€ зависимость определ€етс€ формулой из методички

R= @(x,h) sqrt((x).^2+(h-3)^2);
R1=@(x,h) sqrt((x).^2+(h+3)^2);

x1=[min(z1):0.1:max(z1)]+12;
R_1=R(x1,1);
R1_1=R1(x1,1);
dR1=R_1-R1_1;
p1=sqrt(1./R_1.^2+1./R1_1.^2-2./R_1./R1_1.*cos(2*pi/0.15.*dR1));
p1=p1/max(p1);

x2=[min(z2):0.1:max(z2)]+12;
R_2=R(x2,2);
R1_2=R1(x2,2);
dR2=R_2-R1_2;
p2=sqrt(1./R_2.^2+1./R1_2.^2-2./R_2./R1_2.*cos(2*pi/0.15.*dR2));
p2=p2/max(p2);

x3=[min(z3):0.1:max(z3)]+12;
R_3=R(x3,3);
R1_3=R1(x3,3);
dR3=R_3-R1_3;
p3=sqrt(1./R_3.^2+1./R1_3.^2-2./R_3./R1_3.*cos(2*pi/0.15.*dR3));
p3=p3/max(p3);

figure(1)
hold on
plot(z1+12,A1/2,'b');
plot(x1,p1,'r');
grid on;
legend({'experiment','theory'},'FontSize',16)
xlabel('z, см','FontSize',16)
saveas(figure(1),'z2_1','png')

figure(2)
hold on
plot(z2+12,A2/2,'b');
plot(x2,p2,'r');
grid on;
legend({'experiment','theory'},'FontSize',16)
xlabel('z, см','FontSize',16)
saveas(figure(2),'z2_2','png')

figure(3)
hold on
plot(z3+12,A3/2,'b');
plot(x3,p3,'r');
grid on;
legend({'experiment','theory'},'FontSize',16)
xlabel('z, см','FontSize',16)
saveas(figure(3),'z2_3','png')

