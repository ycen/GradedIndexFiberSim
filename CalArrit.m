L = 10e6;
n1=1.479;
NA = 0.2;
n2=sqrt(n1^2-NA^2);
delta = (n1-n2)/n1;
c = 3e14;
dt = n1/2/c*delta^2*L;
w = 2*pi/(1.064/3e14);

modemat = dlmread('modematrix/mm267.dat');
mint = L/(w/min(modemat(3,:)));
minm = min(modemat(3,:));
db = max(modemat(3,:))-minm;
arrit = [];
for i = 1:length(modemat(3,:))
	arrit = [arrit, mint+dt*(modemat(3,i)-minm)];
end;

dlmwrite('arrit.dat',arrit,'precision',16);