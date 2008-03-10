#!/bin/sh
# --- SDE-COPYRIGHT-NOTE-BEGIN ---
# This copyright note is auto-generated by ./scripts/Create-CopyPatch.
#
# Filename: target/sheba/pkgs/util-vserver/D%sysconfdir_vservers_.defaults_scripts_pre-start.sh
# Copyright (C) 2008 The OpenSDE Project
#
# More information can be found in the files COPYING and README.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License. A copy of the
# GNU General Public License can be found in the file COPYING.
# --- SDE-COPYRIGHT-NOTE-END ---

. D_libdir/util-vserver/util-vserver-vars

if grep -q '[ 	]/dev[ 	]' "$__CONFDIR/$2/fstab"; then
	# guest has /dev as tmpfs
	#

	install_nodes()
	{
		local dir="$1" x=

		for x in $dir/*; do
			y=dev/${x##*/}

			[ ! -e "$y" ] || rm -f "$y"

			cp -a "$x" "$y"
		done
	}

	for x in .defaults "$2"; do
		[ ! -d "$__CONFDIR/$x/dev" ] || install_nodes "$__CONFDIR/$x/dev"
	done
fi
