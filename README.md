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
4. Create ssh keys from loadbalancer VM and copy it to all the VMs
    
    

# Installing Dependencies
  * RUN ON ALL THE VMS 
    
   ` sh dependencies.sh `
   
  * RUN ONLY ON loadbalancer VM
  
  
    `` sudo apt-get update ``
    
    
     ``sudo apt-get upgrade -y ``
     
     
     ``sudo apt-get install -y haproxy`` 

# Initializing the cluster
  * RUN ON loadbalancer VM
  
  
      ` kubeadm init --control-plane-endpoint={{IP_loadbalancer}} --upload-certs --apiserver-advertise-address={{IP_ADDR_MASTER0}} ` 
    
       *  Copy the output of kubeadm init and store it in a notepad
       
       `mkdir -p $HOME/.kube `
           
       `sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config` 
    
       `sudo chown $(id -u):$(id -g) $HOME/.kube/config` 
       
       ` curl https://docs.projectcalico.org/manifests/calico.yaml -O `
       
       ` kubectl apply -f calico.yaml `
  # Initializing master
  
        *  Copy the command from kubeadm init output which says:
      
       - You can now join any number of the control-plane node running the following command on each as root:

         
         kubeadm join 10.128.0.8:6443 --token d869fb.8t8rxrr20n32jfze \
         --discovery-token-ca-cert-hash sha256:2b476f3e290a46a4b4d4106a21062879f234c97704a9a3e79d7e43e7f89a813b \
         --control-plane --certificate-key 396423ba4490837004e20ae3f57235fb78d81893582a2a73aa6a09302ce1ff53
         
  # Initializing worker
    
    * Copy the command from kubeadm init output which says 
    
      - kubeadm join 10.128.0.8:6443 --token d869fb.8t8rxrr20n32jfze \
        --discovery-token-ca-cert-hash sha256:2b476f3e290a46a4b4d4106a21062879f234c97704a9a3e79d7e43e7f89a813b
