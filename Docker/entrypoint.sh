#!/bin/bash
set -e

groupadd -g ${TEX_UID?} tex
useradd -m -u ${TEX_UID?} -g tex tex

exec su tex -c "$*"
