t = -20:0.001:20;
y1 = cos(4.*pi.*t);
y2 = exp(j.*t);
y3= cos(2.*pi.*t)+cos(pi.*t);
x = 1 + y1 + (y2 .* y3);

h1 = exp(t);
h2 = exp(-t);

z1 = conv(h1, x, 'same');
z2 = conv(h2, x, 'same');

plot(t,z1);
hold on;
plot(t,z2);