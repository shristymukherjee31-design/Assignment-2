# Assignment-2
Linux User Management Utility using Bash Shell Script

## Assignment Overview

The UserManager Utility is a Bash shell script developed to automate basic Linux user and group management tasks. It provides commands to create and manage teams, add users, modify user settings, delete users and groups, and display available users or teams.

The script uses standard Linux administration commands such as `groupadd`, `useradd`, `usermod`, `passwd`, `userdel`, and `groupdel`.

---

# Objectives

- Create Linux teams (groups)
- Add users under a specific team
- Create a home directory for each user
- Create `team` and `ninja` directories inside every user's home directory
- Assign appropriate ownership and permissions
- Change user shell
- Change user password
- Delete users
- Delete teams
- Display available users and teams

---

# Technologies Used

- Ubuntu Linux
- Bash Shell Scripting
- Linux User Management Commands

---

# Script File

```
UserManager.sh
```

---

# Features

- Create a new team
- Create a new user
- Automatically create user home directory
- Create `team` and `ninja` folders
- Set ownership using `chown`
- Set permissions using `chmod`
- Change login shell
- Change user password
- Delete existing users
- Delete existing teams
- Display all users
- Display all groups

---

# Project Structure

```
Assignment2/
│
├── UserManager.sh
├── README.md
└── screenshots/
    ├── 01-project.png
    ├── 02-add-team.png
    ├── 03-add-user.png
    ├── 04-user-details.png
    ├── 05-directory-structure.png
    ├── 06-permissions.png
    ├── 07-list-command.png
    └── 08-delete-command.png
```

---

# Commands Supported

## Create Team

```
sudo ./UserManager.sh addTeam amigo
```

```
sudo ./UserManager.sh addTeam unixkings
```

Screenshot:

```
screenshots/02-add-team.png
```

---

## Add User

```
sudo ./UserManager.sh addUser Rakesh amigo
```

```
sudo ./UserManager.sh addUser Sandeep unixkings
```

Screenshot:

```
screenshots/03-add-user.png
```

---

## Change User Shell

```
sudo ./UserManager.sh changeShell Rakesh /bin/bash
```

---

## Change User Password

```
sudo ./UserManager.sh changePasswd Rakesh
```

---

## Delete User

```
sudo ./UserManager.sh delUser Rakesh
```

---

## Delete Team

```
sudo ./UserManager.sh delTeam amigo
```

---

## List Users

```
sudo ./UserManager.sh ls User
```

---

## List Teams

```
sudo ./UserManager.sh ls Team
```

---

# Directory Structure

After creating users, the home directory structure is:

```
/home
├── Rakesh
│   ├── team
│   └── ninja
│
└── Sandeep
    ├── team
    └── ninja
```

Screenshot:

```
screenshots/05-directory-structure.png
```

---

# Permissions

The script applies the following permissions:

| Directory | Permission | Description |
|-----------|------------|-------------|
| Home Directory | 751 | Owner has full access, group has read and execute, others have execute permission |
| team | 770 | Owner and team members have full access |
| ninja | 770 | Owner and group have full access |

Screenshot:

```
screenshots/06-permissions.png
```

---

# Verification Commands

Check user information:

```
id Rakesh
```

Check user groups:

```
groups Rakesh
```

Check home directory:

```
ls -ld /home/Rakesh
```

Check folder permissions:

```
ls -ld /home/Rakesh/team
```

```
ls -ld /home/Rakesh/ninja
```

Screenshot:

```
screenshots/04-user-details.png
```

---

# Sample Workflow

Create Team

```
sudo ./UserManager.sh addTeam amigo
```

Add User

```
sudo ./UserManager.sh addUser Rakesh amigo
```

Change Password

```
sudo ./UserManager.sh changePasswd Rakesh
```

Change Shell

```
sudo ./UserManager.sh changeShell Rakesh /bin/bash
```

List Users

```
sudo ./UserManager.sh ls User
```

Delete User

```
sudo ./UserManager.sh delUser Rakesh
```

Delete Team

```
sudo ./UserManager.sh delTeam amigo
```

---

# Learning Outcomes

Through this assignment, the following Linux administration concepts were practiced:

- Bash Shell Scripting
- User Management
- Group Management
- Linux File Permissions
- Directory Ownership
- Command Line Arguments
- Case Statement
- Basic Linux Administration

---

# Conclusion

The UserManager Utility simplifies common Linux user and group administration tasks using a single shell script. It demonstrates the practical use of Bash scripting and Linux administration commands while providing an easy-to-use command-line interface for managing users, teams, directories, and permissions.

---



