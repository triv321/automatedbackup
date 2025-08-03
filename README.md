# Project 1.1: Automated Backup Script

> A simple, robust Bash script for creating timestamped, compressed backups of any directory.

## Overview

In any production or development environment, the ability to create reliable, automated backups is a critical, non-negotiable task. Manually copying folders is slow, error-prone, and doesn't scale. This script solves that problem by providing a simple, reusable tool to create a compressed `.tar.gz` archive of any specified directory.

The script is designed with best practices in mind, including timestamped filenames for easy versioning and intelligent path handling to ensure the archives are clean and portable.

## Features

* **Timestamped Backups:** Automatically names backup files with the current date and time (e.g., `backup_2025-07-30_21-30-00.tar.gz`) for clear, chronological organization.
* **Compression:** Uses `tar` with `gzip` compression to create space-efficient `.tar.gz` archives.
* **Reusable:** Accepts source and destination directories as command-line arguments, making it a flexible utility for any project.
* **Clean Archives:** Intelligently handles paths to ensure that the archive contains only the target directory, not the entire absolute path from the root.

## Prerequisites

This script is designed to run in a standard Linux/Unix-like environment (including WSL) and relies on the following common utilities:
* `bash`
* `tar`
* `date`
* `dirname`
* `basename`

## Usage

1.  **Make the script executable:**
    Before its first use, you must give the script execute permissions.
    ```bash
    chmod +x backup.sh
    ```

2.  **Run the script:**
    The script requires two arguments: the source directory you want to back up and the destination directory where the backup file will be saved.

    **Syntax:**
    ```bash
    ./backup.sh <SOURCE_DIRECTORY> <DESTINATION_DIRECTORY>
    ```

    **Example:**
    To back up a project located at `~/projects/my-app` and save the archive in `~/backups`, you would run:
    ```bash
    ./backup.sh ~/projects/my-app ~/backups
    ```
    Upon success, the script will print a confirmation message with the full path to the newly created archive.

## How It Works

The script uses a combination of standard shell utilities to perform the backup:
1.  It accepts two positional parameters, `$1` (source) and `$2` (destination).
2.  It uses the `date` command to generate a `YYYY-MM-DD_HH-MM-SS` timestamp.
3.  To ensure clean archives, it uses `dirname` and `basename` to separate the parent path from the target folder name.
4.  The `tar` command is then invoked with the `-C` flag. This flag is critical as it instructs `tar` to change to the parent directory *before* creating the archive, which prevents the full absolute path from being stored in the backup.

## NOTE

This project is part of a bigger roadmap
