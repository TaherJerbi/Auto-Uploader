echo "Starting VM"
az vm start -g mydebian_group -n mydebian 
echo "Finding IP"
ip=`az vm show -d -g mydebian_group -n mydebian --query publicIps -o tsv`
echo "IP FOUND : $ip"
echo "WAITING 20 seconds"
sleep 20
ssh -i mydebian_key.pem azureuser@$ip
