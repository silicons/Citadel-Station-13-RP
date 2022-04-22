// core file
// put all new power usage and value stuff in here

/**
 * stuff to note
 *
 * energy storage on the backend should always be measured in joules for common procs
 * energy usage will always be joules. something like "use 3500 watts every 2 seconds" would proc 7000J of usage
 * energy flow will always be measured in watts because we're not simulating voltage and amp on this shit 1990s engine
 */




#define CELLRATE 0.002 // Multiplier for watts per tick <> cell storage (e.g., 0.02 means if there is a load of 1000 watts, 20 units will be taken from a cell per second)
					   // It's a conversion constant. power_used*CELLRATE = charge_provided, or charge_used/CELLRATE = power_provided

#define KILOWATTS *1000
#define MEGAWATTS *1000000
#define GIGAWATTS *1000000000
