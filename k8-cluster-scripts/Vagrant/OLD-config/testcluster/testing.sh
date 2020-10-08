# Create Join token and output
JOIN_FILE=./88.sh
rm -rf $JOIN_FILE
kubeadm token create --print-join-command > ${JOIN_FILE}
chmod +x $JOIN_FILE
