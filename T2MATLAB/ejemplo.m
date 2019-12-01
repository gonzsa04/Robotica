% DATOS DE ENTRADA:

% Puntos objetivo:
p0=[5,1];
pP1=[3, 5];
pP2=[4, 10];
pF=[10,12];

% tiempo para cada segmento:
t1=2;
t2=2;
t3=2;

% --------------------------------------------------------

% Calculo de los tiempos intermedios:
t0=0;
tP1=t0+t1;
tP2=t0+t1+t2;
tF=t0+t1+t2+t3;


% MATRIZ CON LAS ECUACIONES QUE HAY QUE RESOLVER:

% Se resuelve la matriz general mostrada en el ejemplo:

M=[     t0^4,   t0^3,   t0^2,   t0, 1,        0,      0,     0,  0,  0
      4*t0^3, 3*t0^2,   2*t0,   1,  0,        0,      0,     0,  0,  0
    4*3*t0^2, 3*2*t0,      2,   0,  0,        0,      0,     0,  0,  0
           0,      0,      0,   0,  0,     tF^4,   tF^3,  tF^2, tF,  1
           0,      0,      0,   0,  0,   4*tF^3, 3*tF^2,  2*tF,  1,  0
           0,      0,      0,   0,  0, 4*3*tF^2, 3*2*tF,     2,  0,  0
        tP1^4,   tP1^3,   tP1^2,   tP1, 1,    -tP1^4,  -tP1^3, -tP1^2,-tP1, -1
      4*tP1^3, 3*tP1^2,   2*tP1,   1,  0,  -4*tP1^3,-3*tP1^2, -2*tP1, -1,  0  
    4*3*tP1^2, 3*2*tP1,      2,   0,  0,-4*3*tP1^2,-3*2*tP1,    -2,  0,  0
    tP1^4,   tP1^3,   tP1^2,  tP1,  1,        0,      0,     0,  0,  0
     tP2^4,   tP2^3,   tP2^2,   tP2, 1,    -tP2^4,  -tP2^3, -tP2^2,-tP2, -1
      4*tP2^3, 3*tP2^2,   2*tP2,   1,  0,  -4*tP2^3,-3*tP2^2, -2*tP2, -1,  0  
    4*3*tP2^2, 3*2*tP2,      2,   0,  0,-4*3*tP2^2,-3*2*tP2,    -2,  0,  0
        tP2^4,   tP2^3,   tP2^2,  tP2,  1,        0,      0,     0,  0,  0];
       

Bx=[p0(1), 0, 0, pF(1), 0, 0, 0, 0, 0, pP1(1), 0, 0, 0, pP2(1)]';
By=[p0(2), 0, 0, pF(2), 0, 0, 0, 0, 0, pP1(2), 0, 0, 0, pP2(2)]';

% RESOLVER LAS ECUACIONES:

% Ecuación:  M*pX=Bx
pX=M\Bx;
% Ecuación:  M*pY=By
pY=M\By;

% SOLUCIÓN PARA CADA VARIABLE (X,Y)

% Coeficientes de X e Y para las curvas 1 y 2:
pX1=pX(1:3)
pX2=pX(4:7)
pX3=pX(8:10)
pY1=pY(1:3)
pY2=pY(4:7)
pY3=pY(8:10)

% ----------------------------------------------------

% CÁLCULO DE LOS PUNTOS (DIBUJO):

% Cálculo de la curva, la velocidad y la aceleración:
t1=t0:0.01:tP1;
t2=tP1:0.01:tP2;
t3=tP2:0.01:tF;

% Posición:
x1=polyval(pX1,t1);
y1=polyval(pY1,t1);
x2=polyval(pX2,t2);
y2=polyval(pY2,t2);
x3=polyval(pX3,t3);
y3=polyval(pY3,t3);

% Velocidad:
dpX1=polyder(pX1);
dpY1=polyder(pY1);
dpX2=polyder(pX2);
dpY2=polyder(pY2);
dpX3=polyder(pX3);
dpY3=polyder(pY3);

dx1=polyval(dpX1,t1);
dy1=polyval(dpY1,t1);
dx2=polyval(dpX2,t2);
dy2=polyval(dpY2,t2);
dx3=polyval(dpX3,t3);
dy3=polyval(dpY3,t3);

% Aceleración:
ddpX1=polyder(dpX1);
ddpY1=polyder(dpY1);
ddpX2=polyder(dpX2);
ddpY2=polyder(dpY2);
ddpX3=polyder(dpX3);
ddpY3=polyder(dpY3);

ddx1=polyval(ddpX1,t1);
ddy1=polyval(ddpY1,t1);
ddx2=polyval(ddpX2,t2);
ddy2=polyval(ddpY2,t2);
ddx3=polyval(ddpX3,t3);
ddy3=polyval(ddpY3,t3);

% Dibujo de la solución:

figure
%obstaculo
hold on;
x = [5, 9, 9, 5, 5];
y = [8, 8, 5, 5, 8];
plot(x, y, 'b-');

%camino
plot(x1,y1,'r',x2,y2,'b',p0(1),p0(2),'o',pP1(1),pP1(2),'x',pP2(1),pP2(2),'x',pF(1),pF(2),'o')
title('Curvas 1 (rojo) y 2 (azul)');

figure
subplot(3,2,1), plot(t1,x1,'r',t2,x2,'b',t3,x3,'g'),title('x(t)')
subplot(3,2,2), plot(t1,y1,'r',t2,y2,'b',t3,y3,'g'),title('y(t)')
subplot(3,2,3), plot(t1,dx1,'r',t2,dx2,'b',t3,dx3,'g'),title('dx(t)')
subplot(3,2,4), plot(t1,dy1,'r',t2,dy2,'b',t3,dy3,'g'),title('dy(t)')
subplot(3,2,5), plot(t1,ddx1,'r',t2,ddx2,'b',t3,ddx3,'g'),title('ddx(t)')
subplot(3,2,6), plot(t1,ddy1,'r',t2,ddy2,'b',t3,ddy3,'g'),title('ddy(t)')

