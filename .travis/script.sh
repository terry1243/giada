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

	# https://stackoverflow.com/questions/61874708/how-can-i-build-visual-studio-2019-projects-on-travis-ci
	
	echo "testing"
	ls "/c"
	ls "/c/Program Files (x86)"
	ls "/c/Program Files (x86)/Microsoft Visual Studio"
	"/c/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild/15.0/Bin/MSBuild.exe" build/giada.sln
fi