module file_log

import os
import time

pub fn (parameters FileLog) log(message string, severity LogSeverity) ? {
	file_name := match parameters.mode {
		.single {
			parameters.file_name + ".log"
		}

		.daily {
			parameters.file_name + "-" + time.now().ymmdd() + ".log"
		}
	}

	file_path := os.join_path(parameters.folder, file_name)
	now := time.now().format_ss_micro()
	log_message := '[$now] [' + file_log.severity_to_str(severity) + '] $message' + "\n"

	if os.exists(file_path) && os.is_file(file_path) {
		mut file := os.open_append(file_path) ?

		bytes := file.write_string(log_message) ?

		file.close()

		if bytes == 0 {
			return error("file_log: could not write log in file")
		}
	} else {
		os.write_file(file_path, log_message) ?
	}
}
