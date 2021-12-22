/obj/item/forensics
	icon = 'icons/obj/forensics.dmi'
	w_class = ITEMSIZE_TINY

/datum/data/record/forensic
	name = "forensic data"
	var/uid

/datum/data/record/forensic/New(var/atom/A)
	uid = "\ref [A]"
	fields["name"] = sanitize(A.name)
	fields["area"] = sanitize("[get_area(A)]")
	fields["fprints"] = A.fingerprints ? A.fingerprints.Copy() : list()
	fields["fibers"] = A.suit_fibers ? A.suit_fibers.Copy() : list()
	fields["blood"] = A.blood_DNA ? A.blood_DNA.Copy() : list()
	fields["time"] = world.time

/datum/data/record/forensic/proc/merge(var/datum/data/record/other)
	var/list/prints = fields["fprints"]
	var/list/o_prints = other.fields["fprints"]
	for(var/print in o_prints)
		if(!prints[print])
			prints[print] = o_prints[print]
		else
			prints[print] = stringmerge(prints[print], o_prints[print])
	fields["fprints"] = prints

	var/list/fibers = fields["fibers"]
	var/list/o_fibers = other.fields["fibers"]
	fibers |= o_fibers
	fields["fibers"] = fibers

	var/list/blood = other.fields["blood"]
	var/list/o_blood = other.fields["blood"]
	blood |= o_blood
	fields["blood"] = blood

	fields["area"] = other.fields["area"]
	fields["time"] = other.fields["time"]

/datum/data/record/forensic/proc/update_prints(var/list/o_prints)
	var/list/prints = fields["fprints"]
	for(var/print in o_prints)
		if(prints[print])
			prints[print] = stringmerge(prints[print], o_prints[print])
			.=1
	fields["fprints"] = prints
