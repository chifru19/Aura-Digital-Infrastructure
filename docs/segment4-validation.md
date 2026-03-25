# Segment 4: Threat Modeling & Resilience Validation

## 🏗️ Resilience & High Availability
* **HSRP (Hot Standby Router Protocol):** Provides a virtual gateway. If Core Switch A fails, Core Switch B takes over in milliseconds.
* **RSTP Validation:** Blocked redundant links are visible in the topology; failure tests prove convergence in under 5 seconds.

---

## 🛡️ STRIDE Threat Model Validation
| Threat | Mitigation | Validation |
| :--- | :--- | :--- |
| **Spoofing** | Port Security (MAC Binding) | Unauthorized device blocked on Access-SW 3. |
| **Tampering** | Immutable File Attributes | Critical logs cannot be modified by users. |
| **Information Disclosure** | VLAN Isolation & ACLs | VLAN 30 cannot ping the Server VLAN. |
| **Denial of Service** | RSTP & QoS | Loop prevention and bandwidth prioritization. |

---

## 🏁 Conclusion
The Aura Digital infrastructure is now a hardened, compliant, and resilient environment ready for enterprise-scale operations.