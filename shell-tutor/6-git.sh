# Lesson #6
# TODO: detect old versions of git that predate the 'restore' command
#       It was added in 2.23.0
#       https://public-inbox.org/git/xmqqy2zszuz7.fsf@gitster-ct.c.googlers.com/
#       https://github.blog/2019-08-16-highlights-from-git-2-23/


if [[ -n $_TUTR ]]; then
	source _tutr/generic_error.sh
	source _tutr/nonce.sh
fi

README_HSH="7c9e5c72eacd38fcdfb4252bef84b6d649bc4b5a"
# Git commit ID as given by `git rev-parse --short HEAD`
STARTER="c92dea7"


repo_warning() {
	cat <<-:
	The git repository 'cs1440-falor-erik-assn0' already exists in the
	parent directory.  Part of this lesson involves setting up that
	repository, and so it must not exist before beginning.

	If you have already begun Assignment #0 you may not wish to delete your
	work.  In that case, it's probably best to not re-run this lesson.

	If you are okay starting over, you can simply use 'rm -rf' to delete the
	directory 'cs1440-falor-erik-assn0' and everything in it.  From here you
	can run this command:
	  rm -rf ../cs1440-falor-erik-assn0

	If you are just looking for a quick git refresher, please read
	https://gitlab.cs.usu.edu/erik.falor/fa20-cs1440-lecturenotes/-/blob/master/Using_Git/Repository_Setup.md#steps-to-take-on-the-gitlab-website
	:
}

cleanup() {
	echo "You worked on Lesson #6 for $(_tutr_pretty_time)"
}

setup() {
	$SHELL _tutr/screen_size.sh 30 80

	export _BASE=$PWD
	# Because I can't count on GNU Coreutils realpath(1) or readlink(1) on
	# all systems
	export _PARENT=$(cd .. && pwd)
	export _REPO=$_PARENT/cs1440-falor-erik-assn0

	# See if the starter code repo already exists
	if [[ -d "$_REPO/.git" ]]; then
		_tutr_err repo_warning
		return 1
	fi

	# figure out how to run shasum - it needs either the -U or -p flags
	# depending upon its version

    if [[ -n $ZSH_NAME ]]; then
		export _SH=Zsh
	else
		export _SH=Bash
	fi
}

prologue() {
	clear
	cat <<-PROLOGUE

	Shell Lesson #6: The Git Version Control System

	In this lesson you will learn how to

	* Prepare git on your computer
	* Ask git for help about its commands
	* Clone a git repository onto your computer
	* Check the status of your repository
	* Change a file and commit it to the repository
	* View the git log
	* Submit your homework to GitLab

	Let's get started!

	PROLOGUE

	_tutr_pressanykey
}


epilogue() {
	cat <<-EPILOGUE

	In this lesson you have learned how to

	* Prepare git on your computer
	* Ask git for help about its commands
	* Clone a git repository onto your computer
	* Check the status of your repository
	* Change a file and commit it to the repository
	* View the git log
	* Submit your homework to GitLab

	That was the last lesson!  w00t!

	You have joined the ranks of the 1337 Unix h4X0rZ!  Congratulations!
	Now don't go and do something that makes the NSA pay attention to you.

	EPILOGUE

	_tutr_pressanykey
}


# 0. practice getting help
git_help_prologue() {
	cat <<-:
	Git is a system of programs that manage a REPOSITORY of source code.
	To keep things simple everything that you do starts with the 'git'
	command.

	The first argument to the 'git' command is the name of a "subcommand".
	After the subcommand you may give other arguments to complete the
	command.

	To get started with git you will learn ten git subcommands.  After you
	are comfortable with these I will add a few more subcommands to your
	repetoire.

	The most important subcommand is 'help'.  Whenever you are unsure about
	the form of a git subcommand you can use 'git help SUBCOMMAND' to read
	its manual page.

	Let's begin your git training by reading the manual for the 'git help'
	subcommand itself.

	  git help help
	:

	if [[ $OS = Windows_NT ]]; then
		cat <<-:

		This command may open git's 'help' page in your browser instead of
		the console.
		:
	fi
}

git_help_test() {
	_tutr_generic_test -c git -a help -a help -l 1 -d "'$_BASE'"
}

git_help_hint() {
	_tutr_generic_hint $1 git "$_BASE"

	cat <<-:

	Read the help for git's 'help' subcommand:
	  git help help
	:
	if [[ $OS = Windows_NT ]]; then
		cat <<-:

		This command may open git's 'help' page in your browser instead of
		the console.
		:
	fi
}

git_help_epilogue() {
	cat <<-:
	Git subcommand 1/10: 'help'

	You can also run 'git help' without another subcommand to view a brief
	listing of possible git commands that you can run.  It's a handy reference
	for when you get stuck.

	Now let's begin in earnest!

	:
	_tutr_pressanykey
}


# 1.  Launch a command shell and use the `git config` command to set up your
# 	  user name and email address.
git_config_prologue() {
	cat <<-:
	Use the 'git config' command to set up your name and email address.
	Git needs to know who you are so that when you make commits it can
	record who was responsible.

	The command to set your user name is like this:
      git config --global user.name  "Danny Boy"

	And the command for your email goes like:
      git config --global user.email "danny.boy@houseofpain.com"

	Of course, use your own name and email address.
	:
}

git_config_test() {
	git config --get user.name >/dev/null
	_HAS_NAME=$?
	git config --get user.email >/dev/null
	_HAS_EMAIL=$?

	if   [[ ${_CMD[0]} = git && ${_CMD[1]} = config && ${_CMD[@]} != *--global* ]]; then return 97
	elif (( $_HAS_NAME == 0 && $_HAS_EMAIL == 0 )); then return 0
	elif (( $_HAS_NAME == 0 )); then return 99
	elif (( $_HAS_EMAIL == 0 )); then return 98
	elif [[ ${_CMD[0]} = git && ${_CMD[1]} = config ]]; then return 96
	else _tutr_generic_test -c git -a config -l 1 -d "'$_BASE'"
	fi
}

git_config_hint() {
	case $1 in
		99)
			cat <<-:
			Good!  Now set your email address under the 'user.email' setting.
			:
			;;

		98)
			cat <<-:
			Almost there!  Now configure your name in the 'user.name' setting.
			:
			;;

		97)
			cat <<-:
			The '--global' option to the 'git config' command is important
			because it records that setting across your entire computer.

			Without it, you'll need to run 'git config' every time you
			create a new git repository.  And that's just a lot of
			unnecessary work.

			Try that command again, but add '--global' right after
			'git config' and before the name of the setting.
			:
			;;

		96)
			cat <<-:
			The commands you must use look like this:
			  git config --global user.name  "Danny Boy"
			  git config --global user.email "danny.boy@houseofpain.com"

			Of course, you should use your own name and email address.
			:
			;;

		*)
			_tutr_generic_hint $1 git_config "$_BASE"
			;;
	esac
}

git_config_epilogue() {
	cat <<-:
	Git subcommand 2/10: 'config'

	Because you gave 'git config' the '--global' option you will not need to
	perform this step in the future.  From now on, 'git' on this computer
	knows who you are.

	If you made a typo when entering your name and email, or want to change
	them, you may do so at any time.  You'll just use these same commands
	again.

	If you install git on another computer, it will remind you to perform
	this set up routine when you try to use git.

	:
	_tutr_pressanykey
}


# 2. see if we're presently within a git repo
git_status0_prologue() {
	cat <<-:
	One of the most important aspects of git is that it facilitates sharing
	your project with other programmers.  Git has been called the "social
	network for code".

	There are three key concepts related to sharing projects:

	*   A directory containing all files that make up your project that is
	    managed by git is called a "repository" (or "repo" for short)
	*   "cloning" downloads a git repository onto your computer
	*   "pushing" uploads your repository to another computer

	Before you clone a repository it is wise to ensure that your shell's CWD
	is NOT already inside a git repository.  It quickly becomes a confusing
	mess when one git repository is nested within another.

	The 'git status' subcommand reports information about repositories.
	When this command succeeds it means that your shell's CWD is in a
	repository.  When this command fails it typically means that your are
	NOT presently in a repository.

	Run 'git status' to see which is the case for you.
	:
}

git_status0_test() {
	_tutr_generic_test -c git -a status -l 1 -d "'$_BASE'"
}

git_status0_hint() {
	_tutr_generic_hint $1 git "$_BASE"
}

git_status0_epilogue() {

	if (( $_RES == 0 )); then
		cat <<-:
		This message indicates that you are presently in a repository.

		:
	else
		cat <<-:
		Huh, it looks like you're not in a repository right now.
		That's unexpected, but not a problem.

		:
	fi

	cat <<-:
	Git subcommand 3/10: 'status'

	:
	_tutr_pressanykey
}


# 3. cd .. to escape this git repository
cd_dotdot0_prologue() {
	echo Go up and out of this directory.
}

cd_dotdot0_test() {
	if   [[ $PWD = $_PARENT ]]; then return 0
	else _tutr_generic_test -c cd -a .. -l 1 -d "'$_PARENT'"
	fi
}

cd_dotdot0_hint() {
	_tutr_generic_hint $1 cd "$_PARENT"

	cat <<-:

	Run 'cd ..' to leave this directory for its parent.
	:
}


# 4.  Ensure that you're not presently within a git repository by running `git status`.
git_status1_prologue() {
	cat <<-:
	You are now in the parent directory of the shell tutorial repository.
	But what if this directory is also a git repository?  You had better run
	'git status' to find out.

	When 'git status' is used outside of a repository it reports a "fatal"
	error.  Usually one wishes to avoid "fatal" errors, but in this case
	an error message is good news.
	:
}

git_status1_test() {
	_tutr_generic_test -c git -a status -l 1 -d "'$_PARENT'"
}

git_status1_hint() {
	_tutr_generic_hint $1 git "$_PARENT"

	cat <<-:

	Run 'git status' to find out if you are still inside a repository.
	:
}

git_status1_epilogue() {
	_tutr_pressanykey
	if (( $_RES == 0 )); then
		cat <<-:

		Hmm, you're still inside a repo here?
		It might cause you trouble if you proceed.

		Please concact erik.falor@usu.edu for help.
		:
	else
		cat <<-:

		This is exactly what you want to see when you DON'T want to be in a
		repository.
		:
	fi

	cat <<-:

	It never hurts to run 'git status'.
	You really can't use it too much! 

	:
	_tutr_pressanykey
}


# 5.  Clone the git repository containing the starter code from GitLab onto
# 	your computer using the `git clone` command.
git_clone_prologue() {
	cat <<-:
	Now you will clone the starter code for Assignment #0.  Cloning a repo
	makes a new directory on your computer into which the repo's information
	is downloaded.

	The syntax of this command is

	  git clone URL [directory]

	URL is the location of another git repo known as the "remote".  Most
	often the remote repo is out on the internet, but it can also be another
	repo on your computer.  When a remote repo is cloned  from the web the
	URL argument begins with 'https://' or 'git@'.

	If you leave off the optional 'directory' argument git chooses the name
	of the new directory for you.

	Use 'git clone' to clone the remote repo at the URL
	  https://gitlab.cs.usu.edu/erik.falor/cs1440-falor-erik-assn0

	Leave off the optional 'directory' argument for now; you can rename the
	repo after this tutorial.
	:
}

git_clone_test() {
	_tutr_generic_test -c git -a clone -a https://gitlab.cs.usu.edu/erik.falor/cs1440-falor-erik-assn0 -l 1 -d "'$_PARENT'"
}

git_clone_hint() {
	_tutr_generic_hint $1 git "$_PARENT"

	cat <<-:

	To clone this repo run
	  git clone https://gitlab.cs.usu.edu/erik.falor/cs1440-falor-erik-assn0
	:
}

git_clone_epilogue() {
	if [[ $_RES -eq 0 ]]; then
		cat <<-:
		All of that is normal output for the 'clone' subcommand.
		Especially that last bit about "Unpacking objects".

		Git subcommand 4/10: 'clone'

		:
		_tutr_pressanykey
	else
		cat <<-:
		Hmm... something went wrong while cloning that repository.

		Copy the text of the terminal and prepare a bug report for Erik.
		:
	fi
}

git_clone_post() {
	if [[ $_RES -ne 0 ]]; then
		_tutr_die "Then send it to erik.falor@usu.edu."
	fi
}



# 6.  Enter the newly cloned repository
cd_into_repo_prologue() {
	cat <<-:
	'git clone' created a new directory called 'cs1440-falor-erik-assn0' and
	populated it with files from the internet.

	This directory is a new git repository.
	Why not 'cd' inside and take a look around?
	:

}

cd_into_repo_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_REPO ]]; then return 0
	else _tutr_generic_test -c cd -a cs1440-falor-erik-assn0 -l 1 -d "'$_PARENT'"
	fi
}

cd_into_repo_hint() {
	_tutr_generic_hint $1 cd "$_PARENT"

	cat <<-:
	Enter the new repo with the 'cd' command
	  cd cs1440-falor-erik-assn0
	:
}


# 7. See what a clean, newly cloned repo looks like with 'git status'
git_status2_prologue() {
	cat <<-:
	You can see what files and directories are here with 'ls'.  After the
	last lesson the layout of this repository should be familiar.

	Now that you're back inside of a git repository you can run 'git status'
	again to see what state the repository is in.  Since you just barely
	cloned it down from the internet, this repo should be in a clean state.

	Run 'git status' to proceed.
	:
}

git_status2_test() {
	if   _tutr_nonce; then return $PASS
	else _tutr_generic_test -c git -a status -l 1 -d "'$_REPO'"
	fi
}

git_status2_hint() {
	_tutr_generic_hint $1 git "$_REPO"

	cat <<-:

	Run 'git status' to proceed.
	:
}

git_status2_epilogue() {
	cat <<-:
	This is what a clean repository looks like.  By "clean" I mean that
	there is no difference between the code in this local repo and the code
	stored in the remote repo.

	Let me explain what this message is telling you.

	"On branch master"
	  This message reminds you that you are working on the 'master' (A.K.A.
	  default) branch.  For the time being all of your work will be on this
	  branch.  You'll learn more about branches later in the semester.

	"Your branch is up to date with 'origin/master'."
	  The code in the 'master' branch is the same as the code on the remote
	  repo's 'master' branch.  Git doesn't automatically go out to the
	  internet to check, though; this information was up-to-date as of your
	  last 'git clone' command.

	"nothing to commit, working tree clean"
	  'Working tree' refers to the source code files in this repo.  Since
	  you have not changed anything, they are exactly as git remembers them.

	:
	_tutr_pressanykey
}


# The next step also wants the user to run 'git status'
edit_readme0_pre() {
	_CMD=()
}

# 8.  Open "README.md" in an editor and change the file in some way.
#     Return to your command shell ask git about the status of your repository.
edit_readme0_prologue() {
	cat <<-:
	Git is much more than just a slick way to download code from the 'net.

	The thing you will do the most with git is take snapshots (A.K.A.
	"commits") of your project while you work.  Commits record your project
	at various points in time.  When you make a mistake or paint yourself
	into a corner you can turn the project back to an earlier commit and try
	again.  Git is the ultimate "Undo" that transcends all other tools.

	To make a commit you first need to change something in the repository.
	There is a file here called 'README.md'.  Open this file in Nano, make a
	change and save it.  Git can tell that you changed the file.  Run
	'git status' after changing this file to see what git says about it.

	It really doesn't matter what you do to 'README.md'; you can even
	remove the whole file.  Knock yourself out!
	:
}

edit_readme0_test() {
	if   [[ $PWD != $_REPO ]]; then return $WRONG_PWD
	elif [[ ${_CMD[0]} != git && ! -f "$_REPO/README.md" ]]; then return 98
	elif [[ -f "$_REPO/README.md" && $(git hash-object "$_REPO/README.md") = $README_HSH ]]; then return 99
	elif [[ ${_CMD[0]} = nano || ${_CMD[0]} = *vim || ${_CMD[0]} = vi || ${_CMD[0]} = emacs ]]; then return 98
	else _tutr_generic_test -c git -a status -l 1
	fi
}

edit_readme0_hint() {
	case $1 in
		99)
			cat <<-:
			You won't see anything interesting until you change 'README.md'.

			Go ahead and open it in 'nano' and make a mess of it.  You can't
			really hurt anything here!
			:
			;;

		98)
			cat <<-:
			Nice!

			Now see what 'git status' has to say about your handiwork.
			:
			;;

		*)
			_tutr_generic_hint $1 git "$_REPO"
			cat <<-:

			Open 'README.md' in Nano, change it, and save it.
			Then run 'git status' to see what git says about your change.
			:
			;;
	esac
}

edit_readme0_epilogue() {
	_tutr_pressanykey

	cat <<-:

	You will see this message a lot, so you had better know what it means.

	"On branch master"
	  You are still on the master branch.

	"Your branch is up to date with 'origin/master'"
	  This repo's master branch is not different from the master branch on
	  the remote repo' named "origin".  The "origin" repo is the one you
	  cloned from.

	"Changes not staged for commit"
	  This is where git lists what files have changed.  Git knows when a
	  file is created, deleted or modified.  Right before it displays the
	  list of changed files it suggests commands you can use here:

	  * You can accept the changes by using 'git add'.
	  * You can discard the changes with 'git restore'.

	  Discarding changes is how you use git like an "Undo" button.  Whenever
	  you make a mistake, git can put things back the way they were before!

	The most important thing to remember is that 'git status' suggests one
	or more commands that move your project along.  When you unsure about
	what to do next, just run 'git status'!

	:

	_tutr_pressanykey
}


# 9. Use git restore (or checkout) to discard this change
git_restore_prologue() {
	cat <<-:
	Let's try fixing a mistake with git's 'restore' subcommand.

	The form of the 'git restore' subcommand is
	  git restore FILE...

	Use 'git restore' to discard the change to README.md you made.  This
	will put 'README.md' back to its original state no matter what you did
	to it.
	:
}

git_restore_test() {
	if   [[ $PWD != $_REPO ]]; then return $WRONG_PWD
	elif [[ -z $(git status --porcelain=v1) ]]; then return 0
	elif _tutr_nonce; then return $PASS
	else _tutr_generic_test -c git -a restore -a README.md -l 1 -d "'$_REPO'"
	fi
}

git_restore_hint() {
	_tutr_generic_hint $1 git "$_REPO"
	cat <<-:

	Use 'git restore' to undo the change you made to README.md.
	  git restore README.md
	:
}

git_restore_epilogue() {
	cat <<-:
	Git subcommand 5/10: 'restore'

	:
	_tutr_pressanykey
}


# 10. Run 'git status' to prove that 'git restore' really worked
git_status3_prologue() {
	cat <<-:
	All better now!  Run 'git status' to see for yourself.  The state of the
	working tree should be "clean".
	:
}

git_status3_test() {
	if _tutr_nonce; then return $PASS
	else _tutr_generic_test -l 1 -c git -a status -d "'$_REPO'"
	fi
}

git_status3_hint() {
	_tutr_generic_hint $1 git "$_REPO"
	cat <<-:

	Run 'git status' to verify that README.md has been put back to its
	original form.
	:
}

git_status3_epilogue() {
	cat <<-:
	Perfect!

	:
	_tutr_pressanykey
}



# 11.  Run `git add` to add `README.md` to your repository.
git_add0_prologue() {
	cat <<-:
	This time I will have you change 'README.md' once more, but you will
	save this change as a commit.

	Creating a git commit is a two-stage process:

	0.  Add changes to the commit with 'git add'
	1.  Permanently record the commit along with a message describing the
		changes with 'git commit'

	As suggested by 'git status', you can use 'git add' to update what
	changed files will be committed.

	The form of the 'git add' command is
	  git add FILE...

	This means you may add as many or as few files to a commit as you wish.

	Edit 'README.md' once more, then use 'git add' to prepare it to be
	committed.
	:
}

git_add0_test() {
	if   [[ $PWD != $_REPO ]]; then return $WRONG_PWD
	elif [[ $(git hash-object "$_REPO/README.md") = $README_HSH ]]; then return 99
	elif _tutr_nonce; then return $PASS
	elif [[ ${_CMD[0]} = git && ${_CMD[1]} = status ]]; then return $PASS
	else _tutr_generic_test -c git -a add -a README.md -l 1 -d "'$_REPO'"
	fi
}

git_add0_hint() {
	case $1 in
		99)
			cat <<-:
			You realy must change 'README.md' to proceed.

			Go ahead and open it in 'nano' and make a mess of it.  You can't
			really hurt anything here!
			:
			;;

		*)
			_tutr_generic_hint $1 git "$_REPO"
			cat <<-:

			Now use 'git add README.md'.
			:
			;;
	esac
}

git_add0_epilogue() {
	cat <<-:
	Git subcommand 6/10: 'add'

	Creating a commit is a two-stage process.

	By "adding" README.md you are halfway there.

	:
	_tutr_pressanykey
}


# 12.  Check the status of your repository again
git_status4_prologue() {
	cat <<-:
	Run 'git status' to see what your repository looks like in this state.
	:
}

git_status4_test() {
	_tutr_generic_test -c git -a status -l 1 -d "'$_REPO'"
}

git_status4_hint() {
	_tutr_generic_hint $1 git "$_REPO"
	echo
	git_status4_prologue
}

git_status4_epilogue() {
	cat <<-:
	Files listed under the heading "Changes to be committed" are said to be
	in the "staging area".  

	The staging area is a git concept; it is not a location or directory on
	your computer.  It is the "place" in between two commits.  Your files
	still right here in this directory, and you can continue to edit and use
	them.

	'git add'ing files doesn't do anything permanent.  You can go back to
	the previous state by running

	  git restore --staged README.md

	Until you use 'git commit' your changes aren't permanently recorded in
	git's timeline.

	:
	_tutr_pressanykey
}


# 13. Use the `-m` option to add a brief message (between double quotes)
#    about this change.
git_commit0_prologue() {
	cat <<-:
	Now you are ready to permanently record this change in a commit.
	A commit consists of

	0.  The changes you have made to the project
	1.  Your name
	2.  Your email address
	3.  The current date & time
	3.  A brief message explaining what you changed and why

	The 'git commit' command makes and records a commit.  It has the form
	  git commit [-m "Commit message goes here"]

	The '-m' argument is optional.  If you don't supply it git will open a
	text editor where you can write as detailed a message as you like.  By
	default git uses the Nano editor.  Often a short, one-line message
	suffices, which may be given after the '-m' option.

	Note that a message given on the command line with '-m' MUST be
	surrounded by quote marks; otherwise 'git' mis-interprets each word of
	the message past the first as extra command arguments!

	Use 'git commit' to save a new commit.
	:
}

git_commit0_test() {
	if   [[ $PWD != $_REPO ]]; then return $WRONG_PWD
	elif [[ -z $(git status --porcelain=v1) && $(git rev-parse --short HEAD) != $STARTER ]]; then return 0
	elif _tutr_nonce vi vim nano emacs; then return $PASS
	else _tutr_generic_test -c git -a commit -l 1 -d "'$_REPO'"
	fi
}

git_commit0_hint() {
	_tutr_generic_hint $1 git "$_REPO"
}

git_commit0_epilogue() {
	_tutr_pressanykey
	cat <<-:
	Git subcommand 7/10: 'commit'

	Perfect!

	These three commands will be the backbone of your git workflow:

	0.  git add
	1.  git status
	2.  git commit

	You will use these commands so often that before long this will be as
	natural as breathing.  It just takes practice!

	:
	_tutr_pressanykey
}


# 14. Get the status of your repository once more; the directory should be
# 	"clean".
git_status5_prologue() {
	cat <<-:
	Get the status of your repository once more.
	After making a commit it should be "clean".
	:
}

git_status5_test() {
	_tutr_generic_test -c git -a status -l 1 -d "'$_REPO'"
}

git_status5_hint() {
	_tutr_generic_hint $1 git "$_REPO"
	cat <<-:
	
	Get the status of your repository once more.
	  git status
	:
}

git_status5_epilogue() {
	_tutr_pressanykey
}



# 15. Review the commit history of your repository.
git_log0_prologue() {
	cat <<-:
	The 'git log' command displays the complete history of the repository.

	In its simplest form 'git log' begins from the current commit and lists
	every commits all the way back to the beginning.  The most recent commit
	is shown at the top.

	When there are too many commits to fit on the screen at once, 'git log'
	uses the same text reader as the 'man' command.  This means that you will
	use the same keyboard shortcuts to control the display.

	* Press 'j' or 'Down Arrow' to scroll down.
	* Press 'k' or 'Up Arrow' to scroll up.
	* Press 'q' to exit the text reader.

	Run 'git log' now.
	:
}

git_log0_test() {
	_tutr_generic_test -c git -a log -l 1 -d "'$_REPO'"
}

git_log0_hint() {
	_tutr_generic_hint $1 git "$_REPO"
	cat <<-:

	Run 'git log' now.
	:
}

git_log0_epilogue() {
	_tutr_pressanykey
	cat <<-:

	Git subcommand 8/10: 'log'

	There are not many commits in this repo yet.  But it won't be weird for
	your own repos have dozens of commits.  In fact, many commits are better
	than few!

	:
	_tutr_pressanykey
}


# 16. Create the corresponding repo in your account over in GitLab
#     Add the remote repo to this repo
git_remote_prologue() {
	cat <<-:
	Turning in assignments in this class will be done entirely through git.
	Besides checking your score and reading messages from the grader there
	is nothing to do on Canvas.

	Before you can submit your code you need to create a remote repository
	on the GitLab server and associate this local repository with it.  This
	needs to be done for every assignment.

	Follow the instructions in this document to create a new remote
	repository on GitLab:

	  https://gitlab.cs.usu.edu/erik.falor/fa20-cs1440-lecturenotes/-/blob/master/Using_Git/Repository_Setup.md#steps-to-take-on-the-gitlab-website

	At the bottom of that document you are instructed to run 'git remote'
	twice to associate the local repo with the remote repo on the GitLab
	server.

	You will move on to the next step when this is complete.  
	:
}

git_remote_test() {
	if   _tutr_nonce; then return $PASS
	elif [[ $PWD = $_REPO ]]; then
		if   [[ ${_CMD[0]} = git && ${_CMD[1]} = help && ${_CMD[2]} = remote ]]; then return $PASS
		elif [[ ${_CMD[0]} = git && ${_CMD[1]} != remote ]]; then return 95
		# elif [[ ${_CMD[2]} = -v ]]; then return $PASS
		# elif [[ ${_CMD[2]} = set-url ]]; then return $PASS
		# elif [[ ${_CMD[2]} = rename ]]; then return $PASS
		# elif [[ ${_CMD[2]} = add ]]; then return $PASS
		fi

		local URL=$(git remote get-url origin)
		if   [[ -z $URL ]]; then return 99
		elif [[ $URL != *gitlab.cs.usu.edu* ]]; then return 93
		elif [[ $URL = https://gitlab.cs.usu.edu/erik.falor/* ]]; then return 98
		elif [[ $URL = git@gitlab.cs.usu.edu:erik.falor/* ]]; then return 98
		elif [[ $URL = */cs1440-falor-erik-assn0* ]]; then return 97
		elif [[ $URL != *-assn0 && $URL != *-assn0.git ]]; then return 96
		else return 0
		fi
	else return $WRONG_PWD
	fi

	# Dead code
	_tutr_generic_test -c git -a remote -l 1 -d "'$_REPO'"
}

git_remote_hint() {
	case $1 in
		99)
			cat <<-:
			There is no remote called 'origin'.  You can create it by running
			  'git remote add origin URL'.

			Replace "URL" in the above command with the address of your new
			repository on GitLab beginning with https://gitlab.cs.usu.edu
			from your browser's address bar.

			If present in the address bar, DO NOT copy any components of the
			URL following '-assn0'.
			:
			;;

		98)
			cat <<-:
			Your 'origin' points to the address of MY repo, not YOURS!

			Run 'git remote rename origin old-origin' to make room for a new
			remote repo named "origin".
			:
			;;

		97)
			cat <<-:
			The name you gave your repo is incorrect - it contains MY name.

			Your repository's name should be
			  cs1440-LASTNAME-FIRSTNAME-assn0
			and needs to contain YOUR name.

			Go back to GitLab and create a repo with the correct name.
			:
			;;

		96)
			cat <<-:
			This repository's name must end in '-assn0', signifying that it
			contains Assignment #0.

			Go back to GitLab and create a repo with the correct name.
			:
			;;

		95)
			cat <<-:
			Use the 'git remote' command to proceed.  If you need extra help,
			use 'git help remote' to view the manual page.
			:
			;;

		94)
			cat <<-:
			Try one of 

			'git remote rename origin old-origin'

			or

			'git remote set-url origin URL', replacing "URL" in the above
			command with the address of your new remote repository beginning
			with https:// from your browser's address bar.
			:
			;;

		93)
			cat <<-:
			The hostname of the URL should be 'gitlab.cs.usu.edu'.

			If you push your code to the wrong Git server it will not be
			counted as submitted.
			:
			;;

		*)
			_tutr_generic_hint $1 'git remote' "$_REPO"
			;;
	esac
	cat <<-:

	Hint: Use 'git remote -v' to display the currently configured remote
	repositories with their URLs.
	:
}

git_remote_epilogue() {
	cat <<-:
	Git subcommand 9/10: 'remote'

	Awesome!

	Just one more subcommand to go!
	:
	_tutr_pressanykey
}



# You will 'push' your commits to a git repository on the course GitLab server.  
# 17. Push & refresh your browser window
git_push_all_prologue() {
	cat <<-:
	You are finally ready to push the commits to the remote repo on GitLab.
	Pushing commits is how you will submit your work this semester.

	'git push' is the command that does this.  Its syntax is:

	  git push [-u] REPOSITORY [--all] 

	In the place of the 'REPOSITORY' argument you will give the 'origin',
	which is the nickname of the remote repo on your GitLab account.

	When you read the instructions in your new empty repo on GitLab you will
	have seen two suggested 'git push' commands.  You only need to run the
	first one listed:

	  git push -u origin --all

	The very first time you push you'll use the '-u' option.  Subseqently
	you can leave it off.

	You may be prompted for your GitLab username and password.  While you
	type your password nothing is printed to the screen, not even '*'
	symbols.  This is to protect your password from shoulder-surfers.

	Run this command now.
	:
}

git_push_all_test() {
	if   [[ ${_CMD[@]} = 'git help push' ]]; then return $PASS
	elif [[ ${_CMD[@]} = 'git remote' ]]; then return $PASS
	elif [[ ${_CMD[@]} = 'git remote -v' ]]; then return $PASS
	else _tutr_generic_test -c git -a push -a -u -a origin -a --all -l 1 -d "'$_REPO'"
	fi
}

git_push_all_hint() {
	_tutr_generic_hint $1 git "$_REPO"
	cat <<-:

	Run 
	  git push -u origin --all
	:
}

git_push_all_epilogue() {
	_tutr_pressanykey
	cat <<-:
	
	Git subcommand 10/10: 'push'

	Because this repository doesn't have any "tags" the second command
	suggested by GitLab

	  git push -u origin --tags

	has no use for your repo..

	In other words, you're all done!
	           ___   ___  _   _
	__      __/ _ \\ / _ \\| |_| |
	\\ \\ /\\ / / | | | | | | __| |
	 \\ V  V /| |_| | |_| | |_|_|
	  \\_/\\_/  \\___/ \\___/ \\__(_)

	:
	_tutr_pressanykey
}




source _tutr/main.sh && _tutr_begin \
	git_help \
	git_config \
	git_status0 \
	cd_dotdot0 \
	git_status1 \
	git_clone \
	cd_into_repo \
	git_status2 \
	edit_readme0 \
	git_restore \
	git_status3 \
	git_add0 \
	git_status4 \
	git_commit0 \
	git_status5 \
	git_log0 \
	git_remote \
	git_push_all \

# vim: set filetype=sh noexpandtab tabstop=4 shiftwidth=4 textwidth=76 colorcolumn=76:
