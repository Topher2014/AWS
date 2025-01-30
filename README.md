# AWS
1: Create a Vm. ✅
2: Install Terraform. ✅
3: Create a AWS instance. ❌

# Project Commands

## STEP ONE
Create the VM:

```shell
bash create-vm.sh
```


## STEP TWO
Transfer the Terraform file from your local machine to the VM:

```shell
multipass transfer terraformInstall.sh super-cool-vm:/home/ubuntu
``` 


## STEP THREE
Shell into the VM:

```shell
multipass shell super-cool-vm
```


## STEP FOUR
Run the Terraform script in the VM:                                             

```shell
bash terraformInstall.sh                                   
```

## STEP FIVE
When you're done, exit the VM:

```shell   
exit
```

## STEP SIX            
Delete the VM:     

```shell
multipass delete super-cool-vm --purge                  
```
