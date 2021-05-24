# file_log

Functions to write logs in file disk for V.

## Summary

- [About](#about)
- [Features](#features)
- [Installation](#installation)
- [Examples](#examples)
- [Test](#test)

## About

I created this library to log behavior oriented data when my user browse my web app for debug purposes.

## Features

- Can log in a single file, or file per days (daily)
- Prefix logs with the date and time (with microseconds) and the log severity (see [Wikipedia Severity levels](https://en.wikipedia.org/wiki/Syslog#Severity_level))

## Installation

```v
v install khalyomede.file_log
```

## Examples

- [1. Log in a single file](#1-log-in-a-single-file)
- [2. Log in a daily file](#2-log-in-a-daily-file)
- [3. Log using a specific severity](#3-log-using-a-specific-severity)

### 1. Log in a single file

In this example, we will log a debug message.

```v
import khalyomede.file_log.src.file_log { FileLog, LogSaveMode }

fn main() {
  log := FileLog{
    folder: "logs",
    file_name: "app",
    save_mode: LogSaveMode.single,
  }

  log.debug("user accessed product #12")
}
```

If you open the file "logs/app.log", this is what you will see:

```log
[2021-05-24 22:12:00.635101] [DBUG] user accessed product 12
```

### 2. Log in a daily file

In this example, we will log in a file that will be "rotate" per day.

```v
import khalyomede.file_log.src.file_log { FileLog, LogSaveMode }

fn main() {
  log := FileLog{
    folder: "logs",
    file_name: "app",
    save_mode: LogSaveMode.daily,
  }

  log.debug("user 12 disconnected")
}
```

If you open the file `logs/app-2021-05-24.log`, this is what you will see:

```log
[2021-05-24 22:12:00.635101] [DBUG] user 12 disconnected
```

The log will automatically append logs in a file prefixed by the date of the writting.

### 3. Log using a specific severity

In this example, we will log a message using a given severity.

```v
import khalyomede.file_log.src.file_log { FileLog, LogSaveMode, LogSeverity }

fn main() {
  log := FileLog{
    folder: "logs",
    file_name: "app",
    save_mode: LogSaveMode.single,
  }

  log.log("session started", LogSeverity.notice)
}
```

If you open the file `logs/app.log`, this is what you will see:

```log
[2021-05-24 22:12:00.635101] [NTCE] session started
```

Here is all the available severities:

```v
LogSeverity.debug
LogSeverity.info
LogSeverity.notice
LogSeverity.warning
LogSeverity.error
LogSeverity.critical
LogSeverity.alert
LogSeverity.emergency
```

If you don't want to pass them manually, use the shorthand functions instead:

```v
import khalyomede.file_log.src.file_log { FileLog, LogSaveMode }

fn main() {
  log := FileLog{
    folder: "logs",
    file_name: "app",
    save_mode: LogSaveMode.single,
  }

  log.debug("some message")
  log.info("some message")
  log.notice("some message")
  log.warning("some message")
  log.error("some message")
  log.critical("some message")
  log.alert("some message")
  log.emergency("some message")
}
```

## Test

```v
v test src/test
```
