/datum/gbp_network
	/// stored points - this is also the list of what points we support
	var/list/stored = list()
	/// logs - raw text
	var/list/logs = list()
	/// max logs
	var/max_logs = 40

/**
 * logs purchases
 *
 * @params
 * * identification - name / job / whatever
 * * points - total points used
 * * point_type - GBP_TYPE_* enum
 * * what - list of gbp_catalog_item datums associated to amount.
 */
/datum/gbp_network/proc/log_purchase(identification, points, point_type, list/what)
	var/list/assembled = list()
	for(var/datum/gbp_catalog_item/item as anything in what)
		assembled += "[what[item]] [item.name](s)"
	logs.Insert(1, "-[points] ([point_type]): [identification] purchased [english_list(assembled)].")
	trim_logs()

/**
 * logs generic
 */
/datum/gbp_network/proc/log_generic(identification, what)
	logs.Insert(1, "--- [identification] [what]. ---")
	trim_logs()

/**
 * logs transfer
 */
/datum/gbp_network/proc/log_transfer(identification, amount, point_type)
	logs.Insert(1, "[amount] ([point_type]): Transfer by [identification] ([amount > 0? "deposit" : "withdrawal"])")
	trim_logs()

/datum/gbp_network/proc/trim_logs()
	if(length(logs) > max_logs)
		logs.len = max_logs
