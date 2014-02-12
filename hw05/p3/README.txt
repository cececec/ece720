SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013, 1/1/2014, 2/2/2014 W. Rhett Davis (rhett_davis@ncsu.edu)

This tutorial introduces transaction-level modeling (TLM) Graphics
Vista at NC State University.  It is assumed that you already know how
to compile and execute C++ programs and SystemC simulations.  Refer to
the C++ Tutorial for more information on getting started.

The SimpleBusLT.h file in this tutorial was copied from the OSCI TLM
2.0.1 distribution.  The license covering the TLM 2.0.1 distribution
and its derivative works can be found in the SystemC Open Source
License, a copy of which can be found at the following location

http://www.accellera.org/about/policies/SystemC_Open_Source_License.pdf

 - Log in to a Linux Lab Machine
 - Change to the directory that contains this file
 - Build the project with the command "make"
 - Execute (simulate) the project with the command "make sim".
     The file expected.out contains the expected outut of this command.
 - Repeat the "make" and "make sim" commands as needed to rebuild
     and re-simulate the project.

Notes:
 - Use the "make clean" command to delete all generated files, in order
     to prepare the directory for archiving.
 - Use "make dbg" and "make gdb" in the place of "make" and "make sim"
     to build a debuggable execuable and to launch the GNU Debugger.

