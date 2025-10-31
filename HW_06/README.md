# Experiential DSP Exercise 06 (100 points)

**Note: There was no Experiential DSP Exercise 05 because of Midterm 1.**

In this assignment, we are going to design three different types of FIR filters with different specifications and we are going to analyze how they will behave. The MATLAB tools that can help us design an optimal FIR filter are `firpmord` which will estimate the filter order and `firpm` which will design the filter. **NOTE:** In Matlab, frequency is normalized so that π rad/s is represented as 1.0. Also, the "pm" in "firpm" stands for the **Parks-McClellan** design method for FIR filters that we are going to be discussing later in EC516.

---

## Part A:

1. Assign these variables:

```matlab
fp = 0.5; % Passband edge frequency
fs = 0.6; % Stopband edge frequency
dev_p = 0.1; % Passband tolerance
dev_s = 0.05; % Stopband tolerance
```

2. Now we will form the required inputs for the filter design tool in MATLAB as:
```matlab
f_edges = [fp, fs]; mags = [1, 0]; devs = [dev_p, dev_s];
```

3. Write `[n, fo, ao, w] = firpmord(f_edges, mags, devs);` this command takes your desired filter specifications and gives out the necessary parameters for the `firpm` command. Parameter n tells you the lowest order FIR filter that should meet your specifications, fo are the frequency edges, ao are the corresponding amplitudes for the normalized frequency bands, and w are weighting values for each band.

4. Design the filter by writing `b = firpm(n, fo, ao, w);`

5. b contains the impulse response coefficients and we want to know the length of the impulse response so: 
```matlab
fprintf('The length of the impulse response is: %d\n', length(b));
```

6. We also need to compute and plot the magnitude of the frequency response. So first compute it by: 
```matlab
[h, w_rad] = freqz(b, 1, 1024); magnitude_response = abs(h);
```

7. Plot the magnitude response: 
```matlab
plot(w_rad/pi, magnitude_response);
```
You can add essential labels and title to make the figure more descriptive.

---

## Part B:

1. Change the specifications of the filter to: `dev_p = 0.05;` and leave everything else the same as Part A.

2. Repeat steps 2-7 of part A. Compare the length of the new impulse response with part A.

---

## Part C:

1. Change the specifications of the filter to: `fs = 0.555;` and leave everything else the same as Part B.

2. Repeat steps 2-7 of part A. Compare the length of the new impulse response with part A and B.
