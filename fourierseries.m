t=0:0.1:pi;
y1=(4/pi)*sin(t);
y3=(4/pi)*sin(t)+(4/(3*pi))*sin(3*t);
y5=(4/pi)*sin(t)+(4/(3*pi))*sin(3*t)+(4/(5*pi))*sin(5*t);
plot(t,y1,t,y3,t,y5),hold on;
x=square(t);
plot(x,t),hold off;
plot(t,x),hold off;
plot(t,y1,t,y3,t,y5,t,x)
title('Fourier Series')
xlabel('f(x)')
legen('n=1','n=2','n=3','f(x)')