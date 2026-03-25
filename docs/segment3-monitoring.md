# Segment 3: Security, Monitoring & Quality of Service

## 🛡️ Access Control Lists (ACLs)
Implemented **Extended ACLs** on the Core Switch to enforce a "Zero Trust" exception model.

* **ACL 150/151:** Restricts VLAN 10/30 traffic. 
    * **Deny:** ICMP (Ping) and Telnet to the Server VLAN to prevent lateral movement.
    * **Permit:** HTTPS (Port 443) only for authorized business services.

---

## 📊 Quality of Service (QoS)
* **VLAN 20 (Sales):** Prioritized for VoIP/Business traffic to ensure performance during high network congestion.

## 📝 Proof of Monitoring
* **SNMP Traps:** Forwarding critical events (Port Security violations, HSRP changes).
* **NTP Synchronization:** All devices synced to a central time source for forensic log integrity (GDPR compliance).