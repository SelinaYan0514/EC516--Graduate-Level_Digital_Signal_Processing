[x1, Fs1] = audioread('ece516.wav');
[x2, Fs2] = audioread('Firstname_Lastname.wav');

figure;
subplot(2,1,1);
spectrogram(x1, 256, [], [], Fs1, 'yaxis');
title('Spectrogram of ece516.wav');

subplot(2,1,2);
spectrogram(x2, 256, [], [], Fs2, 'yaxis');
title('Spectrogram of Firstname\_Lastname.wav');
