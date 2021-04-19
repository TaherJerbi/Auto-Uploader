az vm start -g mydebian_group -n mydebian 
ip=`az vm show -d -g mydebian_group -n mydebian --query publicIps -o tsv`
ssh -i mydebian_key.pem azureuser@$ip
