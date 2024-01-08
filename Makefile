all: build-core run-core

build-core:
	cd core && mvn clean install

run-core:
ifdef OS
	cd core && java -cp "target/core-1.0-SNAPSHOT.jar;target/classes/*" com.nhatvu148.App
else
	cd core && java -cp "target/core-1.0-SNAPSHOT.jar:target/classes/*" com.nhatvu148.App
endif

clean-core:
	cd core && mvn clean

run-java:
ifdef OS
	cd app-java/app/build && java -cp "libs/app-1.0.jar;resources/main/*" com.nhatvu148.App
else
	cd app-java/app/build && java -cp "libs/app-1.0.jar:resources/main/*" com.nhatvu148.App
endif