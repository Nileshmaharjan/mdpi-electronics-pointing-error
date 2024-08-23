# mdpi-electronics-pointing-error


Overview
This repository contains code and simulations related to the study of pointing error in satellite communication systems. The simulation focuses on open-loop control, where the displacement caused by pointing errors is analyzed.

Directory Structure
Main Folder: SDPT3-4.0
Within the main folder, navigate to the pe folder where the primary simulation files are located.

Inside the pe Folder
To run the simulation and generate the relevant data:
1. Run the Simulation:
    * Execute pointing_error.m to start the simulation.
2. Modify Parameters:
    * To generate the database or modify the simulation parameters, adjust the following files:
        * retrieve_transmitter_info.m: Contains the transmitter's parameters.
        * retrieve_receiver_info.m: Contains the receiver's parameters.
        * retrieve_other_system_parameters.m: Defines additional system parameters.
        * retrieve_gain.m: Computes the gain used in the simulation.

Note: 


The values for I0, sigma, and Attenuation are adjustable and correspond to different weather conditions or times of day (e.g., noon, foggy).
The script currently simulates an open-loop system where feedback is not used to correct the pointing error.
