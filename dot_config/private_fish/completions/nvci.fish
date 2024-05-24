# nvci completions for fish shell

# Main nvci command and its subcommands
complete -c nvci -n "__fish_use_subcommand" -x -a "api cancel config create delete help review status submit tasks totstat verify" -d "Commands"

# nvci api subcommand and its sub-subcommands
complete -c nvci -n "__fish_seen_subcommand_from api" -x -a "message" -d "Commands for interacting with an active NVCI run"
complete -c nvci -n "__fish_seen_subcommand_from api message" -x -a "ack get set" -d "Message subcommands"
complete -c nvci -n "__fish_seen_subcommand_from api message ack" -s h -l help -d "Show help for ack command"
complete -c nvci -n "__fish_seen_subcommand_from api message get" -s h -l help -d "Show help for get command"
complete -c nvci -n "__fish_seen_subcommand_from api message set" -s h -l help -d "Show help for set command"

# Other nvci subcommands with --help option
complete -c nvci -n "__fish_seen_subcommand_from cancel" -s h -l help -d "Show help for cancel command"
complete -c nvci -n "__fish_seen_subcommand_from config" -s h -l help -d "Show help for config command"
complete -c nvci -n "__fish_seen_subcommand_from create" -s h -l help -d "Show help for create command"
complete -c nvci -n "__fish_seen_subcommand_from delete" -s h -l help -d "Show help for delete command"
complete -c nvci -n "__fish_seen_subcommand_from review" -s h -l help -d "Show help for review command"
complete -c nvci -n "__fish_seen_subcommand_from status" -s h -l help -d "Show help for status command"

# nvci submit subcommand and its options
complete -c nvci -n "__fish_seen_subcommand_from submit" -x -a "(__fish_complete_suffix __fish_print_filesystems)" -d "File specs"
complete -c nvci -n "__fish_seen_subcommand_from submit" -l bar -d "Bar(s) to validate against" -x
complete -c nvci -n "__fish_seen_subcommand_from submit" -l task -d "Task(s) to run" -x
complete -c nvci -n "__fish_seen_subcommand_from submit" -s d -l working-directory -d "The directory in which to execute" -r
complete -c nvci -n "__fish_seen_subcommand_from submit" -l current-ws -d "Run testing in the current workspace"
complete -c nvci -n "__fish_seen_subcommand_from submit" -l clean-ws -d "Run testing in a clean workspace"
complete -c nvci -n "__fish_seen_subcommand_from submit" -s c -l changelist -d "Change to test" -x
complete -c nvci -n "__fish_seen_subcommand_from submit" -l keep-going -d "Continue running verification if tasks fail"
complete -c nvci -n "__fish_seen_subcommand_from submit" -l stop-on-failure -d "Stop running verification if a task fails"
complete -c nvci -n "__fish_seen_subcommand_from submit" -s s -l set -d "A named JSON value to be made accessible" -x
complete -c nvci -n "__fish_seen_subcommand_from submit" -l qsub-opts -d "Options to pass to qsub" -x
complete -c nvci -n "__fish_seen_subcommand_from submit" -l qsub -d "Send run to qsub"
complete -c nvci -n "__fish_seen_subcommand_from submit" -l allow-config-discovery -d "Allow config discovery algorithm"
complete -c nvci -n "__fish_seen_subcommand_from submit" -l no-allow-config-discovery -d "Disallow config discovery algorithm"
complete -c nvci -n "__fish_seen_subcommand_from submit" -l config -d "Specific user-provided config files" -r
complete -c nvci -n "__fish_seen_subcommand_from submit" -l width -d "Width of rich text elements" -x
complete -c nvci -n "__fish_seen_subcommand_from submit" -s f -l force -d "Do not run tests, attempt to force submit"
complete -c nvci -n "__fish_seen_subcommand_from submit" -s h -l help -d "Show help for submit command"

# nvci tasks subcommand with --help option
complete -c nvci -n "__fish_seen_subcommand_from tasks" -s h -l help -d "Show help for tasks command"

# nvci totstat subcommand and its sub-subcommands
complete -c nvci -n "__fish_seen_subcommand_from totstat" -x -a "break fix held history is-broken" -d "totstat commands"
complete -c nvci -n "__fish_seen_subcommand_from totstat break" -s h -l help -d "Show help for break command"
complete -c nvci -n "__fish_seen_subcommand_from totstat fix" -s h -l help -d "Show help for fix command"
complete -c nvci -n "__fish_seen_subcommand_from totstat held" -s h -l help -d "Show help for held command"
complete -c nvci -n "__fish_seen_subcommand_from totstat history" -s h -l help -d "Show help for history command"
complete -c nvci -n "__fish_seen_subcommand_from totstat is-broken" -s h -l help -d "Show help for is-broken command"

# nvci totstat options
complete -c nvci -n "__fish_seen_subcommand_from totstat" -l json -d "Enables json output"
complete -c nvci -n "__fish_seen_subcommand_from totstat" -l silent -d "Output only fatal events"
complete -c nvci -n "__fish_seen_subcommand_from totstat" -s q -l quiet -d "Output only warnings, errors and fatal events"
complete -c nvci -n "__fish_seen_subcommand_from totstat" -s v -l verbose -d "Output all available logging information"
complete -c nvci -n "__fish_seen_subcommand_from totstat" -l log -d "File to write comprehensive log to" -r
complete -c nvci -n "__fish_seen_subcommand_from totstat" -l version -d "Show the version and exit"
complete -c nvci -n "__fish_seen_subcommand_from totstat" -s h -l help -d "Show help for totstat command"

# nvci verify subcommand and its options
complete -c nvci -n "__fish_seen_subcommand_from verify" -l bar -d "Bar(s) to validate against" -x
complete -c nvci -n "__fish_seen_subcommand_from verify" -l task -d "Task(s) to run" -x
complete -c nvci -n "__fish_seen_subcommand_from verify" -s d -l working-directory -d "The directory in which to execute" -r
complete -c nvci -n "__fish_seen_subcommand_from verify" -l current-ws -d "Run testing in the current workspace"
complete -c nvci -n "__fish_seen_subcommand_from verify" -l clean-ws -d "Run testing in a clean workspace"
complete -c nvci -n "__fish_seen_subcommand_from verify" -s c -l changelist -d "Change to test" -x
complete -c nvci -n "__fish_seen_subcommand_from verify" -l keep-going -d "Continue running verification if tasks fail"
complete -c nvci -n "__fish_seen_subcommand_from verify" -l stop-on-failure -d "Stop running verification if a task fails"
complete -c nvci -n "__fish_seen_subcommand_from verify" -s s -l set -d "A named JSON value to be made accessible" -x
complete -c nvci -n "__fish_seen_subcommand_from verify" -l qsub-opts -d "Options to pass to qsub" -x
complete -c nvci -n "__fish_seen_subcommand_from verify" -l qsub -d "Send run to qsub"
complete -c nvci -n "__fish_seen_subcommand_from verify" -l allow-config-discovery -d "Allow config discovery algorithm"
complete -c nvci -n "__fish_seen_subcommand_from verify" -l no-allow-config-discovery -d "Disallow config discovery algorithm"
complete -c nvci -n "__fish_seen_subcommand_from verify" -l config -d "Specific user-provided config files" -r
complete -c nvci -n "__fish_seen_subcommand_from verify" -l width -d "Width of rich text elements" -x
complete -c nvci -n "__fish_seen_subcommand_from verify" -s h -l help -d "Show help for verify command"

# Global nvci options
complete -c nvci -n "__fish_no_subcommand" -l version -d "Show the version and exit"
complete -c nvci -n "__fish_no_subcommand" -l json -d "Enables json output"
complete -c nvci -n "__fish_no_subcommand" -s v -l verbose -d "Output all available logging information"
complete -c nvci -n "__fish_no_subcommand" -s q -l quiet -d "Output only warnings, errors and fatal events"
complete -c nvci -n "__fish_no_subcommand" -l silent -d "Output only fatal events"
complete -c nvci -n "__fish_no_subcommand" -s h -l help -d "Show help message"