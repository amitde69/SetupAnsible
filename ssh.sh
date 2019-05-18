chmod 700 key.pem

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa | echo 'y'

hosties=[
slave1
]

for host in "${hosties[@]}"; do
	sudo cat ~/.ssh/id_rsa.pub | ssh -i key.pem ubuntu@$host "cat >> ~/.ssh/authorized_keys"
	echo "pushed to $host"
done
