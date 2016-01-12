#!/bin/bash

mkdir -p build
SCRIPT=build/install.sh

add_file () {
  FILE=$1
  FOLDER=$2
  MODE=$3

  echo "cat <<'__EOF__' > ${FOLDER}/${FILE}" >> ${SCRIPT}
  cat ${FILE} >> $SCRIPT
  echo "__EOF__" >> ${SCRIPT}
  echo "chmod ${MODE} ${FOLDER}/${FILE}" >> ${SCRIPT}
}

echo "#!/bin/bash" > ${SCRIPT}

add_file 53-ec2-network-interfaces.rules /etc/udev/rules.d 644
add_file 75-persistent-net-generator.rules /etc/udev/rules.d 644
add_file ec2dhcp /etc/dhcp/dhclient-exit-hooks.d 644
add_file ec2net-functions /etc/network 644
add_file ec2net.hotplug /etc/network 755
