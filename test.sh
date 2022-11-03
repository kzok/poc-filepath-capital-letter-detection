#!/usr/bin/env bash

set -eu -o pipefail

cd $(dirname $0)

log() {
	echo -e "\e[32m${1}\e[0m"
}

log_err() {
	echo -e "\e[31m${1}\e[0m"
}

test() {
	expected="$1"
	input="$2"

  set +e
  echo "$input" | ./detect-uppercase.sh
  actual="$?"
  set -e

  if [ "$actual" = "$expected" ]; then
    log "Passed: $input => $actual"
  else
    log_err "Failed: $input => $expected expected, but got $actual"
    exit 1
  fi
}

log "Tests start."

test 0 "foo"
test 1 "FOO"
test 1 "Foo"

test 0 "foo bar"
test 1 "Foo bar"
test 1 "foo Bar"
test 1 "Foo Bar"

log "\e[32mAll tests passed!\e[0m"
