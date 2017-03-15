#first parameter is the directory of your jdk
#the directory where you want to bulid your JDK enviroment
path=$1

#the path of your jdk file(tar.gz)
jdkFilePath=$2

#bulid the directory if ti is null, and show you the process
if [ ! -d "path" ]; then 
    mkdir "path"
    echo "have made the directory"
fi

#if the jdkFile is not exsit, stop the script, and tell the user
if [ ! -f "jdkFilePath" ]; then
    echo "the jdkFile is not exsit!"
    exit
fi

#decompress the file to the target directory
tar -zxvf $jdkFilePath -C $path

JAVA_HOME=find path -maxdepath 1 -type d -name 'jre*' -print -quit
echo $JAVA_HOME

echo "#set jdk enviroment" >> /etc/profile
echo "export JAVA_HOME="$JAVA_HOME >> /etc/profile
echo 'export CLASSPATH=.:.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH' >> /etc/profile

echo "complete"
check

check()
{
    java -version
}



