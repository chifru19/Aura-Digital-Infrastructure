# 🛡️ Segment 4: Threat Modeling & Validation

## 1. Security Framework (STRIDE)
This project utilized the **STRIDE** threat model to identify and mitigate risks across the infrastructure.

| Threat Type | Security Property | Mitigation Applied | Status |
| :--- | :--- | :--- | :--- |
| **Spoofing** | Authentication | Extended ACL 199 (Deny Guest to Mgmt) | ✅ Verified |
| **Tampering** | Integrity | Port Security (Sticky MACs & Shutdown) | ✅ Verified |
| **Repudiation** | Non-Repudiation | NTP Sync & Logging Timestamps | ✅ Verified |
| **Information Disclosure** | Confidentiality | Encryption & SSH v2 | ✅ Verified |
| **Denial of Service** | Availability | BPDU Guard for STP protection | ✅ Verified |

---

## 2. Functional Validation Tests

### **Test A: Inter-Subnet Firewall (ACL 199)**
* **Objective:** Ensure Guest (VLAN 30) cannot reach Management (VLAN 99).
* **Action:** Attempted `ping 192.168.99.2` from Guest PC.
* **Result:** **100% Packet Loss.**
* **Proof:** `show access-lists 199` showed incrementing match counters.

### **Test B: Gateway Redundancy (HSRP)**
* **Objective:** Verify CORE-SW B takeover.
* **Action:** Manually shut down VLAN interfaces on CORE-SW A.
* **Result:** **Pass.** CORE-SW B changed from `Standby` to `Active` in < 3 seconds.

---

## 3. Maintenance Runbook (SOP)
To ensure long-term stability, a standard operating procedure for **Port Security** violations was established:
1. Identify the violation via `show interface status err-disabled`.
2. Remove the unauthorized hardware.
3. Perform a `shutdown` / `no shutdown` sequence to restore service.

**Final Project Sign-off:** All security controls validated. Infrastructure is **Stable and Secure**.- Fixed HSRP neighbor visibility by configuring Gig0/1-2 as trunks on both Core switches.
