function [mm,c] = Dispect(x)

cm = fft(x,1024)/1024;
ccm = fftshift(cm);
totpow=x*x'/1024;
P = (abs(cm(1)))^2; n=1;
while P< .98*totpow
    n = n+1;
    P = P +2*(abs(cm(n)))^2;
end
nn = -n:n;
ddm = ccm (513+nn);

if nargout==0
    stem(nn,abs(ddm))
    xlabel('m (harmonic number)')
    ylabel('spectrum amplitude')
    grid
    
else
    c = ddm; mm = nn;
end
