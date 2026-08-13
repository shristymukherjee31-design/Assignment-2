# UserManager Utility

## Assignment Overview

The **UserManager Utility** is a Bash shell script designed to automate common Linux user and group management tasks. It simplifies administrative operations such as creating teams, adding users, assigning permissions, modifying user accounts, and removing users or groups through a single command-line utility.

---

# Objectives

- Create Linux teams (groups)
- Add users under a specific team
- Automatically create user home directories
- Create `team` and `ninja` directories
- Assign ownership and permissions
- Change user shell
- Change user password
- Delete users
- Delete teams
- List all users and teams

---

# Technologies Used

- Ubuntu Linux
- Bash Shell Scripting
- Linux User Management Commands

---

# Project Structure

```text
Assignment2/
│
├── UserManager.sh
├── README.md
└── screenshots/
    ├── 01-project-folder.png
    ├── 02-add-team.png
    ├── 03-add-user.png
    ├── 04-user-details.png
    ├── 05-directory-structure.png
    ├── 06-permissions.png
    ├── 07-list-command.png
    └── 08-delete-command.png
```

---

# Script Usage

## 1. Create Team

**Command**

```bash
sudo ./UserManager.sh addTeam amigo
sudo ./UserManager.sh addTeam unixkings
```

**Output**

<img src="screenshots/02-add-team.png" width="900">

---

## 2. Add User

**Command**

```bash
sudo ./UserManager.sh addUser Rakesh amigo
sudo ./UserManager.sh addUser Sandeep unixkings
```

**Output**

<img src="screenshots/03-add-user.png" width="900">

---

## 3. Verify User Information

**Commands**

```bash
id Rakesh
groups Rakesh

id Sandeep
groups Sandeep
```

**Output**

<img src="screenshots/04-user-details.png" width="900">

---

## 4. Home Directory Structure

**Commands**

```bash
tree /home/Rakesh
tree /home/Sandeep
```

If `tree` is not installed:

```bash
ls -R /home/Rakesh
ls -R /home/Sandeep
```

**Output**

<img src="screenshots/05-directory-structure.png" width="900">

---

## 5. Directory Permissions

**Commands**

```bash
ls -ld /home/Rakesh

ls -ld /home/Rakesh/team

ls -ld /home/Rakesh/ninja
```

**Output**

<img src="screenshots/06-permissions.png" width="900">

---

## 6. Change User Shell

**Command**

```bash
sudo ./UserManager.sh changeShell Rakesh /bin/bash
```

---

## 7. Change User Password

**Command**

```bash
sudo ./UserManager.sh changePasswd Rakesh
```

---

## 8. List Users and Teams

**Commands**

```bash
sudo ./UserManager.sh ls User

sudo ./UserManager.sh ls Team
```

**Output**

<img src="screenshots/07-list-command.png" width="900">

---

## 9. Delete User and Team

**Commands**

```bash
sudo ./UserManager.sh delUser Rakesh

sudo ./UserManager.sh delTeam amigo
```

**Output**

<img src="screenshots/08-delete-command.png" width="900">

---

# Permissions Used

| Directory | Permission | Description |
|-----------|:----------:|-------------|
| `/home/username` | **751** | Owner has Read, Write and Execute permissions. Group has Read and Execute permissions. Others have Execute permission only. |
| `/home/username/team` | **770** | Owner and Team members have full access. |
| `/home/username/ninja` | **770** | Owner and Group members have full access. |

---

# Sample Workflow

```bash
sudo ./UserManager.sh addTeam amigo

sudo ./UserManager.sh addUser Rakesh amigo

sudo ./UserManager.sh changeShell Rakesh /bin/bash

sudo ./UserManager.sh changePasswd Rakesh

sudo ./UserManager.sh ls User

sudo ./UserManager.sh ls Team

sudo ./UserManager.sh delUser Rakesh

sudo ./UserManager.sh delTeam amigo
```

---

# Learning Outcomes

This assignment provided practical experience with:

- Bash Shell Scripting
- Linux User Management
- Linux Group Management
- File Ownership
- File Permissions
- Command Line Arguments
- Case Statements
- Linux Administration Commands

---

# Conclusion

The UserManager Utility provides a simple command-line solution for performing common Linux user administration tasks. It demonstrates the practical implementation of Bash scripting concepts and Linux user management commands while improving automation and reducing manual administrative effort.

---
