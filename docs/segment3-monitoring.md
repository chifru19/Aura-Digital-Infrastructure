# 🌐 Segment 2: Network Core, VLANs & Redundancy

## 1. Architectural Design
The core of the network utilizes a **Hierarchical Model** to ensure that Layer 3 routing and redundancy are centralized at the Core Layer, while the Access Layer remains dedicated to high-speed end-device connectivity.

### **VLAN Definition & Purpose**
| VLAN ID | Name | Subnet | Purpose |
| :--- | :--- | :--- | :--- |
| 10 | IT_Admin | 192.168.10.0/24 | Privileged administrative access. |
| 20 | Sales | 192.168.20.0/24 | General staff operations. |
| 30 | Guest | 192.168.30.0/24 | Restricted internet-only access. |
| 50 | Servers | 192.168.50.0/24 | Critical internal resources. |
| 99 | Management | 192.168.99.0/24 | Device management (SSH/SNMP). |

---

## 2. Redundancy Implementation (HSRP)
To prevent a single point of failure, **Hot Standby Router Protocol (HSRP)** was deployed across the Core Switches.

### **Active/Standby Configuration Logic**
* **Active Node (CORE-SW A):** Configured with a priority of **150**.
* **Standby Node (CORE-SW B):** Configured with a default priority of **100**.
* **Virtual IP (VIP):** All end devices point to `.1` as their default gateway.

```bash
interface Vlan10
 ip address 192.168.10.2 255.255.255.0
 standby 10 ip 192.168.10.1
 standby 10 priority 150
 standby 10 preempt