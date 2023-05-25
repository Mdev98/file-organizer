# File Organizer Script

This Bash script is designed to organize files in a target directory based on their file types. It automatically creates folders for different file types and moves the files into their respective folders.

## Usage

1. Make sure you have Bash installed on your system.
2. Download the script and save it with a `.sh` extension (e.g., `file_organizer.sh`).
3. Open a terminal and navigate to the directory where the script is saved.
4. Run the script with the following command:


Replace `<target_directory>` with the path to the directory you want to organize.

5. The script will create subdirectories for different file types (e.g., `Images`, `Documents`, `Videos`, `Audio`, `Others`) within the target directory.
6. It will then move the files into their corresponding folders based on their file extensions.

## Example

Suppose you have a directory called `Documents` that contains various files:

```bash
Documents
├── report.docx
├── image.jpg
├── music.mp3
└── video.mp4
```


To organize the files in the `Documents` directory, you can run the script as follows:

`bash file_organizer.sh Documents`

```bash
Documents
├── Images
│   └── image.jpg
├── Documents
│   └── report.docx
├── Audio
│   └── music.mp3
├── Videos
│   └── video.mp4
└── Others

```

## HOW IT WORKS

Here's a breakdown of how the script works:

1. The script takes a target directory as an argument and assigns it to the variable **`target_directory`**.
2. It uses the **`find`** command to locate all files in the target directory and its subdirectories, and then pipes the output to the file command to determine the file types.
3. The output of the file command is processed using the **`cut`** command to extract the file extensions.
4. The **`uniq`** command removes any duplicate file extensions.
5. The **`xargs`** command is used to create directories based on each unique file extension, using the mkdir command. Any error messages are redirected to ***/dev/null*** to suppress them.
6. A loop is set up to iterate through each folder in the target directory.
7. For each folder that is a directory, the folder name is extracted using the basename command and assigned to the variable folder_name.
8. Another loop is set up to find files in the target directory with the same file extension as the current folder.
9. If a file is found, it is moved to the respective folder using the mv command.
10. After processing the existing folders, the script creates specific folders for different types of files (Images, Documents, Videos, Audio, Others) using the mkdir -p command. The -p option ensures that the command doesn't fail if the folders already exist.
11. Finally, a loop is set up to iterate through each file in the target directory.
12. For each file that is not a directory, the file extension is extracted and assigned to the variable folder_name.
13. The file is moved to the appropriate folder based on its file type using a case statement.

## Notes

- The script assumes that the target directory already exists and contains the files to be organized.
- Make sure to provide the correct path to the target directory when running the script.
- If the script encounters any errors during the process, it may display error messages. Check the terminal output for any issues.
 
 
## **THE SCRIPT IS NOT OPTIMAL YET SOME IMPROVES NEEDED**