function Fun = ModeFun(m,n,lambda)

a=25;
%lambda=1.064;
NA=0.2;
n1=1.479;
n2=sqrt(n1^2-NA^2);
V=2*pi/lambda*a*NA;

[X,Y] = meshgrid(linspace(-30,30,110));
r = sqrt(V)/a;
Nn = sqrt(r/2^n/factorial(n)/sqrt(pi));
Nm = sqrt(r/2^m/factorial(m)/sqrt(pi));

f = (Nn*hermiteM(n,r*Y).*exp(-0.5*(r*Y).^2)).*(Nm*hermiteM(m,r*X).*exp(-0.5*(r*X).^2));

Norm = sum(sum(f.*f));
if Norm~=0
	Fun = f/sqrt(Norm);
else
	Fun = c;
end;