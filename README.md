# dotfiles
dotfile awesomeness

## getting started
```
# install pre-reqs
sudo apt-get install vim git curl

# clone dotfiles repo
cd
mkdir git
cd git
git clone https://github.com/nateyoung/dotfiles.git
cd

# create symlinks
mv .bashrc .bashrc.old
ln -s git/dotfiles/.bashrc .bashrc
ln -s git/dotfiles/.vimrc .vimrc

# set up env
source .bashrc
vimplugs
cd
```
