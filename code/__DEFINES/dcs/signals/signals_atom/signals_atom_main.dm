/**
 *! ## Main Atom Signals. Format:
 * * When the signal is called: (signal arguments)
 * * All signals send the source datum of the signal as the first argument
 */

//! ## /atom Signals.
/// From base of atom/examine(): (/mob, list/examine_text)
#define COMSIG_PARENT_EXAMINE "atom_examine"
/// From base of atom/get_examine_name(): (/mob, list/overrides)
#define COMSIG_ATOM_GET_EXAMINE_NAME "atom_examine_name"
/// From base of atom/examine_more(): (/mob)
#define COMSIG_PARENT_EXAMINE_MORE "atom_examine_more"
	//*Positions for overrides list
	#define EXAMINE_POSITION_ARTICLE 1
	#define EXAMINE_POSITION_BEFORE 2
	//*End positions
	#define COMPONENT_EXNAME_CHANGED (1<<0)
/// Called when an atom is added to the hearers on get_hearers_in_view(): (list/processing_list, list/hearers)
#define COMSIG_ATOM_HEARER_IN_VIEW "atom_hearer_in_view"
/// Called when an atom starts orbiting another atom: (atom/movable/orbiter, radius, clockwise, rotation_speed, rotation_segments, pre_rotation)
#define COMSIG_ATOM_ORBIT_BEGIN "atom_orbit_begin"
/// Called from orbit component: (atom/movable/orbiter, refreshing)
#define COMSIG_ATOM_ORBIT_END "atom_orbit_end"
/// From base of atom/set_opacity(): (new_opacity)
#define COMSIG_ATOM_SET_OPACITY "atom_set_opacity"
