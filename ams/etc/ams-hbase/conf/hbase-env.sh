
# Set environment variables here.

# The java implementation to use. Java 1.6+ required.
export JAVA_HOME=/usr/jdk64/jdk1.8.0_112

# HBase Configuration directory
export HBASE_CONF_DIR=${HBASE_CONF_DIR:-/etc/ams-hbase/conf}

# Extra Java CLASSPATH elements. Optional.
additional_cp=
if [  -n "$additional_cp" ];
then
  export HBASE_CLASSPATH=${HBASE_CLASSPATH}:$additional_cp
else
  export HBASE_CLASSPATH=${HBASE_CLASSPATH}
fi

# The maximum amount of heap to use for hbase shell.
export HBASE_SHELL_OPTS="-Xmx256m"

# Extra Java runtime options.
# Below are what we set by default. May only work with SUN JVM.
# For more on why as well as other possible settings,
# see http://wiki.apache.org/hadoop/PerformanceTuning
export HBASE_OPTS="-XX:+UseConcMarkSweepGC -XX:ErrorFile=/var/log/ambari-metrics-collector/hs_err_pid%p.log -Djava.io.tmpdir=/var/lib/ambari-metrics-collector/hbase-tmp"
export SERVER_GC_OPTS="-verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:/var/log/ambari-metrics-collector/gc.log-`date +'%Y%m%d%H%M'`"
# Uncomment below to enable java garbage collection logging.
# export HBASE_OPTS="$HBASE_OPTS -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:$HBASE_HOME/logs/gc-hbase.log"

# Uncomment and adjust to enable JMX exporting
# See jmxremote.password and jmxremote.access in $JRE_HOME/lib/management to configure remote password access.
# More details at: http://java.sun.com/javase/6/docs/technotes/guides/management/agent.html
#
# export HBASE_JMX_BASE="-Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"


export HBASE_MASTER_OPTS=" -Xms1408m -Xmx1408m -Xmn192m -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseCMSInitiatingOccupancyOnly"
export HBASE_REGIONSERVER_OPTS=" -Xmn128m -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseCMSInitiatingOccupancyOnly -Xms512m -Xmx512m"



# export HBASE_THRIFT_OPTS="$HBASE_JMX_BASE -Dcom.sun.management.jmxremote.port=10103"
# export HBASE_ZOOKEEPER_OPTS="$HBASE_JMX_BASE -Dcom.sun.management.jmxremote.port=10104"

# File naming hosts on which HRegionServers will run. $HBASE_HOME/conf/regionservers by default.
export HBASE_REGIONSERVERS=${HBASE_CONF_DIR}/regionservers

# Extra ssh options. Empty by default.
# export HBASE_SSH_OPTS="-o ConnectTimeout=1 -o SendEnv=HBASE_CONF_DIR"

# Where log files are stored. $HBASE_HOME/logs by default.
export HBASE_LOG_DIR=/var/log/ambari-metrics-collector

# A string representing this instance of hbase. $USER by default.
# export HBASE_IDENT_STRING=$USER

# The scheduling priority for daemon processes. See 'man nice'.
# export HBASE_NICENESS=10

# The directory where pid files are stored. /tmp by default.
export HBASE_PID_DIR=/var/run/ambari-metrics-collector/

# Seconds to sleep between slave commands. Unset by default. This
# can be useful in large clusters, where, e.g., slave rsyncs can
# otherwise arrive faster than the master can service them.
# export HBASE_SLAVE_SLEEP=0.1

# Tell HBase whether it should manage it's own instance of Zookeeper or not.
export HBASE_MANAGES_ZK=false



# use embedded native libs
_HADOOP_NATIVE_LIB="/usr/lib/ams-hbase/lib/hadoop-native/"
export HBASE_OPTS="$HBASE_OPTS -Djava.library.path=${_HADOOP_NATIVE_LIB}"

# Unset HADOOP_HOME to avoid importing HADOOP installed cluster related configs like: /usr/hdp/2.2.0.0-2041/hadoop/conf/
export HADOOP_HOME=/usr/lib/ams-hbase/

# Explicitly Setting HBASE_HOME for AMS HBase so that there is no conflict
export HBASE_HOME=/usr/lib/ams-hbase/