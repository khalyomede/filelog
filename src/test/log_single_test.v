module test

import file_log { FileLog, LogSaveMode, LogSeverity }
import os
import time

fn remove_app_log() {
	file_path := "src/test/misc/logs/app.log"

	if os.exists(file_path) {
		os.rm(file_path) or {
			panic(err)
		}
	}
}

fn after_each() {
	remove_app_log()
}

fn test_debug_save_correct_log_in_single_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.debug("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	assert actual.contains("[DBUG]")
	assert actual.contains("foo")

	after_each()
}

fn test_info_save_correct_log_in_single_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.info("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	assert actual.contains("[INFO]")
	assert actual.contains("foo")

	after_each()
}

fn test_notice_save_correct_log_in_single_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.notice("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	assert actual.contains("[NTCE]")
	assert actual.contains("foo")

	after_each()
}

fn test_warning_save_correct_log_in_single_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.warning("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	assert actual.contains("[WARN]")
	assert actual.contains("foo")

	after_each()
}

fn test_error_save_correct_log_in_single_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.error("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	assert actual.contains("[ERRO]")
	assert actual.contains("foo")

	after_each()
}

fn test_critical_save_correct_log_in_single_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.critical("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	assert actual.contains("[CRIT]")
	assert actual.contains("foo")

	after_each()
}

fn test_alert_save_correct_log_in_single_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.alert("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	assert actual.contains("[ALRT]")
	assert actual.contains("foo")

	after_each()
}

fn test_emergency_save_correct_log_in_single_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.emergency("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	assert actual.contains("[EMRG]")
	assert actual.contains("foo")

	after_each()
}

fn test_lgo_save_correct_log_in_single_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.log("foo", LogSeverity.error) or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	assert actual.contains("[ERRO]")
	assert actual.contains("foo")

	after_each()
}

fn test_log_stacks_multiple_logs() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.single,
	}

	log.log("foo", LogSeverity.warning) or {
		panic(err)
	}

	log.log("bar", LogSeverity.debug) or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app.log") or {
		panic(err)
	}

	now := time.now().format_ss()

	assert actual.contains('[WARN] foo\n[$now')
	assert actual.contains("[DBUG] bar")

	after_each()
}
