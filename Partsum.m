function [y,t]=Partsum(x,M,win,T)
% partsum calculates the partial Fourier series of x with period T
% including out to the Mth harmonic
% win=0 specifies rectangular window (default)
% win=1 specifies hamming window
% win=2 specifies hanning window
% win=3 specifies a triangular window
% x must be described over T starting from t = 0 in a 1024-point vector
% The command format is [partial_sum,time]=Partsum(x,M,win,T)
% Used without output arguments, Partsum plots the results
%
% from Concepts p220
 
if nargin==2			% provide default T and w for two input arguments
T=1;w=1;
end
 
if nargin==3			% provide default T for three input arguments
T=1;
end
 
if nargin>=3			% determine the desired window
	if win==3
		w=triang(2*M+1);
	elseif win==2
		w=hanning(2*M+1);
	elseif win==1
		w=hamming(2*M+1);
	else
		w=1;
	end
end
 
% begin program
cm = fft(x,1024);							% calculate the Fourier coefficients
ccm = fftshift(cm);							% center on d-c (see fig 7.16)
m = -M:M;
dd = ccm(513+m).*w';						        % window the desired harmonics
ddm = [zeros(1,512-M) dd zeros(1,511-M)];	                        % zero the rest
dm = fftshift(ddm);							% put back to proper order
yy=real(ifft(dm));							% take the inverse transform
tt=(0:1023)*T/1024;							% create the time vector
% end program
 
if nargout==0			% determine the output desired
	plot(tt,real(yy))
	xlabel('t seconds')
	ylabel('fp(t)')
	grid
elseif nargout==1
	y=real(yy);
elseif nargout==2
	y=real(yy);t=tt;
end