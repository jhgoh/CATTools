#!/bin/bash
yum -y install glibc-devel
source /cvmfs/cms.cern.ch/cmsset_default.sh
scramv1 project CMSSW CMSSW_8_0_29
cd CMSSW_8_0_29/src
eval `scramv1 runtime -sh`
gcc -v
ln -s /CATTools .
cd CATTools
git submodule init
git submodule update
cd CommonTools/scripts
git checkout master
git pull
cd ../../..

scram b -j2
