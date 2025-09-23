
% Read the audio samples x and sampling rate Fs in Hz using the audioread command.
[x, Fs] = audioread('audio.wav');

% Create a time axis
t = (0:length(x)-1)/Fs;

% Plot the signal
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Waveform');

