Fs = 16000; nBits = 16; nChannels = 1;
recObj = audiorecorder(Fs, nBits, nChannels);

disp('Start speaking...');
record(recObj);
% click any key to stop
pause;             
stop(recObj);
disp('Recording stopped.');

audioData = getaudiodata(recObj);
audiowrite('Firstname_Lastname.wav', audioData, Fs);
  
