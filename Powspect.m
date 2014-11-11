function []=Powspect(x)
[m,c] = Dispect(x);
P=x*x'/102;
c=100*abs(c).^2/P;
stem(m,c)
ylabel('%of total power')
xlabel('m harmonic number')
grid