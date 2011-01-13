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

all : perl-lib utils ivil

ivil : ivil.tgz

ivil.tgz : utils perl-lib

perl-lib : IVIL.pm.tgz

IVIL.pm.tgz : perl-module/IVIL.pm
	cd perl-module; tar -cvf ../IVIL.pm.tar IVIL.pm
	tar -rvf IVIL.pm.tar MIT_license.txt
	gzip -9 IVIL.pm.tar
	mv IVIL.pm.tar.gz IVIL.pm.tgz

utils : nbe2ivil nessus2ivil dump_ivil dump_nessus

nbe2ivil : nbe2ivil.tgz

nbe2ivil.tgz : utils/nbe2ivil perl-module/IVIL.pm
	cd perl-module; tar -cvf ../nbe2ivil.tar IVIL.pm
	cd utils; tar -rvf ../nbe2ivil.tar nbe2ivil
	tar -rvf nbe2ivil.tar MIT_license.txt
	gzip -9 nbe2ivil.tar
	mv nbe2ivil.tar.gz nbe2ivil.tgz

nessus2ivil : nessus2ivil.tgz

nessus2ivil.tgz : utils/nessus2ivil perl-module/IVIL.pm
	cd perl-module; tar -cvf ../nessus2ivil.tar IVIL.pm
	cd utils; tar -rvf ../nessus2ivil.tar nessus2ivil
	tar -rvf nbe2ivil.tar MIT_license.txt
	gzip -9 nessus2ivil.tar
	mv nessus2ivil.tar.gz nessus2ivil.tgz

dump_ivil : dump_ivil.tgz

dump_ivil.tgz : utils/dump_ivil 
	cd utils; tar -cvf ../dump_ivil.tgz dump_ivil

dump_nessus : dump_nessus.tgz

dump_nessus.tgz : utils/dump_nessus 
	cd utils; tar -cvf ../dump_nessus.tgz dump_nessus

ivil.tgz : utils/nessus2ivil perl-module/IVIL.pm
	cd perl-module; tar -cvf ../ivil.tar IVIL.pm
	cd utils; tar -rvf ../ivil.tar nbe2ivil nessus2ivil dump_ivil dump_nessus
	tar -rvf ivil.tar MIT_license.txt
	gzip -9 ivil.tar
	mv ivil.tar.gz ivil.tgz

clean :
	rm -f *.tgz
