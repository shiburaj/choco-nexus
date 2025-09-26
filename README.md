# Client Setup
Software Setup Tool for RCOE with NEXUS

## For Chocolatey
Run powershell with Administrative Privilidge
```
// Remove Default
choco source remove -n chocolatey

// Add Local Repo
choco source add -n nexus-choco -s http://nexus.rcoe.co.in/repository/choco/

// Test It
choco install git -y
```


Perfect 👍 Let’s make a **recommended Chocolatey packages list**, grouped by **use case**. That way you can copy-paste the bundle that fits best, or merge them all into your own `packages.config` or one-liner.

---

# 📦 Recommended Chocolatey Packages

## 🖥️ **General / Everyday Use**

For a freshly installed PC that needs all the basics:

* `googlechrome` – Chrome browser
* `firefox` – Firefox browser
* `microsoft-edge` – Edge Chromium
* `7zip` – Archive manager
* `notepadplusplus` – Lightweight text editor
* `vlc` – Media player
* `spotify` – Music streaming
* `zoom` – Video meetings
* `microsoft-teams` – Teams client
* `libreoffice-fresh` – Free office suite (if no MS Office)

**One-liner:**

```powershell
choco install -y googlechrome firefox microsoft-edge 7zip notepadplusplus vlc spotify zoom microsoft-teams libreoffice-fresh
```

---

## 👨‍💻 **Developer Workstation**

Core tools for devs across languages:

* `git` – Version control
* `vscode` – Code editor
* `python` – Python runtime
* `nodejs` – Node.js runtime
* `golang` – Go language
* `rust` – Rust programming
* `ruby` – Ruby language
* `openjdk` – Java JDK
* `docker-desktop` – Containers
* `postman` – API testing
* `cmder` – Better terminal
* `visualstudio2022community` – Full IDE (optional, big download)

**One-liner:**

```powershell
choco install -y git vscode python nodejs golang rust ruby openjdk docker-desktop postman cmder visualstudio2022community
```

---

## 🛡️ **SysAdmin / Power User**

For IT management, troubleshooting, and automation:

* `sysinternals` – Microsoft Sysinternals tools
* `putty` – SSH client
* `winscp` – SFTP/FTP client
* `filezilla` – FTP client
* `powershell-core` – Latest PowerShell
* `curl` – Command-line transfer tool
* `wget` – Alternative downloader
* `terraform` – Infrastructure as Code
* `azure-cli` – Azure CLI
* `awscli` – AWS CLI
* `kubectl` – Kubernetes CLI

**One-liner:**

```powershell
choco install -y sysinternals putty winscp filezilla powershell-core curl wget terraform azure-cli awscli kubectl
```

---

## 🎨 **Creative / Multimedia**

For video/audio editing, screen capture, and graphics:

* `audacity` – Audio editor
* `gimp` – Image editor
* `inkscape` – Vector graphics editor
* `blender` – 3D creation
* `ffmpeg` – Video processing
* `obs-studio` – Screen recording & streaming
* `kdenlive` – Video editing

**One-liner:**

```powershell
choco install -y audacity gimp inkscape blender ffmpeg obs-studio kdenlive
```

---

# 🚀 Super-Pack (All-in-One)

If you want a **developer + general use + sysadmin stack** in one command:

```powershell
choco install -y `
  googlechrome firefox microsoft-edge 7zip notepadplusplus vlc spotify zoom microsoft-teams libreoffice-fresh `
  git vscode python nodejs golang rust ruby openjdk docker-desktop postman cmder `
  sysinternals putty winscp filezilla powershell-core curl wget terraform azure-cli awscli kubectl `
  audacity gimp inkscape blender ffmpeg obs-studio kdenlive
```

## ▶️ How to Use **`packages.config`**

1. Save the file above as **`packages.config`** (anywhere, e.g., Desktop or USB).
2. Open **PowerShell as Administrator**.
3. Run:

```powershell
choco install packages.config -y
```

```powershell
choco upgrade all -y
```



