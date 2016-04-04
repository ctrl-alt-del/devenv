git-bash
========

### Git Theme
The theme of Git can be easily modified on the `/Git/etc/profile.d/git-prompt.sh` file.

One example theme would be:
```sh
PS1='\[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]' # set window title
PS1="$PS1"'\[\033[1;32m\]'       # change to bold green
PS1="$PS1"'→ '                 # add an right arrow
PS1="$PS1"'\[\033[1;36m'       # change to bold cyan
PS1="$PS1"'\w'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
	if test -f "$COMPLETION_PATH/git-prompt.sh"
	then
		. "$COMPLETION_PATH/git-completion.bash"
		. "$COMPLETION_PATH/git-prompt.sh"
		PS1="$PS1"'\[\033[1;31m\]'  # change color to bold red
		PS1="$PS1"'`__git_ps1`'   # bash function

	fi
fi
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"' '                 # prompt: always space
```

The color is in ANSI 16-Colors code, and here is a short summary for the colors and styles:

##### Escape sequence:
There are two escape sequences: `\033[<code>m` or `\e[<code>m`

##### Text attributes
* `0` All attributes off
* `1` Bold on
* `4` Underscore
* `5` Blink on
* `7` Reverse video on
* `8` Concealed on

##### Foreground colors
* `30` Black
* `31` Red
* `32` Green
* `33` Yellow
* `34` Blue
* `35` Purple
* `36` Cyan
* `37` White

##### Background colors
* `40` Black
* `41` Red
* `42` Green
* `43` Yellow
* `44` Blue
* `45` Purple
* `46` Cyan
* `47` White
[BACK TO TOP](#table-of-contents)
