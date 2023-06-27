# Sample

### Build RPM

tar cvf sample.tar sample/
cp sample.tar ~/rpmbuild/SOURCES/
cp sample.spec ~/rpmbuild/SPECS/
cd ~/rpmbuild/SPECS/
rpmbuild -ba sample.spec


## Build SWIX

scp manifest.txt sample-0.1.0-1.x86_64.rpm admin@switch:/mnt/flash/

switch# bash
switch# cd /mnt/flash
switch# swix create sample.swix sample-0.1.0-1.x86_64.rpm
switch# exit
switch# copy flash:sample.swix extension:
switch# extension sample.swix
switch# show extensions