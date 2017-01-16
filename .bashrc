# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Import variables
. ~/variables.sh

# Env
export CATALINA_HOME=/c/Dev/Tomcat/apache-tomcat-8.0.32
export CATALINA_ORIGIN=/c/Dev/Tomcat/origin/apache-tomcat-8.0.32

editor='/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe'

# Editor
alias edit="$editor"
alias eclipse='/c/Dev/Eclipse/mars/eclipse/eclipse.exe'

# Projects
alias DEV='cd /c/dev'

# Tools
alias edit-bashrc='edit ~/.bashrc &'
alias edit-tools='edit ~/tools.sh &'

alias mmake='mvn clean package'

alias cc='/c/Dev/Tools/tcc/tcc.exe'

# CD DEV
DEV

# Tools
. ~/tools.sh

# PS1
PS1='\[\033[1;36m\]$PWD \[\033[1;35m\]$(__git_ps1 "(%s) ")\[\033[1;36m\]\$ \[\033[0;37m\]'
