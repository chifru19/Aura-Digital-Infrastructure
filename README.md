# 🏆 Final Project Report: Secure & Resilient LAN Architecture

## 1. Project Overview
This project involved the design and deployment of a **Hierarchical Layer 2/3 Network** optimized for high availability and "Zero Trust" security. The architecture focuses on redundant gateways, micro-segmentation, and edge-layer hardening.

---

## 2. Core Infrastructure & High Availability
The network utilizes a dual-core multilayer switch design to eliminate single points of failure. **HSRP (Hot Standby Router Protocol)** was implemented to provide seamless gateway redundancy.

### **HSRP Gateway Strategy**
| VLAN | Network Name | Virtual IP (Gateway) | Primary (Active) | Secondary (Standby) |
| :--- | :--- | :--- | :--- | :--- |
| 10 | IT / Admin | 192.168.10.1 | CORE-SW A (.2) | CORE-SW B (.3) |
| 20 | Sales | 192.168.20.1 | CORE-SW A (.2) | CORE-SW B (.3) |
| 30 | Guest | 192.168.30.1 | CORE-SW A (.2) | CORE-SW B (.3) |
| 50 | Servers | 192.168.50.1 | CORE-SW A (.2) | CORE-SW B (.3) |
| 99 | Management | 192.168.99.1 | CORE-SW A (.2) | CORE-SW B (.3) |

---

## 3. Security Enforcement (STRIDE Framework)
To protect sensitive data and management interfaces, a **Defense-in-Depth** strategy was applied following the STRIDE threat model.

### **A. Network Micro-Segmentation**
**Extended ACL 199** acts as an Inter-Subnet Firewall (ISFW) at the Core Layer.
* **Policy:** Explicitly denies traffic from the **Guest (VLAN 30)** and **IT (VLAN 10)** subnets to the **Management (VLAN 99)** subnet.
* **Verification:** Confirmed via 100% packet loss on cross-VLAN ping tests and `show access-lists 199` match counters.

### **B. Layer 2 Edge Hardening**
All access-layer ports on **ACCESS-SW 3** are hardened to prevent physical tampering:
* **Port Security:** Restricted to a maximum of 2 MAC addresses (Sticky) with a `shutdown` violation mode.
* **BPDU Guard:** Enabled on PortFast ports to automatically disable interfaces if a rogue switch is detected.

### **C. Non-Repudiation & Management**
* **NTP Synchronization:** CORE-SW A serves as the **NTP Master (Stratum 8)** to ensure all system logs have accurate timestamps.
* **SSH v2:** All remote management is restricted to encrypted SSH sessions with **Privilege Level 15** security.

---

## 4. Engineering & Troubleshooting Log
The following issues were identified and resolved during the implementation phase:
* **SVI Configuration:** Corrected a `/32` subnet mask error on Core SVIs to a standard `/24` to enable routing.
* **VLAN Alignment:** Re-mapped physical ports on CORE-SW 1 where a PC was incorrectly assigned to the Management VLAN (99) instead of Sales (20).
* **ACL Application:** Identified that the firewall policy was defined but inactive; successfully applied `ip access-group 199 in` to the relevant SVIs.

---

## 5. Maintenance Runbook: Port Security
In the event of a security violation (`err-disabled` state), the following SOP is followed:
1.  **Identify:** Run `show interface status err-disabled`.
2.  **Remediate:** Remove unauthorized hardware.
3.  **Reset:** ```bash
    interface [interface_id]
    shutdown
    no shutdown
    ```

---
**Status:** 🟢 VERIFIED & COMPLETE