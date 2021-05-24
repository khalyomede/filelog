module filelog

pub fn (file_log FileLog) emergency(message string) ? {
	file_log.log(message, LogSeverity.emergency) ?
}
