%% Part B: Reduced Passband Tolerance
% Only change dev_p, others stay the same
fp = 0.5;
fs = 0.6;
dev_p = 0.05; % smaller passband tolerance
dev_s = 0.05;

% 1. Define new specs
f_edges = [fp, fs];
mags = [1, 0];
devs = [dev_p, dev_s];

% 2. Estimate the new order
[n, fo, ao, w] = firpmord(f_edges, mags, devs);

% 3. Design new filter
b = firpm(n, fo, ao, w);

% 4. Display the length
fprintf('Part B: The length of the impulse response is: %d\n', length(b));

% 5. Plot new frequency response
[h, w_rad] = freqz(b, 1, 1024);
magnitude_response = abs(h);

figure;
plot(w_rad/pi, magnitude_response, 'r', 'LineWidth', 1.5);
title('Part B: Magnitude Response with Smaller Passband Tolerance');
xlabel('\omega / \pi');
ylabel('|H(e^{j\omega})|');
grid on;
