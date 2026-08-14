# UserManager Utility

## Assignment Overview

The **UserManager Utility** is a Bash Shell script developed to automate basic Linux user and group management tasks. It provides a simple command-line interface to create teams, add users, manage user accounts, assign permissions, and perform common administrative operations.

---

# Objectives

- Create Linux teams (groups)
- Add users under a specific team
- Automatically create user home directories
- Create `team` and `ninja` directories
- Assign directory ownership and permissions
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
    ├── 07-additional-features.png
    └── 08-delete-operations.png
```


# Script Usage

## 1. Create Team

Creates a new Linux group.

### Commands

```bash
sudo ./UserManager.sh addTeam amigo
sudo ./UserManager.sh addTeam unixkings
```

### Output

![Create Team]<img width="951" height="308" alt="📸 Screenshot 02-add-team png" src="https://github.com/user-attachments/assets/692cf918-0711-4110-8cf1-8a86d6888f82" />


---

## 2. Add User

Creates a new user under the specified team. The script automatically creates the user's home directory along with `team` and `ninja` folders and assigns the required permissions.

### Commands

```bash
sudo ./UserManager.sh addUser Rakesh amigo
sudo ./UserManager.sh addUser Sandeep unixkings
```

### Output

![Add User]<img width="953" height="240" alt="📸 Screenshot 03-add-user png" src="https://github.com/user-attachments/assets/3b41c172-4b5f-4b7c-bb2f-742bb537bf5c" />


---

## 3. Verify User Details

Verify that the users have been created successfully and assigned to the correct groups.

### Commands

```bash
id Rakesh
groups Rakesh

id Sandeep
groups Sandeep
```

### Output

![User Details]<img width="956" height="298" alt="📸 Screenshot 04-user-details png" src="https://github.com/user-attachments/assets/ddc487e1-c242-49af-95e7-6aef5c26b071" />


---

## 4. Verify Directory Structure

The following directory structure is created automatically for each user.

```text
/home
├── Rakesh
│   ├── team
│   └── ninja
│
└── Sandeep
    ├── team
    └── ninja
```

### Commands

```bash
tree /home
```

If the `tree` command is unavailable:

```bash
ls -R /home
```

### Output

![Directory Structure]<img width="955" height="488" alt="📸 Screenshot 05-directory-structure png" src="https://github.com/user-attachments/assets/0cb4902b-6584-4d70-a454-50bbfd608352" />


---

## 5. Verify Permissions

The script assigns the required permissions to the home directory and shared folders.

### Commands

```bash
ls -ld /home/Rakesh
ls -ld /home/Rakesh/team
ls -ld /home/Rakesh/ninja

ls -ld /home/Sandeep
ls -ld /home/Sandeep/team
ls -ld /home/Sandeep/ninja
```

### Output

![Permissions]<img width="956" height="412" alt="📸 Screenshot 06-permissions png" src="https://github.com/user-attachments/assets/c4d14604-28e5-40de-b559-2e87b43c8279" />


---

## 6. Additional Features

### Change User Shell

```bash
sudo ./UserManager.sh changeShell Rakesh /bin/bash
```

### Change User Password

```bash
sudo ./UserManager.sh changePasswd Rakesh
```

### List Users

```bash
sudo ./UserManager.sh ls User
```

### List Teams

```bash
sudo ./UserManager.sh ls Team
```

### Output

![Additional Features]<img width="956" height="1019" alt="📸 Screenshot 07-additional-features png" src="https://github.com/user-attachments/assets/d07edf25-9ec8-47da-bc2b-d27046eb4ad5" />


---

## 7. Delete User and Team

Deletes an existing user and team.

### Commands

```bash
sudo ./UserManager.sh delUser Rakesh

sudo ./UserManager.sh delTeam amigo
```

### Output

![Delete Operations]<img width="954" height="279" alt="📸 Screenshot 08-delete-operations png" src="https://github.com/user-attachments/assets/076bb324-30b6-48dc-b033-307db0760819" />


---

# Permissions Used

| Directory | Permission | Description |
|-----------|:----------:|-------------|
| `/home/username` | **751** | Owner has Read, Write and Execute permissions. Group has Read and Execute permissions. Others have Execute permission only. |
| `/home/username/team` | **770** | Owner and team members have full access. |
| `/home/username/ninja` | **770** | Owner and group members have full access. |

---

# Commands Summary

| Command | Description |
|---------|-------------|
| `addTeam <team>` | Create a new team |
| `addUser <user> <team>` | Create a new user under a team |
| `changeShell <user> <shell>` | Change the user's login shell |
| `changePasswd <user>` | Change the user's password |
| `delUser <user>` | Delete a user |
| `delTeam <team>` | Delete a team |
| `ls User` | Display all users |
| `ls Team` | Display all teams |

---

# Sample Workflow

```bash
sudo ./UserManager.sh addTeam amigo
sudo ./UserManager.sh addTeam unixkings

sudo ./UserManager.sh addUser Rakesh amigo
sudo ./UserManager.sh addUser Sandeep unixkings

id Rakesh
groups Rakesh

tree /home

ls -ld /home/Rakesh
ls -ld /home/Rakesh/team
ls -ld /home/Rakesh/ninja

sudo ./UserManager.sh changeShell Rakesh /bin/bash
sudo ./UserManager.sh changePasswd Rakesh

sudo ./UserManager.sh ls User
sudo ./UserManager.sh ls Team

sudo ./UserManager.sh delUser Rakesh
sudo ./UserManager.sh delTeam amigo
```

---

# Learning Outcomes

After completing this assignment, the following concepts were understood and implemented:

- Bash Shell Scripting
- Linux User Management
- Linux Group Management
- File Ownership
- Directory Permissions
- Command Line Arguments
- Case Statements
- Linux Administrative Commands

---

# Conclusion

This assignment demonstrates the implementation of a Linux User Management Utility using Bash Shell Scripting. The project automates common administrative tasks such as creating teams, managing users, assigning permissions, changing user settings, and deleting users or groups. It provides practical experience with Linux user administration and shell scripting.

---

# Author

**Shristy Mukherjee**

BCA Student  
CCSU University
