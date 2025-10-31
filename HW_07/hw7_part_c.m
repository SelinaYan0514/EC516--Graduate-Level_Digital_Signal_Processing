%% Experiential DSP Exercise 07 - Part C
% Narrower transition band (EC516)
clc; clear; close all;

fp = 0.5;
fs = 0.555;              % Closer stopband edge
dev_p = 0.05;
dev_s = 0.05;

f_edges = [fp, fs];
mags = [1, 0];
devs = [dev_p, dev_s];

[n, Wn, beta, ftype] = kaiserord(f_edges, mags, devs);
fprintf('--- Part C ---\n');
fprintf('Estimated filter order n = %d\n', n);
fprintf('Beta = %.3f\n', beta);

b = fir1(n, Wn, kaiser(n + 1, beta));
fprintf('Length of impulse response = %d\n', length(b));

[h, w_rad] = freqz(b, 1, 1024);
magnitude_response = abs(h);

% Plot magnitude response
figure;
plot(w_rad/pi, magnitude_response, 'LineWidth', 1.3);
grid on;
xlabel('\omega / \pi'); ylabel('|H(e^{j\omega})|');
title('Part C - Magnitude Response (Narrower Transition Band)');

% Plot Kaiser window
k_window = kaiser(n + 1, beta);
figure;
stem(k_window, 'filled');
title('Part C - Kaiser Window');
xlabel('n'); ylabel('Amplitude');
