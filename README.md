# LinuxAdmin-LINUXtips

Repositório para notas pessoais do treinamento Linux Admin da Linuxtips.
Também incluí comandos, scripts e código Terraform e Vagrant, para subir o ambiente de estudos na OCI ou Virtualbox. 

Boa Viagem! 

## Dia 0 

- Apresentação dos termos e condições, suporte ao estudante e comunidade via Telegram.

## Day 1

**Requisitos para realizar o treinamento:**

- Curiosidade e vontade de aprender Linux;
- Computador com sistema Windows, Linux ou MacOS já instalado;
- Criar uma máquina virtual, poderá testar sem medo tudo e sem risco de danificar seu sistema Windows/Linux/MacOS existente;
  - 40Gb de espaço em disco livre para instalação do VirtualBox e máquina virtual;
  - Máquina com no mínimo 2 Gb de RAM;
- Boa conexão com a internet ;
- Acessar o Guia Foca online em https://www.guiafoca.org/guiaonline/.

**Linux**

Foi desenvolvido por Linus Torvalds em 1991.

Kernel - Faz a interação entre o hardware e as aplicações.

![image](https://github.com/user-attachments/assets/d2846a7b-c496-4452-88be-7c3d3fcc99d7)

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

Sem o GNU o Linux não iria funcionar com toda sua capacidade, então as comunidades não devem se desassociar.

**DFSG -  Debian Free Software Guideline**

Regras que devem ser seguidas para guiar a distribuição de software construído com o Debian.

![alt text](image.png)

**BSD**

"Berkeley Software Distribution" é um sistema operacional UNIX com desenvolvimento derivado e distribuido pelo Computer Research Group da Universidade da Califórnia em Berkeley, de 1977 a 1995.

Também compõe o ecosistema Linux, então podemos considerar sistemas Linux tudo que envolve o kernel mais GNU/BSD/Apache/MIT, Android etc.

Por isso é importante entender que o Linux está aí em todas as partes, desde celulares Android até em softwares utilizados por astronautas. 

**Ambiente para o Curso**

Utilizar máquinas virtuais no VirtualBox (Windows ou Linux) 

Para instalar o Virtualbox no Debian / Ubuntu
Add a chave que garante confiança em downloads da Oracle


*Instalação do VirtuaBox no Linux - Comandos* 

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

Optei por automatizar essa tarefa com IaC usando Terraform para o ambiente na OCI. E Vagrant para o ambiente local no VirtualBox. 

### [Dia 02](https://github.com/wendelrocha/LinuxAdmin-LINUXtips/blob/main/Day02.md)
