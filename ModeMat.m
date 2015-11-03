function [N, Modemat] = ModeMat(lambda)
	% N is number of modes for wavelength lambda, Modemat is N*4 matrix
	% Modemat(N,1)=m, (N,2)=n, (N,3)=beta
	% lambda in um
	NoMode = 1;
	N = 0;
	N1 = [];
	N2 = [];
	N3 = [];
	% mode number m
	mmode = 0;
	while NoMode ~= 0
	    b = Beta(mmode,lambda);
        %length(a)
        N = N + length(b);
        N1 = [N1, ones(1,length(b))*mmode];
        N2 = [N2, 0:length(b)-1];
        N3 = [N3, b];
        mmode = mmode + 1;
        NoMode = length(b);
    end;
    % generate modemat
    Modemat = zeros(3,N);
    Modemat(1,:) = N1;
    Modemat(2,:) = N2;
    Modemat(3,:) = N3;
