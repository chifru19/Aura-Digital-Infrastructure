🔑 Segment 1: Identity & Access Management (IAM)
1. Governance Policy
This project adheres to the Principle of Least Privilege (PoLP), ensuring that users and administrators have only the minimum level of access required to perform their functions.

2. Authentication & Authorization Implementation
Administrative access to all infrastructure devices is secured via local database authentication with tiered privilege levels.

Credential Security
Encryption: All passwords are MD5-hashed using the enable secret and username secret commands to prevent clear-text disclosure in configuration files.

Privilege Levels:

Admin: Privilege Level 15 (Full access).

Operator: Restricted read-only access (where applicable).

Management Access (SSH v2)
Telnet is strictly disabled across the fabric. Remote management is enforced via SSH v2 to ensure all administrative traffic is encrypted in transit.

Bash
! Device Management Configuration
username admin privilege 15 secret [ENCRYPTED_HASH]
line vty 0 4
 transport input ssh
 login local
3. Account Lifecycle Management
Automated Timeouts: exec-timeout 5 0 is applied to all VTY lines to prevent stale sessions.

Access Control: Administrative access is restricted to the Management VLAN (99) via localized Access Control Lists.

