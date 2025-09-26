# Client Setup
Software Setup Tool for RCOE with NEXUS

## For Chocolatey
```
// Remove Default
choco source remove -n chocolatey

// Add Local Repo
choco source add -n nexus-choco -s http://nexus.rcoe.co.in/repository/choco/

// Test It
choco install git -y
```
