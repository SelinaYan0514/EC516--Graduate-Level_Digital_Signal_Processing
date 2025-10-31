%% Part C: Reduced Transition Bandwidth
% Change stopband edge fs
fp = 0.5;
fs = 0.555; % narrower transition band
dev_p = 0.05;
dev_s = 0.05;

% 1. Define new specs
f_edges = [fp, fs];
mags = [1, 0];
devs = [dev_p, dev_s];

% 2. Estimate new order
[n, fo, ao, w] = firpmord(f_edges, mags, devs);

% 3. Design filter
b = firpm(n, fo, ao, w);

% 4. Display the length
fprintf('Part C: The length of the impulse response is: %d\n', length(b));

% 5. Plot magnitude response
[h, w_rad] = freqz(b, 1, 1024);
magnitude_response = abs(h);

figure;
plot(w_rad/pi, magnitude_response, 'm', 'LineWidth', 1.5);
title('Part C: Magnitude Response with Narrower Transition Band');
xlabel('\omega / \pi');
ylabel('|H(e^{j\omega})|');
grid on;
