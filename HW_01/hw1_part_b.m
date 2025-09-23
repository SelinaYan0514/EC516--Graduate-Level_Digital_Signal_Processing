Fs = 16000; nBits = 16; nChannels = 1;
recObj = audiorecorder(Fs, nBits, nChannels);

disp('Start speaking...');
record(recObj);
pause;             % 按任意键停止
stop(recObj);
disp('Recording stopped.');

audioData = getaudiodata(recObj);
audiowrite('Firstname_Lastname.wav', audioData, Fs);
  