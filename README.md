## A minimal fortran unit-testing module - MiFu

This is close to as minimal as it can get for a fortran-based unit-testing framework for testing fortran code. I needed this for a project (www.github.com/SCMEdev/scme) and thought it might be useful for some one else.


## License and copying

This code is in the public domain. See the LICENSE file for details.


## Usage

Include the header file "mifu.h" into your test source code. You might need to compile with -cpp for this to be possible (only tested with gfortran). For a module you want to test "module1" you then make a test module as in the example "test_module1.f90", and use the assertion macro for your tests. Then create a run file, as in the example "mifu_run.f90" where you use the macros to build up your test suite.

Mikael Leetmaa
December 2015


