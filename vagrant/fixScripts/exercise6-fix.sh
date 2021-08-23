#!/bin/bash
#add fix to exercise6-fix here
DST_FOLDER=${@: -1}   # the last parameter
FILE_LIST=${@:1:$#-1} # all the previous parameters

if [ "$(hostname)" = "server1" ]
then
	DST_MACHINE=server2
	SCP_COMMAND="scp -v -o StrictHostKeyChecking=no"
elif [ "$(hostname)" == "server2" ]
then
	DST_MACHINE=server1
	SCP_COMMAND="sshpass -p vagrant scp -v -o StrictHostKeyChecking=no"
fi
declare -i BYTES
touch /tmp/output

# copying the files

for file in $FILE_LIST;
do
		echo "Transferring file $file"
		$SCP_COMMAND $file $DST_MACHINE:$DST_FOLDER &>> /tmp/output
        ((BYTES+=$(cat /tmp/output |  grep -i Transferred | awk '{print $3}' | sed 's/,//'))) &> /dev/null
done

# Conclusion

echo "Number of bytes that have been transferred:"
echo $BYTES 
rm -f /tmp/output
