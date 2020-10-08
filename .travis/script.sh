#!/usr/bin/env bash

set -e

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then

	make -C build/ -j 2
	#TODO tests
fi

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
	
	make -C build/ -j 2
	if [[ $TRAVIS_TAG == '' ]]; then  # Regular commit, run tests
		xvfb-run ./build/giada --run-tests	
	fi

elif [[ $TRAVIS_OS_NAME == 'windows' ]]; then

	"/c/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild/15.0/Bin/MSBuild.exe" \
		-p:Configuration=Release \
		-p:Platform=x64 \
		build/giada.sln
fi