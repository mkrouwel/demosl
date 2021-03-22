del demo*.java
del demo*.class
java org.antlr.v4.Tool demo.g4
javac demo*.java
check %1 %2