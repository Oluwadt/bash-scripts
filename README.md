Bash Automation Scripts
==========================

A collection of **production-grade Bash scripts** for common DevOps and system administration tasks.\
Each script is designed for **idempotent execution**, **modular configuration**, and **cron-based automation**.

* * * * *

Repository Overview
----------------------

| Script | Purpose |
| --- | --- |
| **backup_script.sh** | Automates creation and rotation of compressed backups with retention policy. |
| **monitor_service.sh** | Monitors multiple web endpoints for uptime and triggers email alerts on failure. |
| **system_health_check.sh** | Generates comprehensive system health reports and logs performance metrics. |
| **analyze_logs.sh** | Scans and analyzes application/system logs for critical errors and generates summary reports. |
| **env_setup.sh** | Automates environment setup, installs dependencies, and initializes a Python project. |

* * * * *

Prerequisites
----------------

Ensure the following utilities are installed on your system:

`tar  curl  mailutils  awk  df  free  uptime  ip  bc  grep  find  python3  git`

Install missing dependencies on Ubuntu/Debian:

`sudo apt update && sudo apt install -y curl mailutils bc git python3 python3-pip`

* * * * *

`backup_script.sh`
----------------------

**Purpose:**\
Automates directory backups into compressed `.tar.gz` archives, rotates them based on age, and logs all actions for auditability.

**Key Features:**

-   Configurable source directories (`SOURCE_DIRS`)

-   Timestamped backups in `$BACKUP_DIR`

-   Automatic cleanup of archives older than `$RETENTION_DAYS`

-   Centralized log file `backup.log` for traceability

**Usage Example:**

`chmod +x backup_script.sh
./backup_script.sh`

* * * * *

`monitor_service.sh`
-----------------------

**Purpose:**\
Performs continuous HTTP uptime monitoring for multiple services and triggers email alerts when a service becomes unreachable.

**Key Features:**

-   Bulk endpoint monitoring via `services.txt`

-   Response validation using `curl` with timeout

-   Email alerts sent through `mailutils`

-   Timestamped logs stored in `service_check.log`

-   Adjustable polling frequency (`CHECK_INTERVAL`)

**Configuration:**

`EMAIL="admin@company.com"
CHECK_INTERVAL=60    # seconds`

**Example `services.txt`:**

`https://www.google.com
https://www.github.com`

**Usage Example:**

`chmod +x monitor_service.sh
./monitor_service.sh`


* * * * *

`system_health_check.sh`
----------------------------

**Purpose:**\
Performs a complete system health audit and logs performance metrics into `/var/log/system_health.log`.

**Metrics Collected:**

-   CPU load averages

-   Memory usage summary

-   Disk space utilization

-   Active network interfaces and assigned IPs

-   Alerts when:

    -   CPU load > **1.5**

    -   Disk usage > **90%**

**Usage Example:**

`sudo chmod +x system_health_check.sh
sudo ./system_health_check.sh`

`analyze_logs.sh`
--------------------

**Purpose:**\
Parses and analyzes application/system log files to identify frequent or critical error patterns and produces a detailed report.

### Key Features

-   Automatically detects `.log` files modified in the last 24 hours

-   Searches for predefined error patterns: `ERROR`, `FATAL`, and `CRITICAL`

-   Counts occurrences and flags files with excessive error rates

-   Generates an analysis summary in `log_analysis_report.txt`

### Usage Example

`chmod +x analyze_logs.sh
./analyze_logs.sh`

### Output

A sample excerpt from `log_analysis_report.txt`:

`List of log files updated in last 24 hours:
./logs/application.log

==============================================================
./logs/application.log
==============================================================

Searching for ERROR logs in "application.log"
Number of ERROR logs in "application.log" file: 12
⚠ Action required: Too many ERROR issues in log file`

**Best used for:** Automated log auditing in CI/CD pipelines or production environments.

* * * * *

`env_setup.sh`
-----------------

**Purpose:**\
Automates environment provisioning for Python projects --- from dependency installation to virtual environment setup.

### Key Features

-   Updates system packages and installs dependencies

-   Sets up project directory (`~/projects/my_project`)

-   Initializes a Git repository

-   Creates and activates a Python virtual environment

-   Installs packages from `requirements.txt`

### Usage Example

`chmod +x env_setup.sh
./env_setup.sh`

### What Happens Step-by-Step

1.  Updates the system's package index (`apt update`)

2.  Installs `git`, `python3`, and `python3-pip`

3.  Creates a project directory under `~/projects/my_project`

4.  Initializes a new Git repository

5.  Creates and activates a Python virtual environment (`venv`)

6.  Installs Python dependencies listed in `requirements.txt`

**Use Case:** Rapidly provisioning a clean Python development environment for new projects.

* * * * *

🧾 Log Management
-----------------

| Script | Log File |
| --- | --- |
| **backup_script.sh** | `~/backups/backup.log` |
| **monitor_service.sh** | `service_check.log` |
| **system_health_check.sh** | `/var/log/system_health.log` |
| **analyze_logs.sh** | `./logs/log_analysis_report.txt` |

* * * * *

🚀 DevOps Use Cases
-------------------

This repository demonstrates:

-   System automation & observability

-   Alerting & incident response via email

-   Backup lifecycle and retention policies

-   Log analysis and reporting automation

-   Environment setup automation for reproducibility

-   Error handling and exit code management

-   Cron-based orchestration

These scripts can serve as building blocks for:

-   CI/CD pipeline maintenance

-   System reliability testing

-   Custom monitoring agents

-   Developer environment bootstrapping

-   Disaster recovery automation