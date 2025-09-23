% number of samples
nfft_1 = 512;
nfft_2 = 1024;

% fft command takes two inputs. 
% x, which is the signal got from audio read; 
% n, which is the number of samples defined initially.
X_1 = fft(x, nfft_1);
X_2 = fft(x, nfft_2);

% Plot two stem magnitude spectrum in dB: 
% Note: the x-axis represents the frequency, which spans from 0 to 2pi
figure(1);
stem(20*log10(abs(X_1)));
title('FFT with nfft = 512');

figure(2);
stem(20*log10(abs(X_2)));
title('FFT with nfft = 1024');

