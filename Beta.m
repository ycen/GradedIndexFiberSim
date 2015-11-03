function beta = Beta(m,lambda)

a = 25;
NA = 0.2;
n1 = 1.479;
n2 = sqrt(n1^2-NA^2);
V = 2*pi/lambda*a*NA;

beta = [];
moden = 0;
k0 = 2*pi/lambda;
bmn2 = k0^2*n1^2-V/a^2*(2*m+1)-V/a^2*(2*moden+1);
bmn = sqrt(bmn2);
while (bmn<k0*n1)&&(bmn>k0*n2)
	beta = [beta,bmn];
	moden = moden+1;
	bmn2 = k0^2*n1^2-V/a^2*(2*m+1)-V/a^2*(2*moden+1);
	bmn = sqrt(bmn2);
end;
