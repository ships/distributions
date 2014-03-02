install: FORCE
	pip install -e .
	mkdir -p build
	cd build && cmake .. &&  make

test: install
	pyflakes setup.py distributions
	pep8 --repeat setup.py distributions
	nosetests -v
	cd build && ctest
	./test_cmake.sh

clean: FORCE
	git clean -dfx

FORCE:
