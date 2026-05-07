function resolve_path
    set -l resolved (realpath $argv[1])
    if test -d $resolved
        echo $resolved/
    else
        echo $resolved
    end
end
