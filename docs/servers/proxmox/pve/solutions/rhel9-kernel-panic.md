# RHEL9/AlmaLinux9/Rocky Linux 9 Kernel Panic

## Problem

When installing Red Hat Enterprise Linux 9, AlmaLinux 9, or Rocky Linux 9, the installer kernel panics.

## Solution

To resolve this problem, set the CPU for the VM as host CPU. This is because Red Hat has deprecated the kvm64/qemu64 CPU model. 

Relevant Red Hat Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2094260 

