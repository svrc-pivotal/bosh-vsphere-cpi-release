#!/usr/bin/env bash

set -e

release_dir="$( cd $(dirname $0) && cd ../.. && pwd )"
workspace_dir="$( cd ${release_dir} && cd .. && pwd )"

source ${release_dir}/ci/tasks/utils.sh
source /etc/profile.d/chruby.sh
chruby 2.1.2

pushd pull
  echo "running unit tests"
  pushd src/vsphere_cpi
    bundle install
    bundle exec rspec spec/unit
  popd
popd
