clear all; close all; clc;

notes();
FS = 16000;
nf=[E E F G    G   F E D  C   C   D   E   E   D   D    E E   F   G    G F   E   D   C   C   D   E    D    C   C ];
nd=[4 4 4 4    4   4 4 4  4   4   4   4   8/3 8   2    4 4   4   4    4 4   4   4   4   4   4   4    8/3  8   2 ];
na=[1 1 1 1.3  1.4 1 1 1  1.5 1.2 1   1   1.5 2   2    2 1.5 1.2 1    2 1.5 1.2 1   2   1.5 1.5 1.2  1.8  2   2 ];
TD=1.5;

sum = 0;
new_sum = 0;
tmp_sum = 0;
leng = length(nf);
for i = 1:leng
    sum = sum + (TD/nd(i)*FS);
end
x = zeros(1, sum);

for i = 1:leng
    tt = @(i) 0: 1/FS : TD/nd(i);
    xtmp = zeros(1, length(tt(i)));
    for j = 1:10
        xtmp = xtmp + na(i) .* sin(2 * pi .* j .* nf(i) .* tt(i)) / j;
    end
    tmp_sum = new_sum;
    new_sum = new_sum + (FS*(TD/nd(i)));
    xtmp = xtmp .* exp(tt(i));
    x(tmp_sum+1:new_sum+1) = xtmp;
end

audiowrite('sampleOut.wav', x, FS);