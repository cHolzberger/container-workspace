#!/bin/bash
set -euxo pipefail

for i in /build/run-*.sh; do
	(
	source $i
	)	| sed -e "s/^/[$(basename $i )] /"
done

echo -e "asd\nasd" | passwd root
