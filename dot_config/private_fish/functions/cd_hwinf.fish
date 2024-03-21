function cd_hwinf
    set -l name eash_(date +%s%3N)
    set -l LOCAL_PATH (git rev-parse --show-prefix)
    set -l NVCI_PATH  (nvci --json create hwinfci --name $name |jq .root -r)
    if set -q NVCI_PATH
        cd $NVCI_PATH/$LOCAL_PATH
        #cd `nvci --json create hwinfci --name $name |jq .root -r`/`git rev-parse --show-prefix`
        p4 sync -q
    end
end
