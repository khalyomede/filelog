module file_log

pub fn (file_log FileLog) alert(message string) ? {
	file_log.log(message, LogSeverity.alert) ?
}
