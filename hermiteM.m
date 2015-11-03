function hermiteM = hermiteM (norder,inputM)

[x1,x2] = size(inputM);
outputM = inputM*0;
for i = 1:x1
    outputM(i,:) = hermite(norder,inputM(i,:));
end;
hermiteM = outputM;