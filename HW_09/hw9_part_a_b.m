%% Step 1: Place ece516.wav in your current MATLAB folder
% (check with pwd or use the Current Folder pane)

%% Step 2: Read the audio and sampling rate
[y, Fs] = audioread('ece516.wav');

%% Step 3: Set nfft
nfft = 1024;

%% Step 4: Set win_len_ms
win_len_ms = 100;

%% Step 5: Based on the window length, compute the number of samples
win_len_samp = round(win_len_ms * Fs / 1000);

%% Step 6: Design the window
win = hamming(win_len_samp);

%% Step 7: Calculate the number of overlapping samples
noverlap = round(win_len_samp * 0.5);

%% Step 8: Plot Wideband spectrogram
figure;
spectrogram(y, win, noverlap, nfft, Fs, 'yaxis');
title('Wideband Spectrogram (100 ms window)');
xlabel('Time (s)');
ylabel('Frequency (kHz)');

%% Step 9: Repeat steps 1-8 for win_len_ms = 200 (Narrowband)
win_len_ms = 200;
win_len_samp = round(win_len_ms * Fs / 1000);
win = hamming(win_len_samp);
noverlap = round(win_len_samp * 0.5);

figure;
spectrogram(y, win, noverlap, nfft, Fs, 'yaxis');
title('Narrowband Spectrogram (200 ms window)');
xlabel('Time (s)');
ylabel('Frequency (kHz)');