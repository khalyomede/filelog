module filelog

import os
import time

pub fn (file_log FileLog) log(message string, severity LogSeverity) ? {
	file_name := match file_log.save_mode {
		.single {
			file_log.file_name + ".log"
		}

		.daily {
			file_log.file_name + "-" + time.now().ymmdd() + ".log"
		}
	}

	file_path := os.join_path(file_log.folder, file_name)
	now := time.now().format_ss_micro()
	log_message := '[$now] [' + filelog.severity_to_str(severity) + '] $message' + "\n"

	if os.exists(file_path) && os.is_file(file_path) {
		mut file := os.open_append(file_path) ?

		bytes := file.write_string(log_message) ?

		file.close()

		if bytes == 0 {
			return error("filelog: could not write log in file")
		}
	} else {
		os.write_file(file_path, log_message) ?
	}
}
