[x, F] = audioread('Firstname_Lastname.wav');   % x: 音频信号, F: 采样率
soundsc(x,F);                       % 播放音频

duration = length(x)/F;

t = (0:length(x)-1)/F;


plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Waveform of ece516.wav');
