module file_log

pub fn (file_log FileLog) warning(message string) ? {
	file_log.log(message, LogSeverity.warning) ?
}
