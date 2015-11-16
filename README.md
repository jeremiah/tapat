# Tapat
 
This is the README file for Tapat, a test harness, written in perl, 
which uses [the TAP protocol](http://testanything.org/).
 
INSTALLATION

To install this perl module, run the following commands:
 
    perl Makefile.PL
    make
    make test
    make install
 
Or, alternatively, you can use the deb package I have built. I
recommend this method of installation, at least if you are using
debian or one of its derivatives. I maintain the package myself and
try to keep it up to date. Currently it is only to be found in my
debian repository, and I am not sure when I will submit it to
debian. To use my repository, copy into your /etc/apt/sources.list the
following lines:
 
### Personal deb repository:
    deb http://jeremiahfoster.com:80/apt sid main contrib 
    deb-src http://jeremiahfoster.com:80/apt sid main contrib 

Now you can do an `apt-get update` and then `apt-get install
libapp-test-tapat-perl` and you should get the Tapat software along
with its dependencies.
 
SUPPORT AND DOCUMENTATION
 
After installing, you can find documentation for this module with the
perldoc command.
 
    perldoc App::Test::Tapat
 
You can also look for information at:

    Source Code
	https://github.com/jeremiah/tapat
 
    RT, CPAN's request tracker
        http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-Test-Tapat
 
    AnnoCPAN, Annotated CPAN documentation
        http://annocpan.org/dist/App-Test-Tapat
 
    CPAN Ratings
        http://cpanratings.perl.org/d/App-Test-Tapat
 
    Search CPAN
        http://search.cpan.org/dist/App-Test-Tapat
 
COPYRIGHT AND LICENCE
 
Copyright (C) 2008, 2012 Jeremiah C. Foster

The license for this software is the GPLv3
