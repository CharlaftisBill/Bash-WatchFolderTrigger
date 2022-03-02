# Bash-WatchFolderTrigger
This Bash script is "watching" a directory for changes and when that happens it triggers a command.

## Arguments:

arguments are required:
```
-d :   Is the directory that the script is watching.
-c :   The system command_to_run if any change found.
```

## Example:

 ```
 ./changeMonitor.sh -d ./path/to/dir -c 'echo test'
 ```
 
 ## Notice:
 This repo is similar to "Python-WatchFolderTrigger" but written in Bash script.