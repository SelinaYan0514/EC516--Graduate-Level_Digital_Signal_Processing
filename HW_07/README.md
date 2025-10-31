# Experiential DSP Exercise 07 (100 points)

In this assignment, we are going to design FIR filters with the same specifications as in Experiential DSP Exercise 06, but this time with the Kaiser windowing method. You'll use the `kaiserord` function to estimate the required parameters and the `fir1` function to perform the actual filter design. At the end, you will compare your observations with those in Experiential DSP Exercise 06.

## Part A:

1. For the first filter, we are going to use the same specification as **Part A in Assignment 6**:
```matlab
fp = 0.5; % Passband edge frequency
fs = 0.6; % Stopband edge frequency
dev_p = 0.1; % Passband tolerance
dev_s = 0.05; % Stopband tolerance
```

2. Now we will form the required inputs for the kasier window function in MATLAB as:
```matlab
f_edges = [fp, fs]; mags = [1, 0]; devs = [dev_p, dev_s];
```

3. Write `[n, Wn, beta, ftype] = kaiserord(f_edges, mags, devs);`

   **a. n:** This is the estimated filter order, representing the minimum number of taps (or delays) needed to meet the design specifications.
   
   **b. Wn:** This is the normalized cutoff frequency for the filter, which defines the point halfway between the passband and stopband.
   
   **c. beta:** This is a shape parameter for the Kaiser window that controls the trade-off between the stopband attenuation and the transition bandwidth.
   
   **d. ftype:** This string indicates the filter type to be designed, such as 'low' for a low-pass filter or 'bandpass' for a bandpass filter.

4. Print the values of n and beta.

5. Design the filter by writing `b = fir1(n, Wn, kaiser(n + 1, beta));`

6. `b` contains the impulse response coefficients and we want to know the length of the impulse response so: `fprintf('The length of the impulse response is: %d\n', length(b));`

7. We also need to compute and plot the magnitude of the frequency response. So first compute it by: `[h, w_rad] = freqz(b, 1, 1024); magnitude_response = abs(h);`

8. Plot the magnitude response: `plot(w_rad/pi, magnitude_response);` You can add essential labels and a title to make the figure more descriptive.

9. Plot the Kaiser window by getting it from `k_window = kaiser(n + 1, beta);` and create the stem plot `stem(k_window, 'filled');`

10. Compare the length of the impulse response with Part A of Assignment 6.

## Part B:

1. Change the specifications of the filter to: `dev_p = 0.05;` and leave everything else the same as Part A.

2. Repeat steps 2-10 of part A. Compare the length of the new impulse response with part A.

## Part C:

1. Change the specifications of the filter to: `fs = 0.555;` and leave everything else the same as Part B.

2. Repeat steps 2-10 of part A. Compare the length of the new impulse response with parts A and B.
