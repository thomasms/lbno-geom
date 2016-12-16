SUCCESS=0

echo "going to place clhep."${CLHEP_VERSION} "  in " ${THIRD_PARTY_DIR}"/clhep-v"${CLHEP_VERSION}
cd ${THIRD_PARTY_DIR}

###################################################################################

if [ -d clhep-v${CLHEP_VERSION} ];then
  echo "directory clhep-v${CLHEP_VERSION} already exists. going to remove it."
  rm -rf clhep-v${CLHEP_VERSION}
fi

mkdir clhep-v${CLHEP_VERSION}
cd clhep-v${CLHEP_VERSION}
wget proj-clhep.web.cern.ch/proj-clhep/DISTRIBUTION/tarFiles/clhep-${CLHEP_VERSION}.tgz \
1>${CLHEP_INSTALL_LOG} 2>${CLHEP_INSTALL_ERR}

if [ -f clhep-${CLHEP_VERSION}.tgz ];then
  echo "download done"
else
  echo -e "download unsuccessful! \n  exit"
  cd ${THIRD_PARTY_DIR}
  return
fi

###################################################################################

tar xvfz clhep-${CLHEP_VERSION}.tgz 1>>${CLHEP_INSTALL_LOG} 2>>${CLHEP_INSTALL_ERR}
mv clhep-${CLHEP_VERSION}.tgz ${THIRD_PARTY_DOWNLOADS}
mv ${CLHEP_VERSION}/CLHEP clhep
rm -rf ${CLHEP_VERSION}
echo "extract done"

###################################################################################

mkdir clhep-build
cd clhep-build
cmake -DCMAKE_INSTALL_PREFIX=${CLHEP_INSTALL_DIR} ../clhep \
1>>${CLHEP_INSTALL_LOG} 2>>${CLHEP_INSTALL_ERR}

if [ -f Makefile ]; then
  echo "configure done"
else
  echo -e "configure unsuccessful! \n  exit"
  cd ${THIRD_PARTY_DIR}
  return
fi

###################################################################################

make -j${NCPU}  1>>${CLHEP_INSTALL_LOG} 2>>${CLHEP_INSTALL_ERR}

if [ -f lib/libCLHEP-${CLHEP_VERSION}.so ]; then
  echo "build done"
elif [ -f lib/libCLHP-${CLHEP_VERSION}.a ];then
  echo "build done"
else
  echo -e "build unsuccessful! \n  exit"
  cd ${THIRD_PARTY_DIR}
  return
fi

###################################################################################

make test  1>>${CLHEP_INSTALL_LOG} 2>>${CLHEP_INSTALL_LOG}
make install  1>>${CLHEP_INSTALL_LOG} 2>>${CLHEP_INSTALL_LOG}

if [ -d ${CLHEP_INSTALL_DIR}/lib ]; then
  echo "clhep installed in "${CLHEP_INSTALL_DIR}
else 
  echo -e "install unsuccessful! \n  exit"
  cd ${THIRD_PARTY_DIR}
  return
fi

cd ${THIRD_PARTY_DIR}

export SUCCESS=1

