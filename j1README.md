# Jenkins Assignment 1

## Overview

This assignment demonstrates Jenkins automation for **Git branch operations, parameterized builds, artifact management, job chaining, web-server publishing, and build notifications**.

The assignment is divided into two parts:

- **Part 1:** Perform Git branch operations through a Jenkins job.
- **Part 2:** Create a file using a parameterized Jenkins job and publish the generated file through a web server using a second Jenkins job.

---

# Part 1 — Jenkins Job for Git Branch Operations

## Objective

Create a Jenkins job that performs the following Git operations:

1. Create a branch
2. List all branches
3. Merge one branch with another branch
4. Rebase one branch with another branch
5. Delete a branch

If any operation fails, Jenkins should send:

- Slack notification
- Email notification

---

## Git Branch Operations

### 1. Create a Branch

A new Git branch can be created using:

```bash
git checkout -b feature-branch
```

The branch can be pushed to the remote repository using:

```bash
git push origin feature-branch
```

**Screenshot – Create Branch**

```text
[Insert screenshot of Jenkins console showing successful branch creation]
```

![Create Branch](screenshots/part1-create-branch.png)

---

### 2. List All Branches

To display all local and remote branches:

```bash
git branch -a
```

**Screenshot – List Branches**

```text
[Insert screenshot showing all Git branches]
```

![List All Branches](screenshots/part1-list-branches.png)

---

### 3. Merge One Branch With Another

To merge changes from one branch into another:

```bash
git checkout feature-branch
git merge main
```

The merge operation combines the changes from `main` into `feature-branch`.

**Screenshot – Merge Operation**

```text
[Insert screenshot of successful Git merge]
```

![Merge Branch](screenshots/part1-merge.png)

---

### 4. Rebase One Branch With Another

To rebase a branch:

```bash
git checkout dev
git rebase main
```

Rebase moves the commits of the current branch on top of the latest commits from the target branch.

**Screenshot – Rebase Operation**

```text
[Insert screenshot of successful Git rebase]
```

![Rebase Branch](screenshots/part1-rebase.png)

---

### 5. Delete a Branch

To delete a local branch:

```bash
git branch -d feature-branch
```

To delete a remote branch:

```bash
git push origin --delete feature-branch
```

**Screenshot – Delete Branch**

```text
[Insert screenshot showing successful branch deletion]
```

![Delete Branch](screenshots/part1-delete-branch.png)

---

## Failure Notifications

The Jenkins job is configured to send notifications if a Git operation or build fails.

### Slack Notification

When the Jenkins build fails, a Slack notification is generated.

The notification can contain:

- Job name
- Build number
- Build status
- Build URL
- Failure information

**Screenshot – Slack Notification**

```text
[Insert screenshot of Slack failure notification]
```

![Slack Failure Notification](screenshots/part1-slack-notification.png)

---

### Email Notification

An email notification is configured for failed builds.

The email contains build-related information such as:

- Job name
- Build number
- Build status
- Build URL
- Failure information

**Screenshot – Email Notification**

```text
[Insert screenshot of Jenkins failure email]
```

![Email Failure Notification](screenshots/part1-email-notification.png)

---

# Part 2 — Parameterized Jenkins Jobs

## Objective

Part 2 consists of two Jenkins jobs.

```text
Ninja-File-Creator
        |
        | SUCCESS
        v
Ninja-File-Publisher
        |
        v
   Nginx Web Server
        |
        v
      Browser
```

The first Jenkins job accepts a **Ninja Name** as a string parameter and creates a file.

The second Jenkins job automatically runs after the first job succeeds and publishes the generated file using a web server.

---

# Job 1 — Ninja-File-Creator

## Job Name

```text
Ninja-File-Creator
```

## Parameter

The job is configured as a parameterized build.

Parameter name:

```text
NINJA_NAME
```

Example input:

```text
Shristy
```

The parameter allows the user to provide the Ninja name whenever the job is executed.

**Screenshot – Job 1 Parameter**

```text
[Insert screenshot showing NINJA_NAME String Parameter]
```

![Job 1 Parameter](screenshots/part2-job1-parameter.png)

---

## File Creation

The job creates a file named:

```text
ninja.txt
```

The content of the file follows the required format:

```text
<Ninja Name> from DevOps Ninja
```

For example:

```text
Shristy from DevOps Ninja
```

The file is created using the following shell script:

```bash
#!/bin/bash

echo "$NINJA_NAME from DevOps Ninja" > ninja.txt

echo "File created successfully!"

cat ninja.txt
```

### Explanation

If the user enters:

```text
NINJA_NAME = Shristy
```

the generated file contains:

```text
Shristy from DevOps Ninja
```

---

## Archive the File

After creating `ninja.txt`, the file is archived as a Jenkins artifact.

Artifact:

```text
ninja.txt
```

This allows the downstream Jenkins job to retrieve the file.

**Screenshot – Job 1 Artifact**

```text
[Insert screenshot showing Execute Shell and Archive the artifacts configuration]
```

![Job 1 Artifact](screenshots/part2-job1-artifact.png)

---

## Job 1 Successful Build

After running the parameterized build, the console output verifies that the file was created successfully.

Expected output:

```text
File created successfully!
Shristy from DevOps Ninja
Finished: SUCCESS
```

**Screenshot – Job 1 Success**

```text
[Insert screenshot of Job 1 successful console output]
```

![Job 1 Success](screenshots/part2-job1-success.png)

---

# Job 2 — Ninja-File-Publisher

## Job Name

```text
Ninja-File-Publisher
```

Job 2 is responsible for retrieving the artifact generated by Job 1 and publishing it through a web server.

---

# Copy Artifact From Job 1

The `ninja.txt` file generated by Job 1 is retrieved using the Jenkins **Copy Artifact** functionality.

Source project:

```text
Ninja-File-Creator
```

Artifact:

```text
ninja.txt
```

The artifact is copied into the workspace of Job 2.

---

# Web Server

Nginx is used as the web server for publishing the file.

The Nginx web root is:

```text
/var/www/html/
```

The generated file is copied to:

```text
/var/www/html/ninja.txt
```

This allows Nginx to serve the file through HTTP.

---

## Publish File

The Job 2 shell script is:

```bash
#!/bin/bash

echo "Checking artifact..."

ls -l ninja.txt

echo "File content:"
cat ninja.txt

echo "Publishing file through Nginx..."

sudo cp ninja.txt /var/www/html/ninja.txt

echo "Testing Nginx..."

curl http://localhost/ninja.txt

echo "File published successfully!"
```

### Explanation

The script performs the following operations:

1. Checks whether `ninja.txt` exists.
2. Displays the file content.
3. Copies the file to the Nginx web root.
4. Tests the published file using `curl`.
5. Displays a successful publishing message.

---

**Screenshot – Job 2 Publish Configuration**

```text
[Insert screenshot showing Copy Artifact and Execute Shell configuration]
```

![Job 2 Publish Configuration](screenshots/part2-job2-publish.png)

---

# Nginx Verification

Nginx configuration can be checked using:

```bash
sudo nginx -t
```

The published file can be tested from the Jenkins/WSL environment using:

```bash
curl http://localhost/ninja.txt
```

Expected output:

```text
Shristy from DevOps Ninja
```

---

# Job Chaining

Job 2 must be triggered **automatically only after Job 1 completes successfully**.

The Jenkins flow is:

```text
Ninja-File-Creator
        |
        | SUCCESS
        v
Ninja-File-Publisher
```

The configuration is performed in Job 1 using:

```text
Job 1
→ Configure
→ Post-build Actions
→ Build other projects
→ Ninja-File-Publisher
→ Trigger only if build is stable
```

This ensures that Job 2 is triggered automatically after a successful Job 1 build.

If Job 1 fails, Job 2 will not be triggered.

**Screenshot – Job Chaining**

```text
[Insert screenshot showing Job 1 triggering Job 2 automatically]
```

![Job Chaining](screenshots/part2-job-chaining.png)

---

# Job 2 Successful Execution

When Job 2 starts automatically, Jenkins first copies the artifact from Job 1.

The console output contains information similar to:

```text
Started by upstream project "Ninja-File-Creator"

Copied 1 artifact from "Ninja-File-Creator"

Checking artifact...

File content:
Shristy from DevOps Ninja

Publishing file through Nginx...

Testing Nginx...

Shristy from DevOps Ninja

File published successfully!

Finished: SUCCESS
```

**Screenshot – Job 2 Success**

```text
[Insert screenshot showing artifact copy, publishing and Finished: SUCCESS]
```

![Job 2 Success](screenshots/part2-job2-success.png)

---

# Browser Verification

The published file can be accessed through the web browser.

Since Nginx is running inside WSL, the WSL IP address can be obtained using:

```bash
hostname -I
```

Example:

```text
172.21.50.94
```

The file can then be opened using:

```text
http://172.21.50.94/ninja.txt
```

The browser displays:

```text
Shristy from DevOps Ninja
```

**Screenshot – Browser Output**

```text
[Insert screenshot of browser displaying ninja.txt content]
```

![Browser Output](screenshots/part2-browser-output.png)

---

# Notifications

Both Jenkins jobs are configured to support build notifications according to the assignment requirements.

## Failure Notification

If any step fails:

```text
Jenkins Build Failure
        |
        +------> Slack Notification
        |
        +------> Email Notification
```

The notification can contain:

```text
Job Name
Build Number
Build Status
Build URL
Failure Information
```

---

## Success Notification

If all required jobs complete successfully:

```text
Job 1 SUCCESS
      |
      v
Job 2 SUCCESS
      |
      +------> Slack Notification
      |
      +------> Email Notification
```

This confirms the complete automated workflow.

---

# Complete Execution Flow

```text
                    USER
                      |
                      | NINJA_NAME
                      v
             +-------------------+
             | Ninja-File-Creator|
             +-------------------+
                      |
                      | Create ninja.txt
                      |
                      | Archive Artifact
                      v
                JOB 1 SUCCESS
                      |
                      | Automatic Trigger
                      v
             +---------------------+
             | Ninja-File-Publisher|
             +---------------------+
                      |
                      | Copy Artifact
                      v
                 ninja.txt
                      |
                      | sudo cp
                      v
             /var/www/html/
                      |
                      v
                    Nginx
                      |
                      v
                  HTTP URL
                      |
                      v
                  Browser
                      |
                      v
       "Shristy from DevOps Ninja"
```

---

# Assignment Requirements

| Requirement | Implementation |
|---|---|
| Create Git branch | Jenkins + Git |
| List branches | `git branch -a` |
| Merge branches | `git merge` |
| Rebase branches | `git rebase` |
| Delete branch | `git branch -d` / `git push origin --delete` |
| Failure Slack notification | Jenkins Slack Notification |
| Failure Email notification | Jenkins Email Notification |
| Parameterized Job 1 | `NINJA_NAME` |
| Create file | `ninja.txt` |
| Required file content | `<Ninja Name> from DevOps Ninja` |
| Archive artifact | Jenkins Artifact |
| Job 2 | `Ninja-File-Publisher` |
| Automatic Job 2 trigger | Job 1 success |
| Web server | Nginx |
| Publish location | `/var/www/html/ninja.txt` |
| Browser verification | HTTP URL |
| Success notifications | Slack + Email |

---

# Conclusion

This assignment demonstrates Jenkins automation for **Git operations, parameterized builds, artifact management, upstream/downstream job triggering, web-server publishing, and build notifications**.

In Part 1, Jenkins is used to automate common Git branch operations such as creating, listing, merging, rebasing, and deleting branches.

In Part 2, Jenkins creates a parameterized file in Job 1, archives it as an artifact, and automatically passes it to Job 2 after a successful build. Job 2 publishes the file through an Nginx web server and makes the content accessible through a browser.

The complete workflow demonstrates how Jenkins can automate a multi-step CI process from input and file creation to artifact transfer, web publishing, and build notifications.
