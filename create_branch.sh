#!/bin/bash
for dir in */ ; 
do 
	echo $dir 
       	cd $dir
	git checkout fpt-uat-fim
	git pull
	git checkout -b fpt-fci-qa
	sed -i 's/branch: uat-fim/branch: fci-qa/g;s/NAMESPACE: tpb-loyalty/NAMESPACE: loyalty/g;s/fpt-uat-fim/fpt-fci-qa/g' .gitlab-ci.yml
	git add .gitlab-ci.yml
	git commit -m "checkout new branch [skip ci]"
	git push --set-upstream origin fpt-fci-qa
	cd ..
done
