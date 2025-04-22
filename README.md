# LinuxAdmin-LINUXtips
Repositório para anotações e arquivos do treinamento Linux Admin da Linuxtips.

### [Day 0](https://github.com/wendelrocha/LinuxAdmin-LINUXtips/blob/main/Day00.md)



## Day 2

**Primeiro Acesso ao Linux via SSH**

*Comandos utilizados*

Commando SSH (Secure Shell)

Executa uma conexão a um determinado shell remoto de maneira segura. 

ssh usuario@ip_ou_nome_da_maquina = o @ significa at, ou seja, usuário x no IP ou Nome. 

Exemplo:

    ssh ubuntu@150.136.246.116 (usuário ubuntu no IP 150.136.246.116)

*Outros comandos*

    cat /etc/os-release 
    su -
    sudo su
    cat /etc/debian_version
    cat /etc/os-release

**Conhecendo o Shell do Linux**

O Shell é o ambiente que realiza a interação entre o usuário e o kernel.

*Comandos executados*

    cat /etc/shells

**O que é um arquivo e um diretório**

**Estrutura de diretórios do Linux e FHS**

LSB - Linux Standard Base 

FHS - Filesystem Hierarchy Standard

    /bin - binários (executáveis) usuários por todos
    /boot - arquivos relacionados ao boot do sistema
    /grub - pasta do GRand Unified Bootloader do sistema
        
    

    

