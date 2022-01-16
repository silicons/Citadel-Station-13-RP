// open_state on /datum/surgery_data
/// Limb not open
#define SURGERY_OPEN_NONE			0

/// Limb incised into - organic - this is usually considered 'partially open' for encased and fully otherwise
#define SURGERY_OPEN_INCISION		10
/// Limb skin fully retracted - organic - this is usually considered 'partially open' for encased and fully otherwise
#define SURGERY_OPEN_NORMAL			11
/// For encased/ribcage/skull limbs, bones are sawed through - organic - this is considered fully open for encased and nonsensical otherwise
#define SURGERY_OPEN_BONE			12

/// Limb panel unscrewed - robotic
#define SURGERY_OPEN_UNSCREWED		21
/// Limb panel opened - robotic - this is considered fully opened
#define SURGERY_OPEN_PANEL			22

// surgery_type on /datum/surgery_data
/// Unused - simply leave limb surgery data var null
#define SURGERY_TYPE_NONE			0
/// Organic limb surgeries
#define SURGERY_TYPE_ORGANIC		1
/// Robotic limb surgeries
#define SURGERY_TYPE_ROBOTIC		2

// bloody var on /datum/surgery_step/organic
/// do not leave blood
#define SURGERY_BLOODLESS			0
/// leave blood on hands
#define SURGERY_BLOOD_MINOR			1
/// leave blood everywhere
#define SURGERY_BLOOD_MAJOR			2

// state defines

// /datum/surgery_state/robotic/open_panel
#define SURGERY_STATE_PANEL_UNSCREWED		1

// /datum/surgery_state/organic/open_incision
#define SURGERY_STATE_SCALPEL				1
#define SURGERY_STATE_RETRACTOR				2
#define SURGERY_STATE_HEMOSTAT				3

// /datum/surgery_state/organic/open_encased
#define SURGERY_STATE_SAW_ENCASING			1
#define SURGERY_STATE_OPEN_ENCASING			2

// /datum/surgery_state/organic/close_encased
#define SURGERY_STATE_CLOSE_ENCASING		1
#define SURGERY_STATE_MEND_ENCASING			2

