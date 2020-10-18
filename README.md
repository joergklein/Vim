# Vim as an Integrated Development Environment (IDE)

Vim is a highly configurable text editor built to make creating and changing any
kind of text very efficient. It is included as "vi" with most UNIX systems and
with Apple OS X.

Vim is rock stable and is continuously being developed to become even better.
Among its features are:

- persistent, multi-level undo tree
- extensive plugin system
- support for hundreds of programming languages and file formats
- powerful search and replace
- integrates with many tools

## Installation

git clone https://github.com/joergklein/vim.git ~/.vim

Set a link for .vimrc
ln -s .vim/vimrc ~/.vimrc

### Plugin tagbar

Before you can use tagbar, `ctags-etags.x86_64` must be installed.

`yum install ctags-etags.x86_64`

### Plugin prettier

Before you can use prettier, `node and yarn` must be installed.

#### Installing Yarn on CentOS 7

To install Yarn on your CentOS 7 system, follow the steps below:

1. If you already don’t have Node.js installed on your system, enable the Nodesource
   repository with the following curl command :

   ``` sh
   curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash -
   yum install nodejs
   ```

2. The official Yarn repository is consistently maintained and provides the most
   up-to-date version. To enable the Yarn repository and import the repository’s
   GPG key issue the following commands:

   ```sh
   curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
   rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
   yum install yarn
   ```

