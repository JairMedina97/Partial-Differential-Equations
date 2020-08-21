clear all; clc;

disp('Metodo de Gauss Seidel por linea en "N" nodos')
n=input ('Numero de nodos (nxn) =');              %captura de datos
fs=input ('Frontera superior: ');
fi=input ('Frontera izquierda: ');
fd=input ('Frontera derecha: ');
fa=input ('Frontera inferior: ');
it=input('num de iteraciones: ');
for it=1:it;
    for i=2:n-1;
    
     P(i,1)=fi;
     P(i,n)=fd;
     P(n,2:n-1)=fa;
     P(1,2:n-1)=fs;
     P(1,1)=(fs+fi)/2;
     P(n,1)=(fa+fi)/2;
     P(1,n)=(fs+fd)/2;
     P(n,n)=(fa+fd)/2;
    end 
PI=P;
for j=2:n-1;
    for i=2:n-1;
    
    P(i,j)=(1/4)*(P(i+1,j)+P(i-1,j)+P(i,j+1)+P(i,j-1));
        
        
    error(it)=sum(abs(PI(i,j)-P(i,j)));
              
        
    end
end
disp(P)
end    
x1=1:n;
y1=1:n;
[X,Y]=meshgrid(x1,y1);
surf(X,Y,P);
shading interp
colormap winter
colorbar('eastoutside')

