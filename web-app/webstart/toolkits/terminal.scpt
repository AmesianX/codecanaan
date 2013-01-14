on run argv
    tell app "Terminal"
        activate
        set tab1 to do script item 1 of argv
		tell tab1 to set custom title to "CodeCanaan"
    end tell
end run
