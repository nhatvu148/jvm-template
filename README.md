## Commands

- javac HelloWorld.java
- java HelloWorld
- jar cf myjar.jar HelloWorld.class
- java -classpath myjar.jar HelloWorld
- unzip myjar.jar

- javac -classpath ./lib/\* HelloWorld.java
- java -classpath ./lib/\* HelloWorld.java

- mvn clean
- mvn package
- mvn dependency:resolve-plugins
- mvn clean package
- java -classpath hello-world-0.0.1-SNAPSHOT.jar HelloWorld

- mvn archetype:generate -DgroupId=com.nhatvu148 -DartifactId=core -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
- mvn archetype:generate -DgroupId=com.nhatvu148 -DartifactId=mywebapp -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
  mvn install
  java -cp target/core-1.0-SNAPSHOT.jar com.nhatvu148.App

## References

- https://mvnrepository.com/repos/central
- https://repo1.maven.org/maven2/
- https://repo.maven.apache.org/maven2/
- C:\Users\nhatv\.m2\repository
