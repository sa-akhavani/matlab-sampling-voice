t = 0:0.001:2.649;

fileID = fopen('accel_data.txt');
C = textscan(fileID, '%f%f%f%f');
fclose(fileID);

x = C{1,1};
y = C{1,2};
z = C{1,3};
w = C{1,4};

figure
subplot(4,5,1);
plot(t, x);
subplot(4,5,6);
plot(t, y);
subplot(4,5,11);
plot(t, z);
subplot(4,5,16);
plot(t, w);

for idx = [1, 2, 3]
    ma_length = 10 .^ idx;
    h = 0.1 .* ones(1, ma_length);
    x_out = conv(x,h, 'same');
    y_out = conv(y,h, 'same');
    z_out = conv(z,h, 'same');
    w_out = conv(w,h, 'same');

    subplot(4, 5, idx + 1);    
    plot(t, x_out);

    subplot(4, 5, idx+5 + 1);
    plot(t, y_out);
    
    subplot(4, 5, idx+10 + 1);    
    plot(t, z_out);
    
    subplot(4, 5, idx+15 + 1);
    plot(t, w_out);
    
end
