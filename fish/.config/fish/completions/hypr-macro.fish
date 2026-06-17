# commands
complete -c hypr-macro -f -n "__fish_use_subcommand" -a start-record -d "Start recording"
complete -c hypr-macro -f -n "__fish_use_subcommand" -a toggle-record -d "Toggle recording"
complete -c hypr-macro -f -n "__fish_use_subcommand" -a stop-save -d "Stop and save macro"
complete -c hypr-macro -f -n "__fish_use_subcommand" -a replay-last -d "Replay latest macro"
complete -c hypr-macro -f -n "__fish_use_subcommand" -a status -d "Show daemon status"

# flags
complete -c hypr-macro -l name -r -d "Macro name (for stop-save)"
complete -c hypr-macro -l speed -r -d "Replay speed multiplier"
