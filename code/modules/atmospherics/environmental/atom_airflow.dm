/atom/movable
	// Space wind properties
	/// Can this atom be blown by airflow?
	var/airflow_affected = FALSE
	/// Pressure differential needed to be blown by atmos wind.
	var/airflow_resistance = INFINITY

	// Airflow processing
	/// is airflow being done right now?
	var/tmp/airflow_active = FALSE
	/// dx of airflow momentum
	var/tmp/airflow_dx
	/// dy of airflow momentum
	var/tmp/airflow_dy
	/// tiles left to move
	var/tmp/airflow_left
	/// next airflow in ds
	var/tmp/airflow_wait
	/// what we're trying to reach
	var/tmp/turf/airflow_target

/atom/movable/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(AM.density && airflow_active)
		airflow_collide(AM)


