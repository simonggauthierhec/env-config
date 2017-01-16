# Global
reload-bashrc () {
	pushd .
	source ~/.bashrc
	popd
}

# Tomcat
set-java-opts () {
	export TOMCAT_JMX=''
	export JAVA_OPTS="-server -Xms512m -Xmx1024m -XX:NewSize=192m -XX:MaxNewSize=384m -Djava.awt.headless=true -Dhttp.agent=Sakai -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dsun.lang.ClassLoader.allowArraySyntax=true -Djava.util.Arrays.useLegacyMergeSort=true -Dfile.encoding=UTF8 -Duser.timezone=America/Montreal -Duser.language=fr -Duser.region=CA $TOMCAT_JMX"
	export JPDA_ADDRESS='9090'
	export JPDA_TRANSPORT='dt_socket'
}

tomcat-start () {
	set-java-opts
	echo "Starting Tomcat in debug mode (JPDA port $JPDA_ADDRESS)"

	$CATALINA_HOME/bin/startup.sh
}

tomcat-stop () {
	set-java-opts
	$CATALINA_HOME/bin/shutdown.sh
}

tomcat-log () {
	tail -f $CATALINA_HOME/logs/catalina.out
}

tomcat-log-x () {
	tail "-$1" $CATALINA_HOME/logs/catalina.out
}

tomcat-clean () {
	echo "Cleaning work folder"
	rm -rf $CATALINA_HOME/work/*

	echo "Cleaning apps"
	rm -rf $CATALINA_HOME/components/*
	rm -rf $CATALINA_HOME/tools/*
	rm -rf $CATALINA_HOME/webapps/*

	echo "Cleaning libraries"
	rm -f $CATALINA_HOME/lib/*
	rm -f $CATALINA_HOME/shared/lib/*

	echo "Restoring original libraries"
	cp $CATALINA_ORIGIN/lib/* $CATALINA_HOME/lib/
}

alias tl=tomcat-log

alias tomcat-grep="cat $CATALINA_HOME/logs/catalina.out | grep "

# Grep
grepj () {
	grep -nr --include='*.java' "$1" .
}

grepui () {
	grep -nr --include="*.{html,js,scss}" $1 .
}

# Find
ffind () {
	find . -name "$1" -print
}

# Prop Diff
alias propdiff="java -jar /c/Dev/Projects/workspace/propdiff/target/propdiff-1.0.jar"

# Web server
web-server-here () {
	python -m SimpleHTTPServer $1
}

# SQL Dev
sql-dev () {
	/c/Dev/Tools/sqldeveloper/sqldeveloper.exe --AddVMOption=-Duser.language=en &
}

# Js
js () {
	node -e "console.log($1)"
}

# Zone Cours
export ZC_DIR='/c/dev/projects/workspace/zc2/sakai'

alias zc-svn='svn --username $ZC_SVN_USERNAME --password $ZC_SVN_PASSWORD'

zc-dep () {
	mvn clean install sakai:deploy -Dsakai.cleanup=true -Dmaven.tomcat.home=$CATALINA_HOME -Dsakai.home=$CATALINA_HOME/sakai -Djava.net.preferIPv4Stack=true -Dmaven.test.skip=true
	
	date
}

zc-env () {
	rm "$CATALINA_HOME/sakai/sakai.properties"
	cp "$CATALINA_HOME/sakai/sakai.env.$1.properties" $CATALINA_HOME/sakai/sakai.properties

	echo "ZC env set to $1"
}

# Explorer
alias dev="explorer.exe \"c:\dev\""

# Work on
workon-env() {
	cd /c/users/11169180
}

workon-tenjin () {
	cd /c/dev/projects/workspace/zc2/sakai_tenjin/sakai/tenjin
	edit /c/dev/projects/workspace/zc2/sakai_tenjin/sakai/tenjin/tool/src/main/webapp/tenjin.sublime-project &
}
