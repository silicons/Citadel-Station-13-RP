#warn audit ids, there's dupes. also, namespaces.

#define ACCESS_CENTCOM_GENERAL 101
STANDARD_ACCESS_DATUM("general", ACCESS_CENTCOM_GENERAL, centcom/general, "General Facilities")

#define ACCESS_CENTCOM_THUNDERDOME 102
STANDARD_ACCESS_DATUM("thunderdome", ACCESS_CENTCOM_THUNDERDOME, centcom/thunderdome, "Entertainment Facilities")

#define ACCESS_CENTCOM_ERT 103
STANDARD_ACCESS_DATUM("ert", ACCESS_CENTCOM_ERT, centcom/ert, "Emergency Response Team")

#define ACCESS_CENTCOM_MEDICAL 104
STANDARD_ACCESS_DATUM("medical", ACCESS_CENTCOM_MEDICAL, centcom/medical, "Medical Facilities")

#define ACCESS_CENTCOM_DORMS 105
STANDARD_ACCESS_DATUM("dorms", ACCESS_CENTCOM_DORMS, centcom/dorms, "Dormitories")

#define ACCESS_CENTCOM_STORAGE 106
STANDARD_ACCESS_DATUM("storage", ACCESS_CENTCOM_STORAGE, centcom/storage, "Storage")

#define ACCESS_CENTCOM_TELEPORTER 107
STANDARD_ACCESS_DATUM("teleporter", ACCESS_CENTCOM_TELEPORTER, centcom/teleporter, "Teleporter")

#define ACCESS_CENTCOM_ERT_LEAD 108
STANDARD_ACCESS_DATUM("ert", ACCESS_CENTCOM_ERT_LEAD, centcom/ert_lead, "ERT Administration")

#define ACCESS_CENTCOM_ADMIRAL 109
STANDARD_ACCESS_DATUM("admiral", ACCESS_CENTCOM_ADMIRAL, centcom/admiral, "Admiral")
	access_edit_region = ACCESS_REGION_ALL
	access_edit_type = ACCESS_TYPE_CENTCOM | ACCESS_TYPE_STATION
