clear all;
clc;
n=input ('numero de nodos =');
ni=input ('numero de iteraciones =');
fs=input ('valor de la frontera superior =');
fi=input ('valor de la frontera izquierda =');
fd=input ('valor de la frontera derecha =');
fa=input ('valor de la frontera inferior =');
for k=1:ni;
for i=2:n-1;
     S(i,1)=fi;
        S(i,n)=fd;
        S(n,2:n-1)=fa;
        S(1,2:n-1)=fs;
end
S1=S;
for j=2:n-1;
for i=2:n-1;
   
S1(i,j)=(1/4)*(S(i+1,j)+S(i-1,j)+S(i,j+1)+S(i,j-1));
 
 
error(k)=sum(abs(S1(i,j)-S(i,j)));
 
 
end
end
S=S1;

end
x1=1:n;
 y1=1:n;
 [X,Y]=meshgrid(x1,y1);
 surf(X,Y,S);
shading interp
colorbar('eastoutside')

