module file_log

pub struct FileLog {
	pub:
		folder string [required]
		file_name string [required]
		save_mode LogSaveMode [required]
}
