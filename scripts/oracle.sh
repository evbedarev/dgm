#!/bin/bash
ORACLE_HOME=/u01/app/oracle/product/12.2.0/12201
ORACLE_USER=oracle
ORACLE_SID=ASRATES

runsql () {
$ORACLE_HOME/bin/sqlplus -S / as sysdba<< EOF
startup;
exit;
EOF
}
stopsql() {
$ORACLE_HOME/bin/sqlplus -S / as sysdba<< EOF
shutdown abort;
exit;
EOF
}
case "$1" in 'start')
        runsql
        ;;
'stop')
        stopsql
        ;;
*)
        echo "Usage: $1 [start|stop]"
        exit 1
esac
exit 0

