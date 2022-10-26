f=classptr.F90 -c
SHELL:=/bin/bash
nvfortran: clean
	module load nvhpc && nvfortran $(f)
ifort: clean
	module load oneapi compiler && ifort $(f)
gfortran: clean
	module load gcc && gfortran $(f)
aocc: clean
	module load aocc && flang $(f)
clean:
	rm -f *.o *.mod
