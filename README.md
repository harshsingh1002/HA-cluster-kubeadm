# HA-cluster-kubeadm
This repository helps you to install highly available cluster with kubeadm.
we will be using Google Cloud for our provisioning

# Infrastrucutre Requirements 
You will need total of 7 virtual machines
- 1 VM for LoadBalancer
  - VM Name: loadbalancer
- 3 VM for control-plane ( 2 vCPU 2GB RAM )
  VM Name: 
  - master0
  - master1
  - master2
- 3 VM for worker-nodes  ( 1 vCPU 2GB RAM )
  VM Name:
  - worker0
  - worker1
  - worker2 

NOTE:- There should be full network connectivity between all of the virtual machines. you should create a seprate VPC for the above VMs and then open the required ports
# Setting up the environment
1. SSH into all the virtual machnes
2. Open Notepad and write down all the Private IPs of all the VMs
   see screenshot for ref.
3. Go to /etc/hosts add the following entries in all the VMs
   * see screenshot for ref.
    

# Installing Dependencies

# Initializing the cluster
  # Initializing master
  # Initializing worker
