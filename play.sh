#!/bin/bash

REMOVE_ROLE_FOLDER=$false
ROLE_FOLDER=roles

# If the variable has a value...and it's true.
if [[ "$1" ]] && $1 == $true ; then
  echo "Remove Role Folder flag set to true."
  REMOVE_ROLE_FOLDER=$1
fi

if [ $REMOVE_ROLE_FOLDER ] ; then
  echo "Removing '${ROLE_FOLDER}' folder"
  rm -rf "${ROLE_FOLDER}"
fi

# Create the roles directory if it doesnt exist.
mkdir -p "${ROLE_FOLDER}"

echo "Installing roles into '${ROLE_FOLDER}' folder."
# Run Ansible Galaxy to fetch the roles from the sources configured in the requirements.yml file.
# -p tells the executable to download the files into the current directory.
ansible-galaxy install -r requirements.yml -p "./${ROLE_FOLDER}"
