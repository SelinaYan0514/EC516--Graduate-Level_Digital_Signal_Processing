%% Experiential DSP Exercise 07 - Part A
% FIR filter design using Kaiser window (EC516)
clc; clear; close all;

fp = 0.5;                % Passband edge frequency
fs = 0.6;                % Stopband edge frequency
dev_p = 0.1;             % Passband tolerance
dev_s = 0.05;            % Stopband tolerance

f_edges = [fp, fs];
mags = [1, 0];
devs = [dev_p, dev_s];

% Kaiser window design parameters
[n, Wn, beta, ftype] = kaiserord(f_edges, mags, devs);
fprintf('--- Part A ---\n');
fprintf('Estimated filter order n = %d\n', n);
fprintf('Beta = %.3f\n', beta);
fprintf('Filter type = %s\n', ftype);

% Design FIR filter
b = fir1(n, Wn, kaiser(n + 1, beta));
fprintf('Length of impulse response = %d\n', length(b));

% Frequency response
[h, w_rad] = freqz(b, 1, 1024);
magnitude_response = abs(h);

% Plot magnitude response
figure;
plot(w_rad/pi, magnitude_response, 'LineWidth', 1.3);
grid on;
xlabel('\omega / \pi'); ylabel('|H(e^{j\omega})|');
title('Part A - Magnitude Response (Kaiser Window)');

% Plot Kaiser window
k_window = kaiser(n + 1, beta);
figure;
stem(k_window, 'filled');
title('Part A - Kaiser Window');
xlabel('n'); ylabel('Amplitude');
