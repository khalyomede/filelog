module file_log

pub fn severity_to_str(severity LogSeverity) string {
	return match severity {
		.debug {
			"DBUG"
		}

		.info {
			"INFO"
		}

		.notice {
			"NTCE"
		}

		.warning {
			"WARN"
		}

		.error {
			"ERRO"
		}

		.critical {
			"CRIT"
		}

		.alert {
			"ALRT"
		}

		.emergency {
			"EMRG"
		}
	}
}
