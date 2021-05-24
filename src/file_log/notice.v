module file_log

pub fn (file_log FileLog) notice(message string) ? {
	file_log.log(message, LogSeverity.notice) ?
}
