module filelog

pub fn (file_log FileLog) critical(message string) ? {
	file_log.log(message, LogSeverity.critical) ?
}
