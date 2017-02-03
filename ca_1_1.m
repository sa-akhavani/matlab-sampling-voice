t = 0:0.001:20;
y1 = cos(4.*pi.*t);
y2 = exp(j.*t);
y3= cos(2.*pi.*t)+cos(pi.*t);
y = 1 + y1 + (y2 .* y3);
plot(t,abs(y));
hold on;
plot(t,angle(y));
