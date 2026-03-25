📊 Segment 3: Security & Monitoring
1. Monitoring Strategy
The monitoring framework ensures real-time visibility into infrastructure health and security events, focusing on SNMP for performance metrics and NTP for log synchronization.

2. Network Time Protocol (NTP)
Synchronized time is critical for non-repudiation and accurate forensic analysis of system logs.

NTP Master: CORE-SW A is configured as the authoritative time source (Stratum 8).

NTP Clients: All access layer switches and redundant core nodes synchronize to the Master via the Management VLAN (99).

Service Timestamps: Enabled globally to ensure logs record high-precision dates and times.

3. SNMP Configuration
Simple Network Management Protocol (SNMP) is used for read-only polling of device status and performance.

Community String: public_monitor (Read-Only).

Access Control: Restricted via ACL 99, allowing only the Network Management Station (NMS) at 192.168.99.10 to poll devices.

4. Syslog & Error Reporting
The infrastructure is configured to report critical state changes, specifically focusing on security violations.

Logging Level: Configured to capture Informational and above.

Interface Tracking: Monitors for up/down events on critical trunk links.

Final GitHub Health Check
Based on your last terminal screenshot, your docs/segment1-iam.md has been modified but not yet committed.