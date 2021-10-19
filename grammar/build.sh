#!/bin/bash
java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool Forth.g4
javac Forth*.java
