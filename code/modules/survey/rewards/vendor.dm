GLOBAL_DATUM_INIT(survey_gbp_network, /datum/gbp_network/survey, new)

/obj/machinery/gbp_vendor/survey

#warn impl all

/obj/machinery/gbp_vendor/survey/init_network()
	network = GLOB.survey_gbp_network
