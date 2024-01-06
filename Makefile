all: build-core run-core

build-core:
	cd core && mvn install

run-core:
	cd core && java -cp target/core-1.0-SNAPSHOT.jar com.nhatvu148.App