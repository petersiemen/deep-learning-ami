#!/usr/bin/env bash


set -euo pipefail
IFS=$'\n\t'

PACKER_FILE="$1"

source .env

packer build -var-file=variables.json  "${PACKER_FILE}"
