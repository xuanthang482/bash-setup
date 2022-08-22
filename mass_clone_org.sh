#!/bin/bash


for repo in $(curl -s --header "PRIVATE-TOKEN: <token>" https://gitlab.com/api/v4/groups/56430648 | jq -r ".projects[].ssh_url_to_repo");
do 
  git clone $repo; 

done
