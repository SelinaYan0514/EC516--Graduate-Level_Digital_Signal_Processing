
% Experiential DSP Exercise 03

% Main script: Recording → Upsampling → Interpolation → Downsampling

clear; clc; close all;

% ----------------- A. Record and Load! -----------------
Fs = 16000;       % Sampling frequency
nBits = 16;       % Bit depth
nChannels = 1;    % Mono

recObj = audiorecorder(Fs, nBits, nChannels);

disp('Start speaking: "Six students went to school"');
record(recObj);       % Start recording
pause;                % Press any key to stop recording
stop(recObj);         % Stop recording

% Get audio data from recorder
audioData = getaudiodata(recObj);

% Save audio data into a WAV file
audiowrite('audio.wav', audioData, Fs);

% Reload audio file for processing
[x, F] = audioread('audio.wav');

figure;
plot(x);
title('Original Audio Signal');
xlabel('Sample Index'); ylabel('Amplitude');


% ----------------- B. Digital Upsampling -----------------
U = 4;   % Upsampling factor

% Perform zero-insertion upsampling
isr_x = upsample(x, U);

% Plot: Original vs IncreasedSR
figure;
subplot(2,1,1); plot(x); title('Original');
subplot(2,1,2); plot(isr_x); title('IncreasedSR (zero-inserted)');

% Load interpolation filter
load('filter1.mat','b');  
upsampled_x = filter(b, 1, isr_x);

% Plot: Interpolated Upsampled signal
figure;
plot(upsampled_x);
title('Upsampled (Interpolated)');
xlabel('Sample Index'); ylabel('Amplitude');


% ----------------- C. Digital Downsampling -----------------
% Load anti-aliasing filter
load('filter2.mat','b');
filtered_upsampled_x = filter(b, 1, upsampled_x);

% Perform downsampling
D = 4;
downsampled_upsampled_x = downsample(filtered_upsampled_x, D);

% Plot: Compare Original and Downsampled
figure;
subplot(2,1,1); plot(x); title('Original');
subplot(2,1,2); plot(downsampled_upsampled_x); title('Downsampled after Upsample+Filter');

