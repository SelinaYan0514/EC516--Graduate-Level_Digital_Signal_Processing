Experiential DSP Exercise 01
Part A: Basic visualization of the provided audio file.
1) Load and play the file.
a. Place ece516.wav in your current MATLAB folder (check with pwd or use the
Current Folder pane).
b. Read the audio and sampling rate using the audioread command. (Note that
this command gives you two outputs, x and F. We need both outputs for this
assignment.)
c. Play the audio (use soundsc to avoid clipping).
d. Listen and write down in your report what you hear (the spoken content).
2) Waveform
a. Use x and F from earlier to compute the duration of the file.
b. Create a time axis in seconds.
c. Plot the waveform of the signal using the plot command.
3) Arbitrary speech section
a. Choose a section of the speech waveform starting at some index k.
b. Extract 320 samples from the file starting from chosen k. (Be careful that k +
319 £ length(x)).
c. Create a stem plot of the chosen chunk using the stem command.
Part B: Now you record!
1) Record and save:
a. Open the MATLAB software.
b. Set these variables: Fs = 16000; nBits = 16; nChannels = 1;
c. Create an audio recorder object using the recObj = audiorecorder(Fs,
nBits, nChannels)command and pass the defined variables in step 1 to it.
d. Use the record(recObj) command to start recording. In the recording, you
should say: “My name is YYY,
” where YYY is your first and last names.
e. Write the command pause. With this command, you can stop recording by
pressing any key on your keyboard.
f. g. Use the stop(recObj) command to stop recording.
Get the recorded data using by getaudiodata(recObj) command.
h. Save the recorded audio using the audiowrite(filename, audioData,
Fs); choose filename as: Firstname_Lastname.wav.
2) Apply all the steps in part A to your recording.
Part C: Plotting Spectrograms
1) Load both ece516.wav and Firstname_Lastname.wav audio files.
2) Create the spectrogram plots of ece516.wav and your audio file using the
spectrogram command.
3) In each spectrogram, identify the regions where the speaker is silent. Explain how
you find those regions. How are they different from the rest of the plot?
