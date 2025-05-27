# LinuxAdmin-LINUXtips

Repositório para notas pessoais de memória com o que considero mais importantes com relação ao treinamento Linux Admin da Linuxtips.
Também incluí comandos, scripts e código Terraform e Vagrant, para subir o ambiente de estudos na OCI ou Virtualbox.

**Ambiente mínimo**

- Computador com hardware razoável e sistema Windows, Linux ou MacOS;
- Boa conexão com a Internet;
- Usar VM para testar sem medo tudo e sem risco de danificar o sistema local; 

**Linux**

Foi desenvolvido por Linus Torvalds em 1991.
Kernel - Faz a interação entre o hardware e as aplicações.

<img width="256" alt="448135492-d2846a7b-c496-4452-88be-7c3d3fcc99d7" src="https://github.com/user-attachments/assets/ec8bf792-28bc-44de-a73e-b51e6b38d7ea" />

**Distribuições Linux**

Originais: 

- Debian, lançada em 1993 e derivou distribuições como Ubuntu, Kali-Linux, Linux Mint entre outras; 
- RedHat, lancçada em 1991 e derivou distribuições como CentOS, Fedora, RockyLinux entre outras;
- Outras distrinuições são póprias como Slackware, SUSE, Arch Linux entre outras;
- Essas derivações buscam entregar algo de novo e/ou diferente nas distribuições, como por exemplos pacotes que a distribuição de origem não permite que sejam distribuídos, como no caso do Kali-Linux;  

**Licenças**

- GPLv2
- GPLv3
- BSD
- Apache 
- MIT
- Creative Commons

O Kernel Linux ficou na licença GPLv2, pois Linus não concordou com algumas mudaças da v3; 
As GPLs, são mais restritivas no intuito proteger alguns conceitos de software livre: não vender, sempre distribuir código fonte etc. 

**GNU e Software Livre**

- GNU é um sistema operacional gratuito e semelhante ao Unix. 
- É composto por programas, bibliotecas, ferramentas de desenvolvimento e jogos;
- O GNU é um acrônimo recursivo que significa "GNU's Not Unix". 
- O Projeto GNU foi criado em 1983 por Richard Stallman; desde 
- O objetivo do projeto era resgatar o espírito cooperativo da comunidade de computação; 
- O GNU pode ser usado como um sistema operacional ou em partes com outros sistemas operacionais; 
- O GNU/Linux é um sistema operacional completo que combina o kernel Linux com os componentes do GNU.
- No OpenSource (Software Livre) garante 4 grandes liberdades (não tem a ver com o preço): executar o software, distribuir o software, estudar o software, melhorar e distribuir para comunidade;

Sem o GNU, o Linux não iria funcionar com toda sua capacidade, e sem o Linux o GNU não teria essa força pra ser executado, então as comunidades não devem se desassociar. 
E, por isso é o termo GNU/Linux pode ser usado sem pudores. 

**DFSG -  Debian Free Software Guideline**

Regras que devem ser seguidas para guiar a distribuição de software construído com o Debian:

- Ser de livre redistribuição;
- Incluir o código-fonte;
- Permitir modificações e derivações;
- Garantir a integridade do código-fonte do autor (como um compromisso);
- Não descriminar pessoas ou grupos;
- Não descriminar contra ramos de atuação (uso comercial do sistema);
- Aplicar a mesma licença para todos que aqueles a quem o programa é redestribuído;
- A licença não deve ser específica para um produto;
- A licença não deve restringir outro sofrware;

**BSD**

"Berkeley Software Distribution" é um sistema operacional UNIX com desenvolvimento derivado e distribuido pelo Computer Research Group da Universidade da Califórnia em Berkeley, de 1977 a 1995.

Também compõe o ecosistema Linux, então podemos considerar sistemas Linux tudo que envolve o kernel mais GNU/BSD/Apache/MIT, Android etc.

Por isso é importante entender que o Linux está aí em todas as partes, desde celulares Android até em softwares utilizados por astronautas. 

**Criando o ambiente para o curso**

Utilizar máquinas virtuais no VirtualBox (Windows ou Linux) ou recurso computacional em nuvem ou uma instância computacional, na Oracle Cloud Infrastructure, por exemplo. 

**Instalação do VirtuaBox no Linux - Comandos Debian/Ubuntu**

*Add a chave que garante confiança em downloads da Oracle*

```bash
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
```

```bash
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
```

*Add o repositório de atualização dos pacotes*

- Se for Ubuntu, substituir 'buster' pela release do Ubuntu (trusty) 

```bash
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian buster contrib" > /etc/apt/sources.list.d/virtualbox.list
```

*Atualiza a lista de pacotes*

```bash
apt-get update
```

*Instala pacotes adicionais que vão garantir que o VirtualBox funcionará corretamente*

```bash
apt-get install make gcc libncurses5-dev linux-headers-$(uname -r)
```

*Instala o Virtual Box versão 6.1*

```bash
apt-get install virtualbox-6.1
```

**Instalação do Debian Linux**

**Importante:** atualmente com os SSDs e com a grande quantidade de RAM disponível, a Swap não tem mais tanta importância; também não há forte recomendação de configurar o SWAP em SSDs, devido ao alto número de leitura e escrita, o que pode ocasionar a diminuição do tempo de vida útil do SSD. 

Baixar a ISO no site oficial do Debian.
Criar uma VM Debian 10 com 768GB RAM e 8GB de disco, em modo texto. 

*Instalação dos pacotes iniciais (como root)*

```bash
apt install tree coreutils bsdutils bsdmainutils net-tools man-db
```
Optei por automatizar essa tarefa com IaC usando Terraform para o ambiente na OCI. 
E Vagrant para o ambiente local no VirtualBox. 

## Day 02

**Primeiro Acesso ao Linux via SSH**

Commando SSH (Secure Shell) - Executa uma conexão segura a um determinado shell remoto. 

ssh usuarioX@ip_ou_nome_da_maquina = onde @ significa at, ou seja, usuárioX no IP ou Nome. 

Exemplo:
```bash
    ssh ubuntu@150.136.246.116 (usuário ubuntu no IP 150.136.246.116)
    ssh ubuntu@linuxadmin-vm.com (usuário ubuntu no DNS linuxadmin-vm.com)
```
No primeiro acesso é solicitado a troca de fingerprint entre o host local e o remoto. 
É como uma conferência de digitais, para que as partes se identifiquem pela primeira vez (sempre YES/SIM). 

**Conhecendo o Shell do Linux**

O Shell é o ambiente que realiza a interação entre o usuário e o kernel.

    cat /etc/shells

**O que é um arquivo e um diretório**

Arquivos temos informações inseridas lá dentro. 
Diretórios são locais para armazenar os arquivos criados.
Conceitos de caminhos absolutos (completo) ou caminhos relativos. 

**Estrutura de diretórios do Linux e FHS**

LSB - Linux Standard Base 

FHS - Filesystem Hierarchy Standard

Significados dos diretórios (extraido de https://pt.wikipedia.org/wiki/Filesystem_Hierarchy_Standard):

    /bin - Binários de usuários, essenciais no boot
    /sbin - Binários do superusuário, essenciais no boot
    /boot - Arquivo do gerenciador de partida e kernel, símbolos
    /dev - Dispositivos do sistema
    /etc - Arquivos de configuração globais
     /etc/opt - Arquivos de configuração para aplicativos em /opt
     /etc/X11 - Arquivos de configuração para o X Window System 11
    /home - Armazenamento de dados de contas de usuários normais
    /root - Armazenamento de dados de contas do superusuário
    /lib - Bibliotecas essenciais do sistema, de binários localizados em /bin e /sbin
    /mnt - Sistema de arquivos montado temporariamente
    /media - Ponto de montagem de mídias removíveis (como pen-drives, cd-rom)
    /opt - Pacotes estático de aplicações
    /proc - systema de arquivos virtual, onde pode fazer a interação com o kernel
         e processos do sistema
    /tmp - Arquivos temporários. Conteúdo geralmente apagado no reboot nas distribuições
    /usr - (unix system resources) - Hierarquia secundária (não essenciais no boot) para dados compartilhados de usuários
      /usr/bin - O mesmo que a hierarquia /bin, mas contém binários não essenciais ao
      funcionamento da máquina ou para o recovery
      /usr/include - Diretório padrãod para headers
      /usr/lib - O mesmo que a hierarquia /lib, mas não essenciais ao boot
      /usr/sbin - O emsmo que o /sbin, mas não essenciais ao boot da máquina
      /usr/share - Dados compartilhados independentes de arquitetura
      /usr/src - Armazenamento de código fonte da máquina
      /usr/X11R6 - - X Window Sysem, versão 11R6
      /usr/local - Armazenamento de binários não distribuidos na instalação principal
             da máquina, ou seja, fora do sistema de empacotamento. Também é o local
             de armazenamento terciário de dados
    /var - Arquivos que são gravados com frequencia (logs, páginas web, email, imagens, etc)
      /var/lock - Arquivos de lock, usados para controlar corretamente os recursos em uso
      /var/log - Arquivos de log, usado para logs em geral
      /var/mail - Caixas de e-mail dos usuários do sistema em formato mailbox
      /var/run - Contém dados sobre a execução do sistema desde seu primeiro boot 
              (daemons e usuários)
      /var/spool - Spooling de tarefas (fila de impressão, cache de pacotes, proxy, etc)
      /var/spool/mail - Antigo local da caixa de correio de usuários (deve ser usado /var/mail)
      /var/tmp - Arquivos temporários. Quando usado em modo multi-usuário.

**Desligando e reinicinado o Linux**

    shutdown, halt ou init0
    
    shutdown -c (cancela o agendamento)  

