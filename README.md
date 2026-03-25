# 🛡️ Aura Digital: Secure & Resilient LAN Architecture
**Enterprise-Grade Infrastructure for High-Availability and Data Sovereignty**

---

## 🚀 Project Vision
Aura Digital required a modernized file server and network infrastructure capable of supporting rapid collaboration while maintaining strict **GDPR compliance** and **Zero Trust** security. This project demonstrates a full-stack implementation—from Linux-level identity management to Layer 3 network redundancy.

### 🏛️ Technical Highlights
* **Resilience:** HSRP (Gateway Redundancy) & RSTP (Loop Prevention).
* **Security:** Granular ACLs, Port Security, and PoLP (Principle of Least Privilege).
* **Compliance:** NTP-synchronized forensic logging and automated account lifecycles.
* **Orchestration:** Multi-VLAN segmentation with Inter-VLAN routing.

---

## 📂 Project Segments
Click the links below to view the detailed implementation for each phase:

1. [**Segment 1: Identity & Access Management (IAM)**](./docs/segment1-iam.md) - PoLP, user grouping, and account lifecycles.
2. [**Segment 2: Network Core & VLANs**](./docs/segment2-networking.md) - DHCP, Router-on-a-Stick, and Spanning Tree.
3. [**Segment 3: Security & Monitoring**](./docs/segment3-monitoring.md) - ACLs, QoS, and Syslog verification.
4. [**Segment 4: Threat Modeling & Validation**](./docs/segment4-validation.md) - STRIDE analysis and HSRP/RSTP resilience testing.

---

## 🛠️ Technical Toolkit
* **Networking:** Cisco Packet Tracer, HSRP, RSTP, VLANs, ACLs.
* **Systems:** Linux (Ubuntu/Debian), Bash, OpenSSH, `chage`.
* **Security:** STRIDE Threat Modeling, NTP Forensics, SNMP Traps.
![System Architecture Diagram](../images/architecture-diagram.png)