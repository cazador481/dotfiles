function cu
    # doitclient -D -P win 'C:\Users\eddie\AppData\Local\Programs\cursor\Cursor.exe' --file-uri "vscode-remote://ssh-remote+sc-vnc/$(realpath $argv)"
    doitclient -D -P win 'C:\Users\eddie\AppData\Local\Programs\cursor\Cursor.exe' -n --remote "ssh-remote+vpx" "$(resolve_path $argv)"
end
