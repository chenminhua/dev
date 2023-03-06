azup:
	az group create -n "ansible" --location "eastasia"
	az deployment group create -n "testdeploy" -g "ansible" --template-file ./az/vm.json --parameters ./az/vm.parameters.json
	az network public-ip list -o table

pip:
	az network public-ip list -o table

ssh:
	ssh stan@20.187.74.46