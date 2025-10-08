//load our rank - > rights associations
/proc/load_admin_ranks()
	#warn impl
	var/previous_rights = 0

	//load text from file
	var/list/Lines = world.file2list("config/admin_ranks.txt")

	//process each line seperately
	for(var/line in Lines)
		if(!length(line))				continue
		if(copytext(line,1,2) == "#")	continue

		var/list/List = splittext(line,"+")
		if(!List.len)					continue

		var/rank = ckeyEx(List[1])
		switch(rank)
			if(null,"")		continue
			if("Removed")	continue				//Reserved

		var/rights = 0
		for(var/i=2, i<=List.len, i++)
			switch(ckey(List[i]))
				if("@","prev")					rights |= previous_rights
				if("buildmode","build")			rights |= R_BUILDMODE
				if("admin")						rights |= R_ADMIN
				if("ban")						rights |= R_BAN
				if("fun")						rights |= R_FUN
				if("server")					rights |= R_SERVER
				if("debug")						rights |= R_DEBUG
				if("permissions","rights")		rights |= R_PERMISSIONS
				if("possess")					rights |= R_POSSESS
				if("stealth")					rights |= R_STEALTH
				if("rejuv","rejuvinate")		rights |= R_REJUVINATE
				if("varedit")					rights |= R_VAREDIT
				if("everything","host","all")	rights |= (R_HOST | R_BUILDMODE | R_ADMIN | R_BAN | R_FUN | R_SERVER | R_DEBUG | R_PERMISSIONS | R_POSSESS | R_STEALTH | R_REJUVINATE | R_VAREDIT | R_SOUNDS | R_SPAWN | R_MOD| R_EVENT)
				if("sound","sounds")			rights |= R_SOUNDS
				if("spawn","create")			rights |= R_SPAWN
				if("mod")						rights |= R_MOD
				if("event")						rights |= R_EVENT

		admin_ranks[rank] = rights
		previous_rights = rights
