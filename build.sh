#!/usr/bin/env bash


set -euo pipefail
IFS=$'\n\t'

source .env

AWS_PROFILE=$AWS_PROFILE packer build -var AWS_ACCOUNT_ID=$AWS_ACCOUNT_ID deep-learning-ami.json
