avrgcc-cpputest-boilerplate
===========================

Test project for AVRGCC-based code on windows and cpputest. KISS principle, no IDEs except your neighbourhood text editor.

Steps
-----

1. Install WinAVR to C:/Tools/ or sudo apt-get install gcc-avr binutils-avr gdb-avr avr-libc avrdude on linux
2. Install cpputest to your tools directory or somewhere you'll remember (get the latest version from the site)
3. clone this repo, cd into the directory.
4. Edit makeavr.mk to add:
  - Your platform
  - your directory structure
  - the location of your AVR libc include headers
5. Edit maketest.mk to add the location of cpputest
6. Add the avrgcc bin directory to your path, if apt didn't do this for you (or windowz).
7. Make test, make program, make all, make fuse.
