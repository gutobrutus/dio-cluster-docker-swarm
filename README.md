# Provisionamento de Cluster Docker Swarm

Projeto para provisionar um cluster Docker Swarm usando Vagrant.

## Recursos

O cluste irá executar com 6 VMs ao todo, sendo:
- 03 master nodes com 1vCPU e 512MB de RAM cada;
- 03 worker nodes com 1vCPU e 1GB de RAM cada.

Confirmar se a máquina física tem recursos suficientes para subir todas as VMs.

Caso não possua, fazer os devidos ajustes no arquivo [Vagrantfile](Vagrantfile).

## Deploy

Para realizar o deploy, em um terminal, estando no diretório raiz deste projeto, execute:

```shell
vagrant up
```

Após finalizar, para confirmar, acesse o vm master01:

```shell
vagrant ssh master01
```
Em seguida:

```shell
sudo docker node ls
```
A saída do comando acima deverá ser:

```shell
ID                            HOSTNAME   STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
xlv258euaszx7kxz8vlhq9adz *   master01   Ready     Active         Leader           20.10.19
q5soe4yj18e95dwejgk5rev9c     master02   Ready     Active         Reachable        20.10.19
vij52tolr2yimcca8myge28s9     master03   Ready     Active         Reachable        20.10.19
afsy7zq0ee6ls4phs19q0t75k     worker01   Ready     Active                          20.10.19
s50lj2ss7jzghuxjgsdoog8jt     worker02   Ready     Active                          20.10.19
0ks65m65hpqhkeksup1m1nx71     worker03   Ready     Active                          20.10.19
```

## Undeploy

Para realizar o undeploy:

```shell
vagrant destroy -f
```