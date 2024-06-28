#!/bin/bash
#
#
# Process control file format 
#   plain text
#   keyed on process name
#   fields separated by colon :
# 
# e.g.  

# CHECK_BACKUPS:NO:NO:YES
#
# meaning of fields is unspecified
#
#====================================================================================

# -----------------------------------------------------------------------------------
# get a numbered field from the process control file
# usage:
# FLAG=$( get_process_control_flag ${PROCESS_NAME} $FLDNUM)
# if [ "${FLAG}" = "NO" ]...
# -----------------------------------------------------------------------------------

function get_process_control_flag {
    LOCAL_PROCESS=$1
    LOCAL_FLD=$2
          if [ ! -f ${CFGDIR}/process_control.ini ];then
                echo "YES"
                return
        fi
        GONOGO=$(grep "^${LOCAL_PROCESS}" ${CFGDIR}/process_control.ini | awk -F: -v fld="${LOCAL_FLD}" '{ print $fld }' )
        echo "${GONOGO}"
  

}


# get the process control flag (second field)
# this should be replaced by specific flag fetch function.
#
# echo "TEST:ONE:TWO:THREE" | awk -F:  -v var=$1 '{ print $var }'
function do_process_control {
        if [ ! -f ${CFGDIR}/process_control.ini ];then
                echo "YES"
                return
        fi
        GONOGO=$(grep "^${PROCESS_NAME}" ${CFGDIR}/process_control.ini | awk -F: '{ print $2 }' )
        echo ${GONOGO}



}

