#!/bin/sh
# Lay out an installed taurus-core under $1 with the prefix /usr, from a release build.
# The release tarball is made from this tree.
set -eu
dest=${1:?usage: stage.sh DEST}
cd "$(dirname "$0")/.."

install -Dm755 target/release/taurus-core "$dest/usr/bin/taurus-core"
install -Dm644 assets/org.taurus.Core.service "$dest/usr/share/dbus-1/services/org.taurus.Core.service"
sed -i 's|@out@|/usr|' "$dest/usr/share/dbus-1/services/org.taurus.Core.service"
install -Dm644 LICENSE "$dest/usr/share/licenses/taurus-core/LICENSE"
