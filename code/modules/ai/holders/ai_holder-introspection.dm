
//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2024 Citadel Station Developers           *//

/datum/ai_holder/proc/introspection_record_thought(msg)
	#ifdef AI_INTROSPECTION
	introspection_thoughts += msg
	if(length(introspection_thoughts) > AI_INTROSPECTION_THOUGHT_BUFFER * 2)
		introspection_thoughts.Cut(1, length(introspection_thoughts) - AI_INTROSPECTION_THOUGHT_BUFFER + 1)
	#endif
