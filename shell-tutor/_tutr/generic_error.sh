# ENUMERATE EVERY WAY A SKILL CAN GO WRONG
WRONG_PWD=1
WRONG_CMD=2
MISSPELD_CMD=3
WRONG_ARGS=4
TOO_FEW_ARGS=5
TOO_MANY_ARGS=6
PASS=7

source _tutr/lev.sh


# Adapted from https://stackoverflow.com/a/6974992
# Print the longest common prefix of two strings
_tutr_lcp() {
	local prefix= n

	## Truncate the two strings to the minimum of their lengths
	if [[ ${#1} -gt ${#2} ]]; then
		set -- "${1:0:${#2}}" "$2"
	else
		set -- "$1" "${2:0:${#1}}"
	fi

	## Binary search for the first differing character, accumulating the common prefix
	while [[ ${#1} -gt 1 ]]; do
		n=$(((${#1}+1)/2))
		if [[ ${1:0:$n} == ${2:0:$n} ]]; then
			prefix=$prefix${1:0:$n}
			set -- "${1:$n}" "${2:$n}"
		else
			set -- "${1:0:$n}" "${2:0:$n}"
		fi
	done

	## Add the one remaining character, if common
	if [[ $1 = $2 ]]; then prefix=$prefix$1; fi
	printf %s "$prefix"
}

# -a = ordered args - must be present in this given order
#      This argument may be given many times
# -d = dir - what must PWD be?
# -c = cmd - which command is acceptable?
# -l = Max acceptable Levenshtein distance for misspelled commands
#
# Examples:
#  
#  Validate 'ls file1.txt file2.txt' in the directory $_BASE
#    _tutr_generic_test -c ls -d $_BASE -a file1.txt -a file2.txt
#
#  Idem. but catch a misspelling of 'ls' if the lev dist. == 1
#    _tutr_generic_test -c ls -d $_BASE -a file1.txt -a file2.txt -l 1
#
# Validate 'systemctl restart' considering typos with lev. dist. between [1,4]
#    _tutr_generic_test -c systemctl -a restart -l 4

# TODO: when the user gives an argument with a trailing '/' this command
#       regards it as wrong, even though in most cases it works just fine
_tutr_generic_test() {
	_TEMP=$(getopt 'a:c:d:l:' "$@")
	[[ $? -ne 0 ]] && return 86

	# parse options into variables...
	# Note the quotes around "$TEMP": they are essential!
	eval set -- "$_TEMP"
	unset _TEMP

    declare -a _A=( cmd )
	declare -i _N=0

	while true; do

		case "$1" in
			'-a')
				_A+=("$2")
				shift 2
				continue
				;;
			'-c')
				_C="$2"
				shift 2
				continue
				;;

			'-d')
				_D="$2"
				shift 2
				continue
				;;

			'-l')
				_L="$2"
				shift 2
				continue
				;;

			'--')
				shift
				break
				;;

			*)
				echo "_tutr_generic_test getopt parse error! 1=$1 2=$2 3=$3 4=$4" >&2
				exit 1
				;;
		esac
	done

    _N=${#_A[@]}

    #   echo "DEBUG|"  # DELETE ME
    #   echo "DEBUG| _A=$_N(${_A[@]})"  # DELETE ME
    #   echo "DEBUG| _C=$_C"  # DELETE ME
    #   echo "DEBUG| _D=$_D"  # DELETE ME
    #   echo "DEBUG| _L=$_L"  # DELETE ME
    #   echo "DEBUG|"  # DELETE ME
    #   echo "DEBUG| '${_CMD[@]}'"
    #   echo "DEBUG| _CMD[0]='${_CMD[0]}'"
    #   echo "DEBUG| _CMD[1]='${_CMD[1]}'"
    #   echo "DEBUG| _CMD[2]='${_CMD[2]}'"

	# If the user ran a command in the wrong dir ...
	[[ -n $_D && $PWD != $_D ]] && return $WRONG_PWD

    # if command is spelled correctly...
	if [[ ${_CMD[0]} == $_C ]]; then


        # ... or has too few args ...
        [[ "${#_CMD[@]}" -lt $_N ]] && return $TOO_FEW_ARGS

        # ... or too many args ...
        [[ "${#_CMD[@]}" -gt $_N ]] && return $TOO_MANY_ARGS

        # ... or the wrong args
        # (I think this will work b/c ksh_arrays should be in force for Zsh)
        for (( _J=1; _J<$_N; _J++ )); do
            [[ ${_CMD[$_J]} != ${_A[$_J]} ]] && return $WRONG_ARGS
        done

        # Otherwise, we'll have to let it go
		return 0
	fi

    # When we get down here it's because the command didn't match the expectation.
    # If the script used the '-l' option, check if the user made a typo ...
    [[ -n $_L ]] && _tutr_lev "${_CMD[0]}" "$_C" $_L && return $MISSPELD_CMD

    # ... If it wasn't a typo it can only be the wrong command
	return $WRONG_CMD
}


# $1 = error code
# $2 = name of cmd they should have run
# $3 = Directory user needs to get into
_tutr_generic_hint() {
	case $1 in
		$MISSPELD_CMD)  echo "It looks like you spelled '$2' wrong" ;;
		$WRONG_CMD)     echo "Use the '$2' command to proceed" ;;
		$TOO_FEW_ARGS)  echo "You gave '$2' too few arguments" ;;
		$TOO_MANY_ARGS) echo "You ran '$2' with too many arguments" ;;
        $WRONG_ARGS)    echo "'$2' got the wrong argument(s)" ;;

		$WRONG_PWD)
			# Improve the hint by giving the user a minimal 'cd' command

			if [[ -n $3 ]]; then 
				local here="$PWD"
				local there="$3"
				local dots=

				# if $3 is a substring of , then compute a relative
				# path of "../"s to get there
				if [[ "$here" = "$there"* ]]; then
					local dest=$here

					# XXX possibility of inf. loop; $dest should eventually
					# become "/" and thus break this loop
					until [[ $dest = $there || "$dest" = / ]]; do
						dots="../$dots"
						dest=$(dirname "$dest")
					done

				else
					# Elide the common prefix of $3 and $PWD
					local LCP=$(_tutr_lcp "$PWD" "$3")
					if [[ -n $LCP && "$LCP" != / ]]; then
						here=${PWD#$LCP}
						if [[ $PWD != / && ${here:0:1} = / ]]; then
							here=${here#/}
						fi

						there=${3#$LCP}
						if [[ $3 != / && ${there:0:1} = / ]]; then
							there=${there#/}
						fi
					else
						here=$PWD
						there=$3
					fi
				fi

				cat <<-MSG
					To proceed you need to be in the directory
					  $there
				MSG

				if [[ -n $here ]]; then
					cat <<-MSG
						instead of
						  $here
					MSG
				fi

				echo
				echo This command will get you back on track:

				# suggest 'cd -' when that will work; otherwise wrap the
				# suggestion in quotes if the target path contains a space
				if [[ $3 = $OLDPWD ]]; then
					echo "  cd -"
				elif [[ -n $dots ]]; then
					echo "  cd ${dots%/}"

				elif [[ "$there" = *" "* ]]; then
					echo "  cd '$there'"
				else
					echo "  cd $there"
				fi
				echo
			else
				cat <<-MSG
				You are presently in the wrong directory.  Unfortunately,
				I can't tell you which directory you should be in.

				Email erik.falor@usu.edu and write which lesson you are in
				and which step you are on when this message came up.  Scroll
				back a few steps to copy and paste some the preceeding text for
				context.

				Then restart this lesson.

				MSG
			fi
			;;
        $PASS)
            :
            ;;
		*)
			echo "_tutr_generic_hint(): Why are we here? CMD=${_CMD[@]} \$1=$1"
			echo
			;;
	esac
}


# vim: set filetype=sh noexpandtab tabstop=4 shiftwidth=4:
