module test

import filelog { FileLog, LogSeverity, LogSaveMode }
import os
import time

fn remove_app_log() {
	file_path := "src/test/misc/logs/app-" + time.now().ymmdd() + ".log"

	if os.exists(file_path) {
		os.rm(file_path) or {
			panic(err)
		}
	}
}

fn after_each() {
	remove_app_log()
}

fn test_debug_save_correct_log_in_daily_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.debug("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	assert actual.contains("[DBUG]")
	assert actual.contains("foo")

	after_each()
}

fn test_info_save_correct_log_in_daily_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.info("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	assert actual.contains("[INFO]")
	assert actual.contains("foo")

	after_each()
}

fn test_notice_save_correct_log_in_daily_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.notice("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	assert actual.contains("[NTCE]")
	assert actual.contains("foo")

	after_each()
}

fn test_warning_save_correct_log_in_daily_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.warning("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	assert actual.contains("[WARN]")
	assert actual.contains("foo")

	after_each()
}

fn test_error_save_correct_log_in_daily_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.error("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	assert actual.contains("[ERRO]")
	assert actual.contains("foo")

	after_each()
}

fn test_critical_save_correct_log_in_daily_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.critical("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	assert actual.contains("[CRIT]")
	assert actual.contains("foo")

	after_each()
}

fn test_alert_save_correct_log_in_daily_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.alert("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	assert actual.contains("[ALRT]")
	assert actual.contains("foo")

	after_each()
}

fn test_emergency_save_correct_log_in_daily_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.emergency("foo") or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	assert actual.contains("[EMRG]")
	assert actual.contains("foo")

	after_each()
}

fn test_log_save_correct_log_in_daily_mode() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.log("foo", LogSeverity.error) or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	assert actual.contains("[ERRO]")
	assert actual.contains("foo")

	after_each()
}

fn test_log_save_multiple_logs() {
	log := FileLog{
		folder: "src/test/misc/logs",
		file_name: "app",
		save_mode: LogSaveMode.daily,
	}

	log.log("foo", LogSeverity.error) or {
		panic(err)
	}

	log.log("bar", LogSeverity.debug) or {
		panic(err)
	}

	actual := os.read_file("src/test/misc/logs/app-" + time.now().ymmdd() + ".log") or {
		panic(err)
	}

	now := time.now().ymmdd()

	assert actual.contains('[ERRO] foo\n[$now')
	assert actual.contains("[DBUG] bar")

	after_each()
}
