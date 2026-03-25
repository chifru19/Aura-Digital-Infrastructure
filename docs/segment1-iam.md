# Segment 1: User Management & Principle of Least Privilege (PoLP)

## 🎯 Objective
To establish a secure baseline for Aura Digital’s file infrastructure by implementing strict access controls and automated lifecycle management for all users.

---

## 🔒 Security Pillars

### 1. Principle of Least Privilege (PoLP)
* **Role-Based Grouping:** Users are segregated into role-specific groups (`employees`, `interns`).
* **Granular Access:** Permissions are assigned only at the group level to ensure users have the minimum access necessary for their tasks.
* **Segregation:** Clear distinction between permanent full-privilege access and temporary read-only privileges.

### 2. Lifecycle Management & Account Control
* **Automated Expiration:** Utilizing the `chage` utility to set hard expiration dates for temporary staff (e.g., Interns/Contractors).
* **Password Policy:** Enforced 90-day maximum password age to mitigate the risk of long-term credential compromise.

---

## 🛠️ Implementation Evidence

### Account Expiration (chage)
To verify an account's security status, we use:
`chage -l [username]`

**Example Output Verification:**
* **Account expires:** Nov 25, 2025
* **Minimum Password Age:** 0
* **Maximum Password Age:** 90
## 📁 Automated Data Redundancy (Pillar 3)
To ensure data integrity and disaster recovery, a custom Bash script (`/scripts/backup_aura.sh`) was developed.

**Key Features:**
* **Automated Compression:** Uses `tar` to archive sensitive financial records.
* **Retention Policy:** Automatically purges backups older than 30 days using the `find` command, ensuring the server stays compliant with storage limits.
* **Scheduling:** Designed to run as a **Cron Job** for zero-touch operation.
### Group Structure
| User | Primary Group | Access Level |
| :--- | :--- | :--- |
| john_d | employees | Permanent / Full Access |
| int_mary | interns | Temporary / Read-Only |