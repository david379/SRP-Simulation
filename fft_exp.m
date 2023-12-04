

v_TD = randn(30000 , 1);

A = size(v_TD, 1) / 2;
% hold on
% plot(-A:(A-1), abs(fftshift(fft(v_TD(:, 1)))))

%%
Fs = 32000
T = 1/Fs;
t = (1:2*A) * T;
% y = sin(2 * pi * 500 * t);

figure(1);
plot(t, v_TD)

figure(2);
f = (-A:(A-1)) * Fs / (2*A);
F = fftshift(fft(v_TD));
plot(f, abs(F))

f_cutoff = 10;
F_cut = [];
F_cut = [F_cut; (1:(A - f_cutoff)).' * 0];
F_cut = [F_cut; F((A - f_cutoff + 1):(A + f_cutoff))];
F_cut = [F_cut; ((A + f_cutoff + 1):2*A).' * 0];

figure(3);
plot(f, F_cut)

v_cut = ifft(ifftshift(F_cut));
figure(4);
plot(t, v_cut)

 