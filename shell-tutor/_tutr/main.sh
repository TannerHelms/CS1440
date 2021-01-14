# vim: set expandtab tabstop=4 shiftwidth=4:

# This function is run *BEFORE* a command.
preexec() {
    if [[ -n $BASH ]]; then
        _CMD=( $1 )
    elif [[ -n $ZSH_NAME ]]; then
        _CMD=( ${(z)1} )
    fi
}


# This function is run *AFTER* a command and *BEFORE* the prompt is drawn.
#
# Perhaps should have been called preprompt()
precmd() {
    local _RES=$?

    # This is needed for ${_CMD[0]} to work in _test
    if [[ -n $ZSH_NAME ]]; then
        emulate -L zsh
        setopt ksh_arrays
    fi

    # This if statement prevents running all of this code when the user simply
    # hits ENTER at the prompt
    if [[ -n $_CMD ]]; then
        # check whether the test now passes
        if $_TEST; then

            # run this skill's _post and _epilogue functions, if extant
            _tutr_has_function $_EPILOGUE && _tutr_warn $_EPILOGUE
            _tutr_has_function $_POST && $_POST

            # move onto the next skill
            _tutr_next_skill
        else
            _tutr_warn $_HINT $?
        fi
    fi

    _CMD=$1
}


# Display the contents of _CMD, numbered
_tutr_debug_CMD() {
    local I=0
    for W in ${_CMD[@]}; do
        echo "$I. $W"
        (( I++ ))
    done
}


# Add some breathing room around a command's output
# Also prefixes command's output with bold green "Tutor: "
_tutr_info() {
    echo
    eval "$@" | sed -e $'s/.*/\x1b[1;32mTutor\x1b[0m| &/'
    echo
}

# Add some breathing room around a command's output
# Also prefixes command's output with bold yellow "Tutor: "
_tutr_warn() {
    echo
    eval "$@" | sed -e $'s/.*/\x1b[1;33mTutor\x1b[0m| &/'
    echo
}

# Add some breathing room around a command's output
# Also prefixes command's output with bold red "Tutor: "
_tutr_err() {
    echo
    eval "$@" | sed -e $'s/.*/\x1b[1;31mTutor\x1b[0m| &/'
    echo
}


_tutr_die() {
    _tutr_err echo "$@"
    exit 1
}



# Enable user to interact with the tutor
tutor() {
    case $1 in
        hint)
            _tutr_warn $_PROLOGUE
            ;;

        check)
            : # Intentional NO-OP - _test will be run automatically anyway
            ;;

        where)
            echo "You are on step $((_I + 1)) of ${#_SKILLS[@]}" | sed -e $'s/.*/\x1b[1;32mTutor\x1b[0m| &/'
            ;;

        skip)
            echo "Skipping step $((_I + 1)) of ${#_SKILLS[@]}" | sed -e $'s/.*/\x1b[1;33mTutor\x1b[0m| &/'
            _tutr_next_skill $((_I + 1))
            ;;

        goto)
            if [[ -n "$2" && $2 -ge 0 && $2 -le $(( ${#_SKILLS[@]} - 1 )) ]]; then
                echo "Going directly to step $2 of ${#_SKILLS[@]}" | sed -e $'s/.*/\x1b[1;33mTutor\x1b[0m| &/'
                _tutr_next_skill $(( $2 ))
            else
                echo "Cannot go to step $2" | sed -e $'s/.*/\x1b[1;31mTutor\x1b[0m| &/'
            fi
            ;;

        name)
            if [[ -n $ZSH_NAME ]]; then
                emulate -L zsh
                setopt ksh_arrays
            fi
            echo "The name of this step is '${_SKILLS[$((_I))]}'"
            ;;

        exit|quit)
            echo $'Leaving tutorial...\n\nGoodbye' | sed -e $'s/.*/\x1b[1;32mTutor\x1b[0m| &/'
            exit
            ;;

        *)
            # A heredoc declared with '<<-' requires TABS (\t) in the source
            # It's a really nice feature, but I'm not sure that I want to mix
            # tabs with spaces...
            cat <<-HELP | sed -e $'s/.*/\x1b[1;32mTutor\x1b[0m| &/'
				help       This message
				hint       Give a hint about this step
				check      Re-run this step's test() function
				where      Display progress
				name       Display the name of this step
				skip       Skip to the next step (if possible)
				goto N     Go directly to step #N
				quit       Quit this tutoring session
				HELP
            ;;
    esac
}


# Return TRUE when the function named by $1 exists
_tutr_has_function() {
    if [[ -z $1 ]]; then
        echo Usage: $0 FUNCTION
        return 1
    fi

    if [[ -n $BASH ]]; then
        declare -f $1 >/dev/null
        return $?

    elif [[ -n $ZSH_NAME ]]; then
        functions $1 >/dev/null 
        return $?
    fi
}


# Press any key to continue prompt
_tutr_pressanykey() {
    echo $'\x1b[7m[Press any key]\x1b[0m'
    if [[ -n $BASH ]]; then
        read -n 1 -s
    elif [[ -n $ZSH_NAME ]]; then
        read -k -s
    fi
}



# Default hint function
_tutr_hint() {
    echo "It's okay to make mistakes.  Try again!"
}


_tutr_next_skill() {
    if [[ -n $ZSH_NAME ]]; then
        emulate -L zsh
        setopt ksh_arrays
    fi

    if [[ -n $1 ]]; then
        # This is how `tutor goto N` works
        _I=$1
    else
        # In the normal case we increment _I now so as to not re-run the test
        # of a skill that's just been passed off
        (( _I++ ))
    fi

    until _tutr_is_all_done $0; do
        _PROLOGUE=${_SKILLS[$_I]}_prologue
        _PRE=${_SKILLS[$_I]}_pre
        _HINT=${_SKILLS[$_I]}_hint
        _TEST=${_SKILLS[$_I]}_test
        _EPILOGUE=${_SKILLS[$_I]}_epilogue
        _POST=${_SKILLS[$_I]}_post

        if ! _tutr_has_function $_HINT; then
            if _tutr_has_function $_PROLOGUE; then
                _HINT=$_PROLOGUE
            else
                _HINT=_tutr_hint
            fi
        fi

        if _tutr_has_function $_TEST; then

            # Run this skill's `pre_` (if extant) before testing
            _tutr_has_function $_PRE && $_PRE

            if ! $_TEST; then
                # Run this skill's `prologue_` function, if extant
                _tutr_has_function $_PROLOGUE && _tutr_info $_PROLOGUE
                break

            else
                # go on to the next skill
                (( _I++ ))
                continue
            fi
        else
            _tutr_die "ERROR in $0: $_TEST does not exist"
        fi
    done

    _tutr_is_all_done $0 && _tutr_all_done
}


# Detect when the user is all done with this tutorial (presently, when len(_SKILLS) == 0
_tutr_is_all_done() {
	(( ${#_SKILLS[@]} == 0 || $_I == ${#_SKILLS[@]} ))
}


# Conclude and exit the tutorial environment
_tutr_all_done() {
    echo; _tutr_statusbar $_I ${#_SKILLS[@]} $(basename $_TUTR); echo

    if _tutr_has_function epilogue; then
        _tutr_info epilogue
    else
        echo
        echo $'\x1b[1;32mTutor\x1b[0m| All done!'
        echo $'\x1b[1;32mTutor\x1b[0m| This concludes your lesson'
    fi
    exit
}


# Displays the +/- status bar before the prompt
_tutr_statusbar() {
	if (( $# < 2 )); then
        echo "ERROR: too few arguments"
        echo "USAGE: _tutr_statusbar NUMERATOR DENOMINATOR [MESSAGE]"
        return 1
    fi

    local N=$1
    shift
    local D=$1
    shift

	if (( $# > 0 )); then
        local MSG=$'\x1b[1;7m'$@$'\x1b[0m'" - Step $N of $D ["
    else
        local MSG="Step $N of $D ["
    fi

    local REMAIN=$((D - N))
    local PADDING='----------------------------------------------------------------------'
    local COMPLET='++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
	while (( ${#PADDING} < $D )); do
        PADDING=$PADDING$PADDING
        COMPLET=$COMPLET$COMPLET
    done

    echo -n $MSG$'\x1b[1;32m'${COMPLET:0:$N}$'\x1b[1;31m'${PADDING:$N:$REMAIN}$'\x1b[0m]'
}


# Begin the tutorial by initializing the _SKILLS array to this functions arguments
_tutr_begin() {
    if [[ -n $ZSH_NAME ]]; then
        # TODO This line used to be 'emulate zsh'
        # Is this change okay?
        emulate -L zsh
        setopt prompt_subst
    elif [[ -n $BASH ]]; then
        source _tutr/bash-preexec.sh
    fi

    # If _BASE is defined chdir into that directory
    [[ -n $_BASE ]] && cd "$_BASE"

    # Remember where we were when we began
    _ORIG_PWD=$PWD

    _tutr_has_function prologue && _tutr_info prologue

    _SKILLS=( $@ )
    _I=0
    _tutr_next_skill $_I

    # Add lesson name to the PS1 prompt to identify when one is in the tutorial environment
    #PS1=$'[$(basename $_TUTR) $((_I + 1))/${#_SKILLS[@]}]\n'$PS1

    # add a statusbar to the PS1 prompt
    PS1=$'$(_tutr_statusbar $_I ${#_SKILLS[@]} $(basename $_TUTR))\n'$PS1

    _tutr_is_all_done $0 && _tutr_all_done
}

_tutr_pretty_time() {
    local seconds=${1:-$SECONDS}
    local -a backwards
    local i=1

    #convert raw seconds into array=(seconds minutes hours)
    while [[ $seconds -ne 0 ]]; do
        backwards[$i]=$(( $seconds % 60 ))
        let i++
        let seconds=$(( $seconds / 60))
    done

    #reverse the array
    local j=1
    [[ $i -gt 0 ]] && let i--
    local -a result
    while [[ $i -gt 1 ]]; do
        result[$j]=${backwards[$i]}
        let j++
        let i--
    done
    result[$j]=${backwards[$i]}

    #print it out
    case ${#result[@]} in
        3) printf '%02d:%02d:%02d' ${result[@]} ;;
        2) printf '%02d:%02d' ${result[@]} ;;
        1) printf '00:%02d' ${result[@]} ;;
    esac
}



# Install the shell tutorial shim (with permission) into user's RC file
_tutr_install_shim() {
    if [[ -z $1 ]]; then
        _tutr_die "Usage: $0 SHELL_RC_FILE_NAME"
    fi

    SHIM='[[ -n "$_TUTR" ]] && source $_TUTR || true  # shell tutorial shim DO NOT MODIFY'

    cat <<-ASK | sed -e $'s/.*/\x1b[1;33mTutor\x1b[0m| &/'
	Before you can begin this lesson I need to install a bit of code
	into your shell's startup file '$1'.
	
	In case you're curious, the code looks like this:

	  $SHIM
	
	This is a one-time-only edit.  I won't ask again to make any more
	changes to your startup files.
	ASK

    REPLY=
    while true; do
        echo -en $'\n\x1b[1;33mTutor\x1b[0m| May I make this one-time change to this file?  [Y/n] '

        if [[ -n $BASH ]]; then
            read -n 1 -s
        elif [[ -n $ZSH_NAME ]]; then
            read -k -s
        fi

        echo
        case $REPLY in
            [Yy])
                _tutr_info echo "Installing shell tutorial shim into $1..."
                cat <<-SHIM >> "$1"
				
				$SHIM
				
				SHIM

				if (( $? != 0 )); then
                    _tutr_die I am unable to modify $1.  Exiting tutorial.
                fi
                break
                ;;
            [Nn])
                _tutr_die You cannot proceed with the tutorial without making this change
                ;;
        esac
    done
}


# Detect or install the rc-file shim
if [[ -z "$_TUTR" ]]; then
    if expr $SHELL : '.*zsh' >/dev/null; then
        if [[ ! -f "$HOME/.zshrc" ]]; then
            _tutr_install_shim "$HOME/.zshrc"
        elif ! grep -q "# shell tutorial shim DO NOT MODIFY" "$HOME/.zshrc"; then
            _tutr_install_shim "$HOME/.zshrc"
        fi
    elif expr $SHELL : '.*bash' >/dev/null; then
        if [[ ! -f "$HOME/.bashrc" ]]; then
            _tutr_install_shim "$HOME/.bashrc"
        elif ! grep -q "# shell tutorial shim DO NOT MODIFY" "$HOME/.bashrc"; then
            _tutr_install_shim "$HOME/.bashrc"
        fi
    else
        _tutr_die "Unable to install tutorial shim into your shell's startup file"
    fi


    # We want to run _tutr_begin() only once.  Because of the way we spawn a
    # subshell AND source the lesson script, _tutr_begin() would be invoked again
    # after the end of a lesson.
    #
    # This snippet of code returns 1 or 0 to ensure that _tutr_begin is only run
    # at the beginning of a lesson.
    if _tutr_has_function setup; then
		setup
		if (( $? == 0 )); then
			_TUTR=$0 $SHELL
			_tutr_has_function cleanup && cleanup
		else
			_tutr_die "$0 setup error: contact erik.falor@usu.edu for help"

		fi
	fi
    false
else
    true
fi
