x = -60000:0.2:15000;
ii = 1:375001;
tx = x/3e2;
fwhm = 10;
tao = fwhm/2.35482*sqrt(2)*300;
Lambda = 1600000/(1503492+267);
arrit = dlmread('arrit.dat');

w = 3e14/Lambda*2*pi;
kb = 2*pi/Lambda;
L = 1e7;
t = min(arrit);

tic;
for k = 1:length(arrit)
        pixelcos = 0*x;
        %pixelsin = 0*x;
        pixelcos = exp(-1*(x+(arrit(k)-t)*3e14).^2/tao/tao).*cos(w*t-kb*x);
        %pixelcos = exp(-1*(x+(max(arrit)-t)*3e14).^2/tao/tao).*cos(w*t-kb*x);
        pixelsin = exp(-1*(x+(arrit(k)-t)*3e14).^2/tao/tao).*sin(w*t-kb*x);
        pcos = pixelcos(find(mod(ii,1000)==0));
        %tt = tx(find(mod(ii,1000)==0));
        psin = pixelsin(find(mod(ii,1000)==0));
        dlmwrite(strcat('pixel/pcos',num2str(k),'.dat'),pcos,'precision',16);
        dlmwrite(strcat('pixel/psin',num2str(k),'.dat'),psin,'precision',16);
        k
        
end;
toc;











