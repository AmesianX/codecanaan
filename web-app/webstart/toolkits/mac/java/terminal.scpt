on run argv
    tell app "Terminal"
        activate
        set tab1 to do script item 1 of argv
    end tell
end run
