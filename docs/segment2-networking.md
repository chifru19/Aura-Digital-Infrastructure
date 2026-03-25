# Segment 2: Network Configuration & VLAN Segmentation

## 🌐 Network Topology
The network utilizes a **Router-on-a-Stick** configuration with a Multilayer Switch at the core to handle Inter-VLAN routing and redundant gateway services.

### VLAN Definitions
| VLAN ID | Name | Subnet | Function |
| :--- | :--- | :--- | :--- |
| 10 | Staff | 192.168.10.0/24 | Standard employee workstations. |
| 30 | Interns | 192.168.30.0/24 | Restricted guest/intern access. |
| 50 | Servers | 192.168.50.0/24 | Mission-critical file and web servers. |
| 99 | Native | 192.168.99.0/24 | Management and native traffic. |

---

## ⚙️ Configuration Highlights
* **DHCP Pools:** Automated IP assignment per VLAN.
* **Spanning Tree (RSTP):** Configured to prevent Layer 2 loops and ensure fast convergence.
* **Firewall Rules:** Initial ingress/egress filtering at the gateway level.