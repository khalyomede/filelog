module filelog

pub fn (file_log FileLog) debug(message string) ? {
	file_log.log(message, LogSeverity.debug) ?
}
