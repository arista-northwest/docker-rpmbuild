Summary: sample 
Name: sample 
Version: 0.1.0 
Release: 1 

# Choose your favorite license and use it below 
License: MIT License 
Group: EOS/Extension 
Source0: sample.tar 
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root 

# If desired, you can tie your extension to a specific set of releases by 
# specifying the range of releases it supports. 
Requires: Eos-release >= 2:4.25.0 
# Conflicts: Eos-release >= 2:4.9.0 

%description 
Description of sample extension 

%prep 
%setup -q -n sample 

%build 

%install 
# In the install step we copy all of the files from test.tar
# to their appropriate location
mkdir -p $RPM_BUILD_ROOT/usr/bin 
chmod 0755 sample.py
cp sample.py $RPM_BUILD_ROOT/usr/bin/ 

%files 
%defattr(-,root,root,-) 
/usr/bin/sample.py