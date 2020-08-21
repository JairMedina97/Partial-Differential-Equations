clear ; clc
Nx=50;
Ny=50;
Lx=5;
Ly=5;

x=linspace(0,Lx,Nx);
y=linspace(0,Ly,Ny);
dx=x(2)-x(1);
dy=y(2)-y(1);


N=Nx*Ny;
M=zeros(N,N);
B=zeros(N,1);

for i=2:Nx-1
    for j=2:Ny-1
        n=i+(j-1)*Nx;
        M(n,n   )=-4;
        M(n,n-1 )=1;
        M(n,n+1 )=1;
        M(n,n-Nx)=1;
        M(n,n+Nx)=1;
        B(n,1)   =0;
    end
end

i=1;
for j=1:Ny;
    n=i+(j-1)*Nx;
    M(n,n)=1;
    B(n,1)=y(j);
end

i=Nx;
for j=1:Ny;
    n=i+(j-1)*Nx;
    M(n,n)=1;
    B(n,1)=-(1-y(j));
end

j=1;
for i=1:Nx;
    n=i+(j-1)*Nx;
    M(n,n)=1;
    B(n,1)=-x(i);
end

j=Ny;
for i=1:Nx;
    n=i+(j-1)*Nx;
    M(n,n)=1;
    B(n,1)=1-x(i);
end

phi_vec=M\B;

for i=1:Nx
    for j=1:Ny
        n=i+(j-1)*Nx;
        phi(i,j)=phi_vec(n);
    end 
end

surf(x,y,phi')
xlabel('x')
ylabel('y')
set(gca,'Fontsize',16)

u=zeros(Nx,Ny);
v=zeros(Nx,Ny);
for i=2:Nx-1
    for j=2:Ny-1
        u(i,j)=-(phi(i+1,j)-phi(i-1,j))/(2*dx);
        v(i,j)=-(phi(i,j+1)-phi(i,j-1))/(2*dy);
    end
end
figure(2); clf(2)
quiver(x,y,u',v')
xlabel('x')
ylabel('y')
title('velocity field')
        



