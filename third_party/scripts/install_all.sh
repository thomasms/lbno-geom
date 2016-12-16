### install all ###
echo -e "\n Going to install third party software. This may take some time ..."

cd $THIRD_PARTY_DIR/scripts

source ${THIRD_PARTY_DIR}/scripts/install_env.sh
source ${THIRD_PARTY_DIR}/scripts/setNCPU.sh

export SUCCESS=1

if [ -d ${CLHEP_INSTALL_DIR}/lib ]; then
  echo -e "***** CLHEP already installed, skipping *****"
  SUCCESS=1
else
  echo -e "\n***** Installing CLHEP *****"
  cd $THIRD_PARTY_DIR/scripts/
  time source install_clhep.sh
  echo      "****************************"
fi
if [ $SUCCESS -eq 0 ]; then
  return
fi

if [ -f ${PYTHIA6_INSTALL_DIR}/lib/libPythia6.so ]; then
  echo -e "***** pythia6 already install, skipping *****"
else 
  echo -e "\n***** Installing Pythia6 ***"
  cd $THIRD_PARTY_DIR/scripts/
  time source install_pythia6.sh
  echo      "****************************"
fi
if [ $SUCCESS -eq 0 ]; then
  return
fi

if [ -f ${ROOT_INSTALL_DIR}/bin/root ]; then
  echo -e "***** root already install, skipping *****"
  SUCCESS=1
else
  echo -e "\n***** Installing Root ******"
  cd $THIRD_PARTY_DIR/scripts/
  time source install_root.sh
  echo      "****************************"
fi
if [ $SUCCESS -eq 0 ]; then
  return
fi
