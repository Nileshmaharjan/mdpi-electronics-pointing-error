# mdpi-electronics-pointing-error



Instructions for Running Simulations

1. Clone the repository: git clone https://github.com/Nileshmaharjan/mdpi-electronics-pointing-error
2. Navigate to the Main Folder: cd mdpi-electronics-pointing-error
3. Locate the Simulation Files: The primary simulation files are in the repository's root directory. Key MATLAB scripts include:
   - pointing_error.m
   - retrieve_transmitter_info.m
   - retrieve_receiver_info.m
   - retrieve_other_system_parameters.m
   - retrieve_gain.m
4. Run the Simulation: pointing_error.m
5. Modify Parameters to Generate Custom Datasets: Adjust various simulation parameters to generate datasets tailored to different conditions. These parameters include transmitter power, receiver sensitivity, environmental factors (like weather conditions), and more. The relevant scripts to modify are:

   - retrieve_transmitter_info.m: Modify transmitter parameters such as I0, sigma, and rp.
   - retrieve_receiver_info.m: Adjust receiver characteristics including al, rl, and wl.
   - retrieve_other_system_parameters.m: Define additional system parameters like matrices A, B, C, and R.
   - retrieve_gain.m: Set the system gain and attenuation factors.
  
By changing these parameters, a generated dataset is similar to the one you provided (dataset.csv), under different simulated conditions.

- The values for I0, sigma, and Attenuation are adjustable and correspond to different weather conditions or times of day (e.g., noon, foggy).
- The script simulates an open-loop system where feedback is not used to correct the pointing error.
