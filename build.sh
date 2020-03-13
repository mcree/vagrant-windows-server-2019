#!/bin/bash
set -e
cd $(dirname "$0")
function setup() {
  read -rp "enter vagrand cloud token: " ct
  echo "${ct}" > .vagrant-cloud-token
}
test -f .vagrant-cloud-token || setup
ct=$(cat .vagrant-cloud-token)
VAGRANT_CLOUD_TOKEN="${ct}" packer validate template.pkr.json
VAGRANT_CLOUD_TOKEN="${ct}" packer build template.pkr.json
exit 0
