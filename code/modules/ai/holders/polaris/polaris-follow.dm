// This handles following a specific atom/movable, without violently murdering it.

/datum/ai_holder/polaris/proc/walk_to_leader()
	polaris_ai_log("walk_to_leader() : Entering.",POLARIS_AI_LOG_TRACE)
	if(!leader)
		polaris_ai_log("walk_to_leader() : No leader.", POLARIS_AI_LOG_WARNING)
		forget_path()
		set_stance(STANCE_IDLE)
		polaris_ai_log("walk_to_leader() : Exiting.", POLARIS_AI_LOG_TRACE)
		return

	// Did we time out?
	if(follow_until_time && world.time > follow_until_time)
		polaris_ai_log("walk_to_leader() : Follow timed out, losing leader.", POLARIS_AI_LOG_INFO)
		lose_follow()
		set_stance(STANCE_IDLE)
		polaris_ai_log("walk_to_leader() : Exiting.", POLARIS_AI_LOG_TRACE)
		return

	var/get_to = follow_distance
	var/distance = get_dist(holder, leader)
	polaris_ai_log("walk_to_leader() : get_to is [get_to].", POLARIS_AI_LOG_TRACE)

	// We're here!
	if(distance <= get_to)
		give_up_movement()
		set_stance(STANCE_IDLE)
		polaris_ai_log("walk_to_leader() : Within range, exiting.", POLARIS_AI_LOG_INFO)
		return

	polaris_ai_log("walk_to_leader() : Walking.", POLARIS_AI_LOG_TRACE)
	walk_path(leader, get_to)
	polaris_ai_log("walk_to_leader() : Exiting.",POLARIS_AI_LOG_DEBUG)

/datum/ai_holder/polaris/proc/set_follow(mob/living/L, follow_for = 0)
	polaris_ai_log("set_follow() : Entered.", POLARIS_AI_LOG_DEBUG)
	if(!L)
		polaris_ai_log("set_follow() : Was told to follow a nonexistant mob.", POLARIS_AI_LOG_ERROR)
		return FALSE

	leader = L
	follow_until_time = !follow_for ? 0 : world.time + follow_for
	polaris_ai_log("set_follow() : Exited.", POLARIS_AI_LOG_DEBUG)
	return TRUE

/datum/ai_holder/polaris/proc/lose_follow()
	polaris_ai_log("lose_follow() : Entered.", POLARIS_AI_LOG_DEBUG)
	polaris_ai_log("lose_follow() : Going to lose leader [leader].", POLARIS_AI_LOG_INFO)
	leader = null
	give_up_movement()
	polaris_ai_log("lose_follow() : Exited.", POLARIS_AI_LOG_DEBUG)

/datum/ai_holder/polaris/proc/should_follow_leader()
	if(!leader)
		return FALSE
	if(follow_until_time && world.time > follow_until_time)
		lose_follow()
		set_stance(STANCE_IDLE)
		return FALSE
	if(get_dist(holder, leader) > follow_distance)
		return TRUE
	return FALSE
