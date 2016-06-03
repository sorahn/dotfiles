#!/bin/bash
PARAM_LEN=$(($#-1))
INPUTS=${@:1:$PARAM_LEN}
LAST=${@:$PARAM_LEN+1:1}
if [[ -z $INPUTS || -z $LAST ]]; then
  echo "Invalid args:  Usage: $0 [input files] [output file]"
  exit 1
fi
rm -f $LAST
touch $LAST
for i in ${INPUTS}; do
  if [ "$i" != "${LAST}" ]; then
    FILEBASE=${i%.*}
    echo "export ${FILEBASE} from './${FILEBASE}'" >> $LAST
  fi
done
echo >> $LAST
exit 0
