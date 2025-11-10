Bash Automation Scripts
==========================

A collection of **production-grade Bash scripts** for common DevOps and system administration tasks.\
Each script is designed for **idempotent execution**, **modular configuration**, and **cron-based automation**.

* * * * *

Repository Overview
----------------------

| Script | Purpose |
| --- | --- |
| `backup_script.sh` | Automates creation and rotation of compressed backups with retention policy. |
| `monitor_service.sh` | Monitors multiple web endpoints for uptime and triggers email alerts on failure. |
| `system_health_check.sh` | Generates comprehensive system health reports and logs performance metrics. |

* * * * *

Prerequisites
----------------

Ensure the following utilities are installed on your system:

`tar  curl  mailutils  awk  df  free  uptime  ip  bc`

Install missing dependencies on Ubuntu/Debian:

`sudo apt update && sudo apt install -y curl mailutils bc`

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

Log Management
-----------------

| Script | Log File |
| --- | --- |
| `backup_script.sh` | `~/backups/backup.log` |
| `monitor_service.sh` | `service_check.log` |
| `system_health_check.sh` | `/var/log/system_health.log` |

Each log file is timestamped and can be rotated or shipped using `logrotate` or an ELK/Promtail stack for centralized monitoring.

* * * * *

DevOps Use Cases
-------------------

This repository demonstrates:

-   **System automation & observability**

-   **Alerting & incident response via email**

-   **Backup lifecycle and retention policies**

-   **Error handling and exit code management**

These scripts can serve as building blocks for:

-   CI/CD pipeline maintenance

-   System reliability testing

-   Custom monitoring agents

-   Disaster recovery automation