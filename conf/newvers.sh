#!/bin/sh
# 
# Mach Operating System
# Copyright (c) 1994 Johannes Helander
# All Rights Reserved.
# 
# Permission to use, copy, modify and distribute this software and its
# documentation is hereby granted, provided that both the copyright
# notice and this permission notice appear in all copies of the
# software, derivative works or modified versions, and any portions
# thereof, and that both notices appear in supporting documentation.
# 
# JOHANNES HELANDER ALLOWS FREE USE OF THIS SOFTWARE IN ITS "AS IS"
# CONDITION.  JOHANNES HELANDER DISCLAIMS ANY LIABILITY OF ANY KIND
# FOR ANY DAMAGES WHATSOEVER RESULTING FROM THE USE OF THIS SOFTWARE.
#
#
# HISTORY
# $Log: newvers.sh,v $
# Revision 1.1.1.1  1995/03/02  21:49:26  mike
# Initial Lites release from hut.fi
#
#

copyright="$1"; name="$2"; version="$3"; config="$4";
v="VERSION(${version})" h=`hostname` t=`date`
if [ -z "$h" -o -z "$t" ]; then
    exit 1
fi
CONFIG=`expr "$d" : '.*/\([^/]*\)$'`
d=`expr "$d" : '.*/\([^/]*/[^/]*\)$'`
(
  echo "char ostype[] = \"Lites\";" ;
  echo "char osrelease[] = \"${version}\";" ;
  echo "char version[] = \"${name} ${v}: ${t}; $config ($h)\\n\";" ;
  echo "char version_short[] = \"${version} ${config}\\n\";" ;
  echo "char cmu_copyright[] = \"\\" ;
  sed <$copyright -e '/^#/d' -e 's;[ 	]*$;;' -e '/^$/d' -e 's;$;\\n\\;' -e 's/"/\\"/g';
  echo "\";";
) > vers.c
if [ -s vers.suffix -o ! -f vers.suffix ]; then
    echo ".${variant}${edit}${patch}.${CONFIG}" >vers.suffix
fi
exit 0
