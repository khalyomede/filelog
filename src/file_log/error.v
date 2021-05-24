module file_log

pub fn (file_log FileLog) error(message string) ? {
	file_log.log(message, LogSeverity.error) ?
}
