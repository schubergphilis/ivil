# $Id$
#
# (C) 2010 Frank Breedijk, Schuberg Philis under MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

all : perl-lib

perl-lib : IVIL.pm.tgz

IVIL.pm.tgz : perl-module/IVIL.pm
	cd perl-module; tar -cvzf ../IVIL.pm.tgz IVIL.pm

utils : nbe2ivil dump_ivil

nbe2ivil : nbe2ivil.tgz

nbe2ivil.tgz : perl-lib utils/nbe2ivil
	cd perl-module; tar -cvf ../nbe2ivil.tar IVIL.pm
	cd utils; tar -rvf ../nbe2ivil.tar nbe2ivil
	gzip -9 nbe2ivil.tar
	mv nbe2ivil.tar.gz nbe2ivil.tgz

dump_ivil : dump_ivil.tgz

dump_ivil.tgz :
	cd perl-module; tar -cvf ../dump_ivil.tar IVIL.pm
	cd utils; tar -rvf ../dump_ivil.tar dump_ivil
	gzip -9 dump_ivil.tar
	mv dump_ivil.tar.gz dump_ivil.tgz

