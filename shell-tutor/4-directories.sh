# Lesson #4
#
# * Navigate directories
# * Create new directories
# * Remove empty directories
# * Forcibly remove directories with no regard for their contents

# TODO: somewhere I got stuck when I didn't go directly to '/' when asked.
# 'cd -' then failed to return me to the lesson dir, and the hint was not
# helpful.  At the very least it should remind about $_BASE


if [[ -n $_TUTR ]]; then
	source _tutr/generic_error.sh
	source _tutr/nonce.sh
fi

setup() {
	$SHELL _tutr/screen_size.sh 30 80
	export _HERE=$PWD
	export _BASE=$PWD/lesson4
	[[ -d "$_BASE" ]] && rm -rf "$_BASE"
	mkdir -p "$_BASE"
	mkdir -p "$_BASE"/music/genre{0,1,2}/artist{0,1,2}/album{0,1,2}
	touch "$_BASE"/music/genre{0,1,2}/artist{0,1,2}/album{0,1,2}/track_0{1,2,3}.mp3
	touch "$_BASE/a_file"
}


prologue() {
	clear
	echo
	cat <<-PROLOGUE
	Shell Lesson #4: Directories

	In this lesson you will learn how to

	* Navigate directories
	* Create new directories
	* Remove empty directories
	* Forcibly remove directories without regard for their contents

	Let's get started!

	PROLOGUE

	_tutr_pressanykey
}


cleanup() {
	# [[ -d "$_BASE" ]] && rm -rf "$_BASE"
	echo "You worked on Lesson #4 for $(_tutr_pretty_time)"
}

epilogue() {
	cat <<-EPILOGUE
	Phew, that was a lot!  But you did marvelous.  If you ever need a
	refresher on this stuff you can run this tutorial again.

	In this lesson you have learned how to

	* Navigate directories
	* Create new directories
	* Remove empty directories
	* Forcibly remove directories without regard for their contents

	This concludes Shell Lesson #4

	EPILOGUE

	_tutr_pressanykey
}
 

cd_music_prologue() {
	cat <<-:
	There is a directory here named 'music' along with a file called
	'a_file'.  Use 'ls' to see for yourself.

	A directory is a collection of files and other directories.  You may be
	familiar with the concept of a 'folder' in a graphical file explorer;
	folders are exactly the same as directories.

	Directories are locations that your programs can be in.  When a program
	is "in" a directory it can access the files and directories there.

	Right now the shell you are running is in a directory.  You can change
	the directory with the 'cd' command.

	The syntax is
	  cd [DIRECTORY|-]

	where '|' means "or".  The above can be read "The 'cd' command may be
	run with no arguments or may be given the name of a directory or the
	argument '-'"

	Use the 'cd' command to enter the 'music' directory.
	:
}

cd_music_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE/music ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a music -d "'$_BASE'"
	fi
}

cd_music_hint() {
	_tutr_generic_hint $1 cd "$_BASE"

	cat <<-:

	Use the 'cd' command to enter the 'music' directory.
	:
}

cd_music_post() {
	_PREV=${_CMD[0]}
}


# cd into genre1
cd_genre1_prologue() {
	cat <<-:
	You are now in the directory 'music'.  Notice that your shell's prompt
	looks different now than before you ran '$_PREV'.

	This directory happens to be my illicit MP3 collection.  Don't worry
	about getting in trouble - I've cleverly disguised the identity of the
	files so the copyright holders won't be able to positively identify
	their intellectual property.

	A directory contained within another directory is called a
	'subdirectory'.  There is only one directory in a Unix system that is
	technically *not* a 'subdirectory' (more on that in a moment), so most
	of the time these two terms can be used interchangeably.

	If you run 'ls' again you will see some more subdirectories.

	Use the 'cd' command to enter the 'genre1' subdirectory.
	:
}

cd_genre1_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE/music/genre1 ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a genre1 -d "'$_BASE/music'"
	fi
}

cd_genre1_hint() {
	_tutr_generic_hint $1 cd "$_BASE/music"

	cat <<-:

	Use the 'cd' command to enter the 'genre1' subdirectory.
	:
}


# cd into artist0/album2
cd_artist0_album2_prologue() {
	cat <<-:
	You were able to enter this directory because the shell was *in* the
	directory named 'music' and 'genre1' was one of its subdirectories.
	'genre1' itself contains a few subdirectories, each of which contain
	more subdirectories, and so on.

	Considering subdirectories to be *children* makes the directory that
	contains them the *parent*.  The directory 'music' is the *parent*
	directory of 'genre1'.

	You can navigate the directory structure by traversing one directory at
	a time from parent to child.

	If you already know how deep you want to go you can give 'cd' multiple
	subdirectories at once by giving the names of related directories
	separated by front slash '/'.  A "front slash" is the slash that shares
	a key with question mark '?'.

	For example 'artist0/album2' is a *grandchild* directory of 'genre1'.

	Use a single 'cd' command to directly enter the 'artist0/album2'
	subdirectory. 
	:
}

cd_artist0_album2_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE/music/genre1/artist0 ]]; then return 99
	elif [[ $PWD = $_BASE/music/genre1/artist0/album2 ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a artist0/album2 -d "'$_BASE/music/genre1'"
	fi
}

cd_artist0_album2_hint() {
	case $1 in
		99)
			cat <<-:
			You're halfway there.
			Now go into the directory 'album2'.
			:
			;;
		*)
			_tutr_generic_hint $1 cd "$_BASE/music/genre1"

			cat <<-:

			Use the 'cd' command to enter the 'artist0/album2' subdirectory.
			  cd artist0/album2
			:
			;;
	esac
}


# TODO: detect whether their prompt actually displays the CWD
# zsh: %d, %/, %~
# bash: \w, \W
cd_artist0_album2_epilogue() {
	cat <<-:
	You will have noticed that your shell's prompt has been changing as you
	move between the directories.  This is to remind you of your current
	location.

	The directory that a program is running in is called its "Current
	Working Directory" (CWD for short).

	:
	_tutr_pressanykey
}



cd_dot_dot0_prologue() {
	cat <<-:
	Once you've gone into a subdirectory, how do you go back out of it?

	No matter what your CWD is, the parent directory is always called '..'.
	In other words, you can always return to the parent directory with
	  cd ..

	Run 'cd ..' to return to 'album2's parent directory 'artist0'.
	:
}

cd_dot_dot0_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE/music/genre1/artist0 ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a .. -d "'$_BASE/music/genre1/artist0/album2'"
	fi
}

cd_dot_dot0_hint() {
	_tutr_generic_hint $1 cd "$_BASE/music/genre1/artist0/album2"

	cat <<-:

	Run 'cd ..' to return to the parent directory.
	You should end up in the directory named 'artist0'
	:
}


# cd .. to go up to genre1
cd_dot_dot1_prologue() {
	cat <<-:
	Do that again to return to 'genre1'.
	:
}

cd_dot_dot1_test() {
	if   [[ $PWD = $_BASE/music/genre1 ]]; then return 0
	elif [[ ${_CMD[0]} = 'ls' || ${_CMD[0]} = 'dir' ]]; then return $PASS
	else _tutr_generic_test -c cd -l 1 -a .. -d "'$_BASE/music/genre1/artist0'"
	fi
}

cd_dot_dot1_hint() {
	_tutr_generic_hint $1 cd "$_BASE/music/genre1/artist0"

	cat <<-:

	Use 'cd ..' to return to this directory's parent named 'genre1'.
	:
}


# cd ../.. to go up two, back to $_BASE
cd_dot_dot2_prologue() {
	cat <<-:
	Moving one directory at a time is tedious.

	As before, you can give 'cd' multiple directories in one command by
	separating them with '/'; the directory name '..' is no exception.

	Leave 'music' entirely and return to the 'lesson4' directory.  You can
	do this in a single 'cd' command by joining two '..' with '/':
	  cd ../..
	:
}

cd_dot_dot2_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE/music ]]; then return 99
	elif [[ $PWD = $_BASE ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a ../.. -d "'$_BASE/music/genre1'"
	fi
}

cd_dot_dot2_hint() {
	case $1 in
		99)
			cat <<-:
			Just about there.
			Go up by one more parent directory:
			  cd ..
			:
			;;
		*)
			_tutr_generic_hint $1 cd_dot_dot2 "$_BASE/music/genre1"
			cat <<-:

			Use a single 'cd' command to leave the 'music' directory and go back to
			'lesson4'.  Join two '..' together with a front slash '/', like this:
			  cd ../..
			:
			;;
	esac
}


# cd to go home
cd_home_prologue() {
	cat <<-:
	There are two special directories that you should be acquainted with.

	The first is your HOME directory.  Every user on a Unix system has its
	own HOME directory.  A user's HOME directory is usually named with your
	username and is a subdirectory of '/home'.  Whenever you open a new
	shell you usually start in your HOME directory.

	The 'cd' command has a convenient short cut that takes you directly
	HOME.  When 'cd' is run with ZERO arguments you are instantly returned
	HOME.

	Run 'cd' with no arguments to go right to your home directory.
	:
}

cd_home_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $HOME ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -d "'$_BASE'"
	fi
}

cd_home_hint() {
	_tutr_generic_hint $1 cd "$_BASE"

	cat <<-:

	Run 'cd' with no arguments to directly go HOME.
	:
}


# cd - to go back to previous dir
cd_minus0_prologue() {
	cat <<-:
	Less typing is fun, right?

	Now what if you want to go back where you came from?  You could type out
	the entire set of directory names separated by slashes.  They're right
	there in your old prompt.  It is easy enough to copy & paste them into a
	new command.

	Easier still is to run 'cd' with the '-' (minus) argument.  'cd -' takes
	you BACK to your previous directory, no matter how long its name.  It's
	like the "Back" button in your web browser.

	Try it now.  Use 'cd -' to return to this lesson's directory.
	:
}

cd_minus0_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a - -d "'$_BASE'"
	fi
}

cd_minus0_hint() {
	_tutr_generic_hint $1 cd "$_BASE"

	cat <<-:
	If you've accidentally changed to another directory 'cd -' won't take
	you back to the lesson's directory.  Try running this command:

	'cd $_BASE'
	:
}


# cd / to goto root
cd_root_prologue() {
	cat <<-:
	The last special directory you should know about is the "root"
	directory.  The name of the root directory is a single slash '/'.

	'/' is the ultimate parent of every directory on a Unix system.  The
	root directory the only directory on a Unix system that has no parent
	directory (actually, the root directory is its own parent!)  If you run
	'cd ..' in the root directory you end up in the same place.

	Go to the root directory '/'.
	:
}

cd_root_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = / ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a / -d "'$_BASE'"
	fi
}

cd_root_hint() {
	_tutr_generic_hint $1 cd "$_BASE"

	cat <<-:

	The name of the root directory is a single front slash '/'.
	This command will take you to the root directory:
	  cd /
	:
}

cd_root_epilogue() {
	cat <<-:
	The root directory gets its name by analogy.  If you consider the
	hierarchy of subdirectories to be a tree, then the root directory is at
	the bottom.
	:

	if [[ -d /root ]]; then
		cat <<-:

		If you run 'ls' from here you will see a directory down here named
		"root".  This directory is NOT the same thing as the *root*
		directory '/'.  "root" is actually the home directory for a user
		account named "root".

		"root" is the name of the administrator account on every Unix
		system.  The root user is all-powerful and has permission to do
		anything in the operating system.

		Root user, root directory... yeah, this is kinda confusing.
		:
	fi


	cat <<-:

	Feel free to look around while you are down here.  
	Then use 'cd -' to return to the lesson directory.

	:
	_tutr_pressanykey
}


# cd - get back to lesson
cd_minus1_prologue() {
	cat <<-':'
	Use 'cd -' to get back to the lesson directory.

	If you've used 'cd' to go into other directories then 'cd -' won't take
	you where you need to go.  In that case you can run this command to get
	back:
	  cd $_BASE
	:
}

cd_minus1_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a - -d /
	fi
}

cd_minus1_hint() {
	_tutr_generic_hint $1 cd /

	echo
	cd_minus1_prologue
}


cd_file_pre() {
	! [[ -f $_BASE/a_file ]] && touch $_BASE/a_file
}

cd_file_prologue() {
	cat <<-:
	Now it's time to see some error messages.  Yay!!!

	What happens if you give the 'cd' command an argument that is not a
	directory?

	There is a file here called 'a_file'.  Try to 'cd' into this file to see
	what happens.
	:
}

cd_file_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ ( ${_CMD[0]} = cd || ${_CMD[0]} = pushd || ${_CMD[0]} = popd ) && $PWD = $_BASE && $_RES != 0 ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a a_file -d "'$_BASE'"
	fi
}

cd_file_hint() {
	_tutr_generic_hint $1 cd "$_BASE"

	cat <<-:

	Run
	  cd a_file
	to see what happens.
	:
}

cd_file_epilogue() {
	cat <<-:
	That wasn't so bad, was it?

	:
	_tutr_pressanykey
}

cd_file_post() {
	_RES=0
}


# cd not_a_dir # fails
cd_not_a_dir_pre() {
	[[ -d $_BASE/not_a_dir ]] && rm -rf $_BASE/not_a_dir 
}

cd_not_a_dir_prologue() {
	cat <<-:
	There is one last thing to try with the 'cd' command: what if you try to
	'cd' into a directory that does not exist?

	There is no directory here called 'not_a_dir' (I made sure).

	Try to use 'cd' to enter a directory by that name to see what happens.
	:
}

cd_not_a_dir_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE && $_RES != 0 ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a not_a_dir -d "'$_BASE'"
	fi
}

cd_not_a_dir_hint() {
	_tutr_generic_hint $1 cd "$_BASE"

	cat <<-:

	Try to to enter this non-existent directory to see what happens:
	  cd not_a_dir
	:
}

cd_not_a_dir_epilogue() {
	_tutr_pressanykey
	cat <<-:

	Now that you've seen all of these errors you're a real 'cd' expert!

	:
	_tutr_pressanykey
}

 
# mkdir alpha
mkdir_alpha_prologue() {
	cat <<-:
	You can make your own directories with the 'mkdir' command.

	  mkdir [-p] DIRECTORY...

	The ellipsis (...) means that you can create more than one directory in
	a single command.  Each directory is created in the shell's CWD (current
	working directory).

	Example: create a subdirectory of your current directory named 'alpha'
	  mkdir alpha

	Example: create three subdirectories 'beta', 'gamma', 'delta'
	  mkdir beta gamma delta

	Use 'mkdir' to create a directory called 'alpha'.
	:
}

mkdir_alpha_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ -d $_BASE/alpha ]]; then return 0
	else _tutr_generic_test -c mkdir -a alpha -l 2 -d "'$_BASE'"
	fi
}

mkdir_alpha_hint() {
	_tutr_generic_hint $1 mkdir "$_BASE"
	cat <<-:

	Use 'mkdir' to create a directory called 'alpha'.
	:
}


# cd alpha
cd_alpha_prologue() {
	cat <<-:
	Now 'cd' to move into the new directory 'alpha'
	:
}

cd_alpha_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE/alpha ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a alpha -d "'$_BASE'"
	fi
}

cd_alpha_hint() {
	_tutr_generic_hint $1 cd "$_BASE"
	cat <<-:

	'cd' into your new directory 'alpha'
	:
}


# mkdir beta/gamma #fails
mkdir_beta_gamma_prologue() {
	cat <<-:
	When you need to build a nested directory structure creating directories
	one-at-a-time is tedious and slow.  Just as you can give the 'cd'
	command multiple nested directories in one command with '/' so to can
	you create them this way.

	The only catch is that, in this case, you must also give 'mkdir' the
	'-p' option.  You can read the manual page for 'mkdir' to learn what
	this option stands for.

	Create the nested directories 'beta/gamma' from here.
	:
}

mkdir_beta_gamma_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ -d $_BASE/alpha/beta/gamma ]]; then return 0
	elif [[ ${_CMD[@]} == "mkdir beta/gamma" && $_RES != 0 ]]; then return 99
	else _tutr_generic_test -c mkdir -a -p -a beta/gamma -l 2 -d "'$_BASE/alpha'"
	fi
}

mkdir_beta_gamma_hint() {
	case $1 in
		99)
			cat <<-:
			It looks like you forgot the '-p' option!
			:
			;;
		*)
			_tutr_generic_hint $1 mkdir "$_BASE/alpha"
			;;
	esac

	cat <<-:

	Use 'mkdir' to create the directories 'beta/gamma'.
	Remember to use the '-p' option.
	:
}

 
# cd beta
cd_beta_prologue() {
	cat <<-:
	Enter the 'beta' directory.
	:
}

cd_beta_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE/alpha/beta ]]; then return 0
	else _tutr_generic_test -c cd -l 1 -a beta -d "'$_BASE/alpha'"
	fi
}

cd_beta_hint() {
	_tutr_generic_hint $1 cd "$_BASE/alpha"
	cat <<-:

	Enter the 'beta' directory
	:
}

 
# rmdir gamma
rmdir_gamma_prologue() {
	cat <<-:
	The command 'rmdir' removes directories.  

	  rmdir DIRECTORY...

	Before a directory can be removed with 'rmdir' it must be empty.  You
	may first need to use 'rm' to remove files from a directory before using
	'rmdir' on it.

	The directory 'gamma' that you just barely created is empty.
	Remove it with 'rmdir'
	:
}

rmdir_gamma_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ ! -d $_BASE/alpha/beta/gamma ]]; then return 0
	else _tutr_generic_test -c rmdir -a gamma -l 2 -d "'$_BASE/alpha/beta'"
	fi
}

rmdir_gamma_hint() {
	_tutr_generic_hint $1 rmdir "$_BASE/alpha/beta"
	cat <<-:

	Remove the directory 'gamma' with the 'rmdir' command:
	  rmdir gamma
	:
}


# cd ../..
cd_dot_dot3_prologue() {
	cat <<-:
	Return to the $(basename $_BASE) directory by going up two directories.
	:
}

cd_dot_dot3_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_BASE ]]; then return 0
	elif [[ $PWD = $_BASE/alpha ]]; then return 99
	else _tutr_generic_test -c cd -l 1 -a ../.. -d "'$_BASE'"
	fi
}

cd_dot_dot3_hint() {
	case $1 in
		99)
			cat <<-:
			Almost there!  Go up one more directory.
			:
			;;
		*)
			_tutr_generic_hint $1 cd "$_BASE/alpha/beta"
			cat <<-:

			Return to the $(basename $_BASE) directory by going up two directories.
			Recall that '..' refers to the parent directory, and that multiple '..'
			can be separated with '/'.
			:
			;;
	esac
}

 
# rmdir alpha # fails
rmdir_alpha_prologue() {
	cat <<-:
	'alpha' contains a subdirectory 'beta', and is therefore not empty.
	What do you think will happen if you try to 'rmdir alpha'?

	Try it to see what happens.
	:
}

rmdir_alpha_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ ${_CMD[@]} == "rmdir alpha" && $_RES != 0 ]]; then return 0
	elif [[ ${_CMD[@]} == "rmdir alpha" && $_RES == 0 ]]; then return 99
	else _tutr_generic_test -c rmdir -a alpha -l 2 -d "'$_BASE'"
	fi
}

rmdir_alpha_hint() {
	case $1 in
		99)
			cat <<-:
			I can't believe that worked!
			Contact erik.falor@usu.edu and report this strange occurrence.
			:
			;;
		*)
			_tutr_generic_hint $1 rmdir "$_BASE"
			;;
	esac
	cat <<-:

	Use 'rmdir' on the non-empty directory 'alpha'.
	It won't work, but that's okay.
	:
}

rmdir_alpha_epilogue() {
	_tutr_pressanykey
	cat <<-:

	Are you carefully reading each error message that you see?

	The reason I ask you to cause these errors is so that you aren't
	surprised by them later.  I want you to feel confident and in-charge no
	matter what your computer tells you.  Believe it or not, error messages
	are there to help you.  In time you will come to understand what they
	are trying to say.

	:
	_tutr_pressanykey
}


# rm alpha doesn't work on dirs
man_rm0_prologue() {
	cat <<-:
	If you are really determined to get rid of 'alpha' you might manually go
	into each of its subdirectories and remove every file you see.  Then go
	into each subdirectory and delete all the files you find in there, etc.
	When there are no files left you could 'cd ..' and 'rmdir' the now-empty
	subdirectory.  You can repeat this until all unwanted directories are
	gone.

	But that's a lot of tedious work.  Avoiding lots of tedious work is the
	whole point of computers.

	If 'rmdir' isn't up to the task you must find a command that is.
	It turns out that 'rm' is just the thing you're looking for.

	Ordinarily 'rm' does not remove directories (try it: 'rm alpha').  But
	you can tell 'rm' to automatically enter every subdirectory and delete
	every file it sees as it goes.  As it encounters more subdirectories
	'rm' will enter them, deleting every file it sees as it goes until the
	job is done.

	This pattern of "do something again and again until it's done" is called
	"recursion".

	Read the manual page for 'rm' and look for an option that makes 'rm'
	operate recursively.
	:
}

man_rm0_test() {
	_tutr_generic_test -c man -a rm -l 1 -d "'$_BASE'"
}

man_rm0_hint() {
	_tutr_generic_hint $1 man "$_BASE"

	cat <<-:
	Read the manual page for 'rm' and look for an option that tells it to
	operate recursively.
	:
}



# rm -r alpha # asks loads of questions
rm_r_alpha_prologue() {
	cat <<-:
	Did you find what you were looking for in the manual for 'rm'?

	If you think you got it, try it now.  Your goal is to remove the
	directory 'alpha' along with ALL of its contents.
	:
}

rm_r_alpha_test() {
	if   _tutr_nonce man; then return $PASS
	elif ! [[ -d $_BASE/alpha ]]; then return 0
	else _tutr_generic_test -c rm -a -r -l 1 -d "'$_BASE'"
	fi
}

rm_r_alpha_hint() {
	_tutr_generic_hint $1 rm "$_BASE"

	cat <<-:
	Take another look at the manual page for 'rm'.  You are searching for
	the option that tells 'rm' to remove directories and their contents
	recursively.
	:
}

rm_r_alpha_epilogue() {
	_tutr_pressanykey
	cat <<-:

	The only trouble with 'rm -r' is that it asks A LOT of questions!
	It's not entirely a bad thing to get confirmation before permanently
	deleting files, but you can have too much of a good thing.

	:
	_tutr_pressanykey
}
 


# rm -rf music a_file  # one shot, one kill
rm_rf_music_prologue() {
	cat <<-:
	There are 39 directories and 81 (fake) MP3s under the directory 'music'.
	I'm going to ask you to delete all of them, but I am NOT going to ask
	you to press 'Y' 120 times.  That would be a lot of tedious work!

	What I want to teach you here is the awesome destructive power of
	automation.  Be careful with this next command!  With the snap of your
	fingers all files that stand in your way will cease to exist.  Always
	remember that "with great power comes great responsibility", "I love you
	3000", etc.

	When rm's '-f' option is combined with '-r' ALL prompts are suppressed.
	All files encountered are removed, no questions asked.  Do NOT use 'rm
	-rf' lightly!

	The syntax is
	  rm [-r] [-f] FILE_OR_DIRECTORY...

	The order that the '-r' and '-f' options appear doesn't matter; 'rm -f
	-r' and 'rm -r -f' are equal.  These short options can even be squished
	together: 'rm -fr' and 'rm -rf' do the same thing.

	Don't you think it's time to remove the evidence of my music piracy from
	your computer?  Use 'rm -rf' on the music directory and cover your
	tracks.
	:
}

rm_rf_music_test() {
	if   _tutr_nonce; then return $PASS
	elif ! [[ -d $_BASE/music ]]; then return 0
	elif   [[ $PWD != "$_BASE" ]]; then return $WRONG_PWD
	elif   [[ ${_CMD[@]} = 'rm -rf' ]]; then return $TOO_FEW_ARGS
	elif   [[ ${_CMD[@]} = 'rm -fr' ]]; then return $TOO_FEW_ARGS
	elif   [[ ${_CMD[@]} = 'rm -r -f' ]]; then return $TOO_FEW_ARGS
	elif   [[ ${_CMD[@]} = 'rm -f -r' ]]; then return $TOO_FEW_ARGS
	elif   [[ ${_CMD[@]} = 'rm -r' ]]; then return $TOO_FEW_ARGS
	elif   [[ ${_CMD[@]} = 'rm -f' ]]; then return $TOO_FEW_ARGS
	elif   [[ ${_CMD[@]} = rm ]]; then return $TOO_FEW_ARGS
	elif   [[ ${_CMD[0]} = rmdir ]]; then return 96
	elif   [[ ${_CMD[0]} != rm ]]; then return $WRONG_CMD
	elif   [[ ${_CMD[-1]} = '.' ]]; then return 99
	elif   [[ ${_CMD[-1]} = 'a_file' ]]; then return 98
	elif   [[ ${_CMD[-1]} != 'music' ]]; then return 97
	fi
}

rm_rf_music_hint() {
	case $1 in
		99)
			cat <<-:
			I don't think that command does what you think it does.
			:
			;;

		98)
			cat <<-:
			Hey!  What did 'a_file' ever do to you?
			:
			;;
		97)
			cat <<-:
			That's not the directory I asked you to remove.
			:
			;;
		96)
			cat <<-:
			'rmdir' is close, but not quite the command you need to run.
			:
			;;
		*)
			_tutr_generic_hint $1 rm "$_BASE"
			;;
	esac

	cat <<-:

	Recursively remove the 'music' directory to erase every trace of my
	pirated files:
	  rm -rf music
	:
}

rm_rf_music_epilogue() {

	if   [[ ${_CMD[${#_CMD[@]}]} = '*' ]]; then
		cat <<-:
		You are playing with fire!

		Be VERY careful when mixing 'rm' with '*'!

		:
		_tutr_pressanykey
	fi

	cat <<-:
	SNAP!

	And just like that, they're all gone.  Not even a puff of dust remains.

	:
	_tutr_pressanykey
}



source _tutr/main.sh && _tutr_begin \
	cd_music \
	cd_genre1 \
	cd_artist0_album2 \
	cd_dot_dot0 \
	cd_dot_dot1 \
	cd_dot_dot2 \
	cd_home \
	cd_minus0 \
	cd_root \
	cd_minus1 \
	cd_file \
	cd_not_a_dir \
	mkdir_alpha \
	cd_alpha \
	mkdir_beta_gamma \
	cd_beta \
	rmdir_gamma \
	cd_dot_dot3 \
	rmdir_alpha \
	man_rm0 \
	rm_r_alpha \
	rm_rf_music



# vim: set filetype=sh noexpandtab tabstop=4 shiftwidth=4 textwidth=76 colorcolumn=76:
