##########################################################################
#  Mini, a type inference engine based on constraint solving.            #
#  Copyright (C) 2006. Fran�ois Pottier, Yann R�gis-Gianas               #
#  and Didier R�my.                                                      #
#                                                                        #
#  This program is free software; you can redistribute it and/or modify  #
#  it under the terms of the GNU General Public License as published by  #
#  the Free Software Foundation; version 2 of the License.               #
#                                                                        #
#  This program is distributed in the hope that it will be useful, but   #
#  WITHOUT ANY WARRANTY; without even the implied warranty of            #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU     #
#  General Public License for more details.                              #
#                                                                        #
#  You should have received a copy of the GNU General Public License     #
#  along with this program; if not, write to the Free Software           #
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA         #
#  02110-1301 USA                                                        #
#                                                                        #
##########################################################################

VERSION=0.3

.PHONY: all clean doc repoclean dist distcheck

all:
	$(MAKE) -C lib

repoclean: clean
	@ rm -fr autom4te.cache config.log configure Makefile   \
	  config.status


clean:	
	@ $(MAKE) -s clean -C lib
	@ $(MAKE) -s clean -C doc
	@ $(MAKE) -s clean -C tests
	@ echo 'The source tree is now clean.'

doc:
	@ $(MAKE) doc -C lib 

check:
	@ $(MAKE) check -C tests

DISTFILES =   	  						         \
  lib lib/Makefile $(wildcard lib/*.ml lib/*.mli lib/*.c lib/*.ml[ly])	 \
  tests tests/Makefile $(wildcard tests/good/*.input tests/bad/*.input)	 \
  config $(wildcard config/*)						 \
  $(wildcard extlib/Makefile extlib/mlreadline/* extlib/mlreadline/lib/* \
  extlib/mlreadline/demos/* extlib/mlreadline/config/*)			 \
  configure Makefile.in configure.ac README				 \
  tests/Makefile							 \
  $(wildcard								 \
	tests								 \
	tests/bad/							 \
	tests/bad/adt/*.bad-input					 \
	tests/bad/adt/Makefile  					 \
	tests/bad/type-env/*.bad-input					 \
	tests/bad/type-env/Makefile  					 \
	tests/bad/rows/*.bad-input					 \
	tests/bad/rows/Makefile						 \
	tests/good							 \
	tests/good/adt/*.good-input					 \
	tests/good/adt/*.expected					 \
	tests/good/adt/Makefile 					 \
	tests/good/core/*.good-input					 \
	tests/good/core/*.expected					 \
	tests/good/core/Makefile 					 \
	tests/good/parsing/*.good-input					 \
	tests/good/parsing/*.expected					 \
	tests/good/parsing/Makefile 					 \
	tests/good/type-env/*.good-input				 \
	tests/good/type-env/*.expected					 \
	tests/good/type-env/Makefile 					 \
	tests/good/rows/Makefile					 \
	tests/good/rows/*.good-input					 \
	tests/good/rows/*.expected)					 

PACKAGE=mini-prototype-$(VERSION)
TAR=tar
MV=mv
CP=cp
MKDIR=mkdir

dist: clean
	@ if test -d $(PACKAGE); then 		\
	  $(RM) -fr $(PACKAGE); fi;   		\
          $(MKDIR) -p $(PACKAGE) 
	@ for i in $(DISTFILES); do		\
	    if test -f $$i; then		\
	      $(CP) --parents $$i $(PACKAGE);	\
	    fi;					\
	    if test -d $$i; then		\
	      $(MKDIR) -p $(PACKAGE)/$$i;	\
	    fi					\
	  done
	@ $(TAR) cvfjh $(PACKAGE).tar.bz2 $(PACKAGE) &> /dev/null
	@ echo "$(PACKAGE).tar.bz2 is ready (but not tested)."

distcheck: dist
	@ cd $(PACKAGE) && ./configure && make -s && make -s check && \
	  echo "$(PACKAGE).tar.bz2 is ready."
