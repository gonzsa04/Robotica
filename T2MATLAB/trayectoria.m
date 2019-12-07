% DATOS DE ENTRADA:
function trayectoria(pIni,pDespegue,pAterrizaje,pFinal,tramo1,tramo2,tramo3,tramo4,tramo5)

% Puntos objetivo:
p0=pIni;   %punto inicial
pP1=pDespegue;
pP2=pAterrizaje;
pF=pFinal; %punto final

% tiempo para cada segmento:
t1=tramo1;
t2=tramo2;
t3=tramo3;
t4=tramo4;
t5=tramo5;

% --------------------------------------------------------

% Calculo de los tiempos intermedios:
t0=0;                  %tiempo inicial
tP1=t0+t1+t2;          %tiempo para llegar al punto pP1 (despegue)
tP2=t0+t1+t2+t3;       %tiempo para llegar al punto pP2 (despegue + tiempo anterior)
tF=t0+t1+t2+t3+t4+t5;  %tiempo para llegar al final (aterrizaje + tiempo anterior)

% MATRIZ CON LAS ECUACIONES QUE HAY QUE RESOLVER:

M=[   t0^3,   t0^2,  t0,  1,         0,      0,   0,  0,         0,      0,    0,  0,        0,      0,    0,  0,         0,      0,    0,  0
    3*t0^2,   2*t0,   1,  0,         0,      0,   0,  0,         0,      0,    0,  0,        0,      0,    0,  0,         0,      0,    0,  0
    3*2*t0,      2,   0,  0,         0,      0,   0,  0,         0,      0,    0,  0,        0,      0,    0,  0,         0,      0,    0,  0
  (t0+t1)^3,   (t0+t1)^2,  (t0+t1),  1,     -(t0+t1)^3,  -(t0+t1)^2, -(t0+t1), -1,         0,      0,    0,  0,        0,      0,    0,  0,         0,      0,    0,  0
3*(t0+t1)^2,   2*(t0+t1),   1,  0,   -3*(t0+t1)^2,  -2*(t0+t1),  -1,  0,         0,      0,    0,  0,        0,      0,    0,  0,         0,      0,    0,  0
3*2*(t0+t1),      2,   0,  0,   -3*2*(t0+t1),     -2,   0,  0,         0,      0,    0,  0,        0,      0,    0,  0,         0,      0,    0,  0
(t0+t1)^3,   (t0+t1)^2,  (t0+t1),  1,         0,      0,   0,  0,         0,      0,    0,  0,        0,      0,    0,  0,         0,      0,    0,  0
         0,      0,   0,  0,     tP1^3,  tP1^2, tP1,  1,    -tP1^3, -tP1^2, -tP1, -1,        0,      0,    0,  0,         0,      0,    0,  0
         0,      0,   0,  0,   3*tP1^2,  2*tP1,   1,  0,  -3*tP1^2, -2*tP1,   -1,  0,        0,      0,    0,  0,         0,      0,    0,  0  
         0,      0,   0,  0,   3*2*tP1,      2,   0,  0,  -3*2*tP1,     -2,    0,  0,        0,      0,    0,  0,         0,      0,    0,  0
         0,      0,   0,  0,         0,      0,   0,  0,     tP2^3,  tP2^2,  tP2,  1,   -tP2^3, -tP2^2, -tP2, -1,         0,      0,    0,  0
         0,      0,   0,  0,         0,      0,   0,  0,   3*tP2^2,  2*tP2,    1,  0, -3*tP2^2, -2*tP2,   -1,  0,         0,      0,    0,  0
         0,      0,   0,  0,         0,      0,   0,  0,   3*2*tP2,      2,    0,  0, -3*2*tP2,     -2,    0,  0,         0,      0,    0,  0
         0,      0,   0,  0,         0,      0,   0,  0,         0,      0,    0,  0,     (tP2+t4)^3,   (tP2+t4)^2,   (tP2+t4),  1,     -(tP2+t4)^3,  -(tP2+t4)^2,  -(tP2+t4), -1
         0,      0,   0,  0,         0,      0,   0,  0,         0,      0,    0,  0,   3*(tP2+t4)^2,   2*(tP2+t4),    1,  0,   -3*(tP2+t4)^2,  -2*(tP2+t4),   -1,  0  
         0,      0,   0,  0,         0,      0,   0,  0,         0,      0,    0,  0,   3*2*(tP2+t4),      2,    0,  0,   -3*2*(tP2+t4),     -2,    0,  0
         0,      0,   0,  0,         0,      0,   0,  0,         0,      0,    0,  0,     (tP2+t4)^3,   (tP2+t4)^2,   (tP2+t4),  1,         0,      0,    0,  0
         0,      0,   0,  0,         0,      0,   0,  0,         0,      0,    0,  0,        0,      0,    0,  0,      tF^3,   tF^2,   tF,  1
         0,      0,   0,  0,         0,      0,   0,  0,         0,      0,    0,  0,        0,      0,    0,  0,    3*tF^2,   2*tF,    1,  0
         0,      0,   0,  0,         0,      0,   0,  0,         0,      0,    0,  0,        0,      0,    0,  0,    3*2*tF,      2,    0,  0];
       

Bx=[p0(1), 0, 0, 0, 0, 0, pP1(1), 0, 0, 0, 0, 0, 0, 0, 0, 0, pP2(1), pF(1), 0, 0]';
By=[p0(2), 0, 0, 0, 0, 0, pP1(2), 0, 0, 0, 0, 0, 0, 0, 0, 0, pP2(2), pF(2), 0, 0]';

% RESOLVER LAS ECUACIONES:

% Ecuación:  M*pX=Bx
pX=M\Bx;
% Ecuación:  M*pY=By
pY=M\By;

% SOLUCIÓN PARA CADA VARIABLE (X,Y)

% Coeficientes de X e Y para las curvas 1,2,3,4,5:
pX1=pX(1:4);
pX2=pX(5:8);
pX3=pX(9:12);
pX4=pX(13:16);
pX5=pX(17:20);
pY1=pY(1:4);
pY2=pY(5:8);
pY3=pY(9:12);
pY4=pY(13:16);
pY5=pY(17:20);

% ----------------------------------------------------

% CÁLCULO DE LOS PUNTOS (DIBUJO):

% Cálculo de la curva, la velocidad y la aceleración:
tAux1=(t0+t1);   %para no perder los valores iniciales los dejamos guardados auxiliarmente
tAux2=(tP2+t4);

t1=t0:0.1:(t0+t1);
t2=tAux1:0.1:tP1;
t3=tP1:0.1:tP2;
t4=tP2:0.1:(tP2+t4);
t5=tAux2:0.1:tF;

% Posición:
x1=polyval(pX1,t1);
y1=polyval(pY1,t1);
x2=polyval(pX2,t2);
y2=polyval(pY2,t2);
x3=polyval(pX3,t3);
y3=polyval(pY3,t3);
x4=polyval(pX4,t4);
y4=polyval(pY4,t4);
x5=polyval(pX5,t5);
y5=polyval(pY5,t5);

% Velocidad:
dpX1=polyder(pX1);
dpY1=polyder(pY1);
dpX2=polyder(pX2);
dpY2=polyder(pY2);
dpX3=polyder(pX3);
dpY3=polyder(pY3);
dpX4=polyder(pX4);
dpY4=polyder(pY4);
dpX5=polyder(pX5);
dpY5=polyder(pY5);
dx1=polyval(dpX1,t1);
dy1=polyval(dpY1,t1);
dx2=polyval(dpX2,t2);
dy2=polyval(dpY2,t2);
dx3=polyval(dpX3,t3);
dy3=polyval(dpY3,t3);
dx4=polyval(dpX4,t4);
dy4=polyval(dpY4,t4);
dx5=polyval(dpX5,t5);
dy5=polyval(dpY5,t5);

% Aceleración:
ddpX1=polyder(dpX1);
ddpY1=polyder(dpY1);
ddpX2=polyder(dpX2);
ddpY2=polyder(dpY2);
ddpX3=polyder(dpX3);
ddpY3=polyder(dpY3);
ddpX4=polyder(dpX4);
ddpY4=polyder(dpY4);
ddpX5=polyder(dpX5);
ddpY5=polyder(dpY5);
ddx1=polyval(ddpX1,t1);
ddy1=polyval(ddpY1,t1);
ddx2=polyval(ddpX2,t2);
ddy2=polyval(ddpY2,t2);
ddx3=polyval(ddpX3,t3);
ddy3=polyval(ddpY3,t3);
ddx4=polyval(ddpX4,t4);
ddy4=polyval(ddpY4,t4);
ddx5=polyval(ddpX5,t5);
ddy5=polyval(ddpY5,t5);

% Dibujo de la solución:

figure
%obstaculo
hold on;
x = [5, 9, 9, 5, 5];
y = [8, 8, 5, 5, 8];
plot(x, y, 'c');

%camino
plot(x1,y1,'r',x2,y2,'b',x3,y3,'b',x4,y4,'b',x5,y5,'g',p0(1),p0(2),'o',pP1(1),pP1(2),'x',pP2(1),pP2(2),'x',pF(1),pF(2),'o')
title('Obstaculo (cian), despegue (rojo), trayectoria (azul) y aterrizaje (verde)');

figure
subplot(3,2,1), plot(t1,x1,'r',t2,x2,'b',t3,x3,'b',t4,x4,'b',t5,x5,'g'),title('x(t)')
subplot(3,2,2), plot(t1,y1,'r',t2,y2,'b',t3,y3,'b',t4,y4,'b',t5,y5,'g'),title('y(t)')
subplot(3,2,3), plot(t1,dx1,'r',t2,dx2,'b',t3,dx3,'b',t4,dx4,'b',t5,dx5,'g'),title('dx(t)')
subplot(3,2,4), plot(t1,dy1,'r',t2,dy2,'b',t3,dy3,'b',t4,dy4,'b',t5,dy5,'g'),title('dy(t)')
subplot(3,2,5), plot(t1,ddx1,'r',t2,ddx2,'b',t3,ddx3,'b',t4,ddx4,'b',t5,ddx5,'g'),title('ddx(t)')
subplot(3,2,6), plot(t1,ddy1,'r',t2,ddy2,'b',t3,ddy3,'b',t4,ddy4,'b',t5,ddy5,'g'),title('ddy(t)')