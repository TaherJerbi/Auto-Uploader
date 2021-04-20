# Default values of arguments
SHOULD_START=0
SHOULD_DEALLOCATE=1

# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        -d|--deallocate)
        SHOULD_DEALLOCATE=0
        shift # Remove --initialize from processing
        ;;
    esac
done

# Check if VM is up
VAR2='"VM deallocated"'
VAR1=`az vm list -d --query "[?name=='mydebian']"| jq ".[].powerState"`
if [ "$VAR1" = "$VAR2" ]; then
    echo "$VAR1"
    SHOULD_START=1
else
    echo "VM already up ..."
    SHOULD_START=0
fi

if [ $SHOULD_START = 1 ]; then
    echo "**** STARTING VM ****"
    az vm start -g mydebian_group -n mydebian 
    echo "**** Waiting 10 seconds ... ****"
    sleep 10
fi

ip=`az vm show -d -g mydebian_group -n mydebian --query publicIps -o tsv`
echo "**** FOUND IP : $ip ****"
scp -i mydebian_key.pem newvids cookies.txt azureuser@$ip:Documents/Auto-Uploader/

ssh -i mydebian_key.pem -t azureuser@$ip '. ~/.bashrc;cd ~/Documents/Auto-Uploader/;sh transfer.sh' 

if [ $SHOULD_DEALLOCATE = 1 ]; then
    echo "**** DEALLOCATING VM ****"
    az vm deallocate -g mydebian_group -n 
fi