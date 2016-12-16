if [[ -z ${THIRD_PARTY_DIR} ]]; then
    echo "Third party directory not defined, searching and defining...!"
    find / -type d -name "software" > dir.txt
    export THIRD_PARTY_DIR=$(head -n 1 < dir.txt)
    echo "Third party directory set to: " $THIRD_PARTY_DIR
    return
fi

export THIRD_PARTY_DOWNLOADS=$THIRD_PARTY_DIR/Downloads

if [ ! -d $THIRD_PARTY_DOWNLOADS  ]; then 
  mkdir $THIRD_PARTY_DOWNLOADS 
fi

if [ ! -d "$THIRD_PARTY_DIR/tmp" ]; then
  mkdir $THIRD_PARTY_DIR/tmp
fi

export NCPU=1

###  root   ###
export ROOT_VERSION='5.34.05'
#export ROOT_VERSION='5.34.00-rc1'
export ROOT_INSTALL_LOG=${THIRD_PARTY_DIR}/tmp/log_install_root.txt
export ROOT_INSTALL_ERR=${THIRD_PARTY_DIR}/tmp/err_install_root.txt
export ROOT_INSTALL_DIR=${THIRD_PARTY_DIR}/root-v${ROOT_VERSION}/root

###  clhep  ###
export CLHEP_VERSION='2.1.3.1'
export CLHEP_INSTALL_LOG=${THIRD_PARTY_DIR}/tmp/log_install_clhep.txt
export CLHEP_INSTALL_ERR=${THIRD_PARTY_DIR}/tmp/err_install_clhep.txt
export CLHEP_INSTALL_DIR=${THIRD_PARTY_DIR}/clhep-v${CLHEP_VERSION}/clhep-install

### pythia6 ###
export PYTHIA6_VERSION='.424'
export PYTHIA6_INSTALL_DIR=${THIRD_PARTY_DIR}/pythia-v6${PYTHIA6_VERSION}/
export PYTHIA6_INSTALL_LOG=${THIRD_PARTY_DIR}/tmp/log_install_pythia.txt
export PYTHIA6_INSTALL_ERR=${THIRD_PARTY_DIR}/tmp/err_install_pythia.txt
