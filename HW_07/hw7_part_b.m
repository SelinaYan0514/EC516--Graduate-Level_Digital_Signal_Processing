%% Experiential DSP Exercise 07 - Part B
% Reduced passband tolerance (EC516)
clc; clear; close all;

fp = 0.5;
fs = 0.6;
dev_p = 0.05;            % Smaller passband ripple
dev_s = 0.05;

f_edges = [fp, fs];
mags = [1, 0];
devs = [dev_p, dev_s];

[n, Wn, beta, ftype] = kaiserord(f_edges, mags, devs);
fprintf('--- Part B ---\n');
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
title('Part B - Magnitude Response (Smaller dev_p)');

% Plot Kaiser window
k_window = kaiser(n + 1, beta);
figure;
stem(k_window, 'filled');
title('Part B - Kaiser Window');
xlabel('n'); ylabel('Amplitude');
