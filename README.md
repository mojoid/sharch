## Install arch linux base system
---------------------------------
> **Set the partition so it's ready to use**

- Setup your disk partition in arch live boot
- Mount your partition to system

```bash
mkfs.ext4 /dev/sda?		--> to format partition
mount /dev/sda? /mnt		--> to mount partition
mkswap /dev/sda?		--> to to creat swap partition
swapon /dev/sda?	 	--> to activate swap partition
```
> **Run the script after finishing setting the partition**

```bash
pacman -Sy git
git clone https://github.com/mojoid/sharch
cp sharch/* $HOME
./arch-base.sh
```
- Before running the script,
- Dont forget to change the permission to execute
```bash
chmod +x *.sh
```
> **Run arch-post-install.sh**

- After finished with arch-base.sh, continue to run: 

```bash
./arch-post-install.sh
```

## Desktop

> **If you need to install Desktop**

- Reboot system after installing arch
- Login as user

```bash
pacman -S git
```
```bash
git clone https://github.com/mojoid/sharch
```
```bash
cp sharch/* $HOME
```
```bash
./install-desktop.sh
```
