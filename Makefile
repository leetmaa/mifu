
FC = gfortran
FFLAGS = -O3 -cpp

run.x: mifu_run.o mifu_asserts.o test_module1.o
	$(FC) $(FFLAGS) -o run.x mifu_run.o mifu_asserts.o test_module1.o

mifu_run.o: mifu_run.f90 mifu_asserts.mod test_module1.mod
	$(FC) $(FFLAGS) -c mifu_run.f90

mifu_asserts.mod: mifu_asserts.o

mifu_asserts.o: mifu_asserts.f90
	$(FC) $(FFLAGS) -c mifu_asserts.f90

test_module1.mod: test_module1.o

test_module1.o: test_module1.f90 mifu_asserts.mod
	$(FC) $(FFLAGS) -c test_module1.f90

clean:
	rm -f *.o *.mod *.x *~
