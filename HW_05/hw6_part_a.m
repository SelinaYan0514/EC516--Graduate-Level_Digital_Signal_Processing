%% Part A: Base FIR Filter Design
% Specifications
fp = 0.5;   % Passband edge frequency (normalized)
fs = 0.6;   % Stopband edge frequency (normalized)
dev_p = 0.1; % Passband tolerance
dev_s = 0.05; % Stopband tolerance

% 1. Define filter specs
f_edges = [fp, fs];
mags = [1, 0];
devs = [dev_p, dev_s];

% 2. Estimate the filter order using firpmord
[n, fo, ao, w] = firpmord(f_edges, mags, devs);

% 3. Design the filter using Parks–McClellan algorithm
b = firpm(n, fo, ao, w);

% 4. Display the length of impulse response
fprintf('Part A: The length of the impulse response is: %d\n', length(b));

% 5. Compute and plot the frequency response
[h, w_rad] = freqz(b, 1, 1024);
magnitude_response = abs(h);

figure;
plot(w_rad/pi, magnitude_response, 'LineWidth', 1.5);
title('Part A: Magnitude Response of FIR Filter');
xlabel('\omega / \pi');
ylabel('|H(e^{j\omega})|');
grid on;
