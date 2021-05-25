module filelog

pub fn (file_log FileLog) info(message string) ? {
	file_log.log(message, LogSeverity.info) ?
}
