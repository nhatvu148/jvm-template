all: build-core run-core

build-core:
	cd core && mvn clean install

run-core:
	cd core && java -cp "target/core-1.0-SNAPSHOT.jar;target/classes/*" com.nhatvu148.App

clean-core:
	cd core && mvn clean

run-gradle:
	cd core-gradle/app/build && java -cp "libs/app.jar;resources/main/*" com.nhatvu148.App