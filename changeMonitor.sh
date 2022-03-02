
# init variables from flags
while getopts d:c:t: flag
do
    case "${flag}" in
        d) monitor_dir=${OPTARG};;
        c) command_to_run=${OPTARG};;
    esac
done

# check if variable are setted right
if [ -z "$monitor_dir" ]; then
    echo "monitor directory is not setted. please use '-d' flag to set it properly."
    exit
fi

if [ -z "$command_to_run" ]; then
    echo "command to run is not setted. please use '-c' flag to set it properly."
    exit
fi

monitor_command="stat -c %n%a%s%W%Y%Z $monitor_dir/*"

last_dir_change_timestamp=$($monitor_command 2>&1)

while true
do   
    sleep 0.5
    new_dir_change_timestamp=$($monitor_command 2>&1)

    if [ "$new_dir_change_timestamp" != "$last_dir_change_timestamp" ]; then
        eval "$command_to_run"
        last_dir_change_timestamp=$new_dir_change_timestamp
    fi
done