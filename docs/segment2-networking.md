# 🌐 Segment 2: Network Core, VLANs & Redundancy

## 1. Architectural Design
The network uses a **Hierarchical Model** to centralize Layer 3 routing at the Core Layer while keeping the Access Layer dedicated to high-speed connectivity.

### **VLAN Definition & Purpose**
| VLAN ID | Name | Subnet | Purpose |
| :--- | :--- | :--- | :--- |
| 10 | IT_Admin | 192.168.10.0/24 | Privileged admin access |
| 20 | Sales | 192.168.20.0/24 | General staff operations |
| 30 | Guest | 192.168.30.0/24 | Restricted internet access |
| 99 | Management | 192.168.99.0/24 | SSH/SNMP management |

---

## 2. Redundancy Implementation (HSRP)
**Hot Standby Router Protocol (HSRP)** ensures zero downtime by providing a virtual gateway (.1) that floats between Core Switches.

* **CORE-SW A:** Priority 150 (Active)
* **CORE-SW B:** Priority 100 (Standby)

---

## 3. Engineering Remediation Log
| Issue | Root Cause | Resolution |
| :--- | :--- | :--- |
| Routing Failure | SVI mask set to /32 | Reconfigured to /24 |
| VLAN Misalignment | Port Fa0/2 in VLAN 99 | Reassigned to VLAN 20 |

---

## 4. Operational Verification
* **Command:** `show standby brief`
* **Success:** CORE-SW A is Active; CORE-SW B is Standby.