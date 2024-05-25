function __fish_no_subcommand
    test (count (commandline -poc)) -eq 1
end
