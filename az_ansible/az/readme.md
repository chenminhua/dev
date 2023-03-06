## add nsg to open port
```
az network nsg rule create --name prometheus_9090 --nsg-name ansible-nsg --priority 1001 -g ansible --destination-port-range 9090 --direction Inbound --protocal Tcp
```

## list all nsg
```
az network nsg rule list --nsg-name ansible-nsg -g ansible
```