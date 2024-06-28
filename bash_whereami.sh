# This can be physically included in any script which requires it or 
# sourced (. bash_whereami.sh).
#
# work out where the script is located and 
#  set environment variables for various directories
# 
#   THISDIR - location of script
#   SCRIPTNAME name pf script 
#   PROCESS_NAME - upper case name of script without extenion
#
THISDIR=$(dirname "$(which "$0" >/dev/null 2>&1)") 

if [ ${THISDIR} = "." ];then
    THISDIR=$(pwd)
fi

SCRIPTNAME=$( basename $0 )
PROCESS_NAME=$( echo ${SCRIPTNAME} |sed 's/\..*$//' | tr '[a-z]' '[A-Z]'  )
 echo THISDIR = $THISDIR
 echo SCRIPTNAME = $SCRIPTNAME
 echo PROCESS_NAME = $PROCESS_NAME

#
# Associated folders
# assumes the main script is in bin below a common parent
# 
CFGDIR=${THISDIR}/../etc
SQLDIR=${THISDIR}/../sql
LIBDIR=${THISDIR}/../lib
LOGDIR=${THISDIR}/../log

export THISDIR CFGDIR SQLDIR LIBDIR LOGDIR SCRIPTNAME PROCESS_NAME
