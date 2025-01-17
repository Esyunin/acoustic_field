%������� 2
%������������ ������������� ��������� �������� � �����
clear all
clc
%�����������


%�������������� ������
%R=12 ��, 2U_0=2,56 �, h1= 1 ��.
h1= 1;
z1=[1.8 5.3  8.8  16   25.5 47.5 111];
A1=[0.8 2.48 0.28 1.72 0.2  0.68 0.28];

%R=12 ��, 2U_0=1,4 �, h2= 2 ��.
h2=2;
z2=[1.4  3.1  4.5  6.3  9    10.7 14.2 18.3 24   31.6 45.7 62   105];
A2=[2.36 0.92 2.24 0.36 2.12 0.24 1.88 0.32 1.44 0.24 0.8  0.12 0.44];

%R=12 ��, 2U_0=1,4 �, h3= 3 ��.
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
%������������� ����������� ������������ �������� �� ���������

R= @(x,h) sqrt((x).^2+(h-3)^2);
R1=@(x,h) sqrt((x).^2+(h+3)^2);
b=@(theta) 2*besselj(1,pi*10/1.5*theta)./(pi*10/1.5*theta);

x1=[min(z1):0.1:max(z1)]+12;
R_1=R(x1,1);
R1_1=R1(x1,1);
dR1=R_1-R1_1;
theta01=(h1+3)./R1_1;
theta21=(h1-3)./R1_1;
b01=b(theta01);
b21=b(theta21);
p1=sqrt(1./R_1.^2+1./R1_1.^2-2./R_1./R1_1.*cos(2*pi/0.15.*dR1));
p1=p1/max(p1);

p1th=sqrt(b21.^2./R_1.^2+b01.^2./R1_1.^2-2.*b01.*b21./R_1./R1_1.*cos(2*pi/0.15.*dR1));
p1th=p1th/max(p1th);

x2=[min(z2):0.1:max(z2)]+12;
R_2=R(x2,2);
R1_2=R1(x2,2);
dR2=R_2-R1_2;
theta02=(h2+3)./R1_2;
theta22=(h2-3)./R1_2;
b02=b(theta02);
b22=b(theta22);
p2=sqrt(1./R_2.^2+1./R1_2.^2-2./R_2./R1_2.*cos(2*pi/0.15.*dR2));
p2=p2/max(p2);

p2th=sqrt(b22.^2./R_2.^2+b02.^2./R1_2.^2-2.*b02.*b22./R_2./R1_2.*cos(2*pi/0.15.*dR2));
p2th=p2th/max(p2th);

x3=[min(z3):0.1:max(z3)]+12;
R_3=R(x3,3);
R1_3=R1(x3,3);
dR3=R_3-R1_3;
theta03=(h3+3)./R1_3;
theta23=(h3-3)./R1_3;
b03=b(theta03);
b23=b(theta23);
b23=2*ones(1,length(b23));
p3=sqrt(1./R_3.^2+1./R1_3.^2-2./R_3./R1_3.*cos(2*pi/0.15.*dR3));
p3=p3/max(p3);

p3th=sqrt(b23.^2./R_3.^2+b03.^2./R1_3.^2-2.*b03.*b23./R_3./R1_3.*cos(2*pi/0.15.*dR3));
p3th=p3th/max(p3th);

figure(1)
hold on
plot(z1+12,A1/2,'b');
plot(x1,p1,'r');
plot(x1,p1th,'g');
grid on;
legend({'experiment','theory','theory2'},'FontSize',16)
xlabel('h, ��','FontSize',16)
saveas(figure(1),'z2_1th','png')

figure(2)
hold on
plot(z2+12,A2/2,'b');
plot(x2,p2,'r');
plot(x2,p2th,'g');
grid on;
legend({'experiment','theory','theory2'},'FontSize',16)
xlabel('h, ��','FontSize',16)
saveas(figure(2),'z2_2th','png')

figure(3)
hold on
plot(z3+12,A3/2,'b');
plot(x3,p3,'r');
plot(x3,p3th,'g');
grid on;
legend({'experiment','theory','theory2'},'FontSize',16)
xlabel('h, ��','FontSize',16)
saveas(figure(3),'z2_3th','png')
