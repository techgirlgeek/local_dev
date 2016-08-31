#!/bin/bash -x

# install Xcode Command Line Tools
 https://github.com/timsutton/osx-vm-templates/blob/ce8df8a7468faa7c5312444ece1b977c1b2f77a4/scripts/xcode-cli-tools.sh
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;

# Install Homebrew package manager, and use it to install Git, Ansible, Vagrant, and Virtualbox
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew install \
  caskroom/cask/brew-cask \
  git \
  ansible \
;
brew tap caskroom/versions;
brew cask install \
  vagrant \
  virtualbox \
;

# Get credentials for git
echo "What is your full name? for git?"
read name
echo "What is your CU email address?"
read email

path=$(dirname $0)
vars_file=$path/provisioning/group_vars/all

# Write credentials to group_vars/all file for Ansible
if grep "git_name" $vars_file
then 
	echo "Name already added"
else	
	echo "git_name: $name" >> $vars_file
fi

if grep "git_email" $vars_file
then
	echo "Email already added"
else	
	echo "git_email: $email" >> $vars_file
fi

# Install Vagrant plugins
vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-hostsupdater

#echo "Ansible installed!  Now run:"
#echo "ansible-playbook provisioning/localhost.yml"