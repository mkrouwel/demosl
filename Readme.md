# DEMO-SL parser
Antlr based DEMO-SL parser, including samples and a script for checking the samples against DEMO-SL

## Prerequisites
Make sure you have Antlr installed: https://github.com/antlr/antlr4/blob/master/doc/getting-started.md

Note: your grun file should look like this:
```
java -cp "%CLASSPATH%;." org.antlr.v4.gui.TestRig %*
```

## Usage
- demo.g4 contains the DEMO-SL specification in the antlr format
- run.bat is a script for building and running the parser: it cleans all .java and .class files, it runs the antlr tool to build the (Java based) parser, it run the javac command to compile the generated parser and the starts the check command (see below). Up to 2 parameters can be passed on, which will be passed to the check script only. See below for explanation about the parameters.
- check.bat is a very convenient script taking up to 2 parameters, that can check a sample set against DEMO-SL. This script can be re-run with new or adapted sample sets, without having to rebuild the parser.
  1. name of the sample to check, if left empty all (\*) samples will be checked.
  2. -gui to show the parse tree visually, only applicable if 1st parameter is used. If left empty -tree will be passed on, thus showing the output in the command line. The latter is the default if multiple samples are being checked.
- test directory: contains sample sets that can be checked against DEMO-SL. The file name equals the rule to check

### Examples
`run` will completely build and compile the parser and check all present samples

`run bct_entries` will completely build and compile the parser and check only the bct_entries sample

`run bct_entries -gui` will completely build and compile the parser, check only the bct_entries sample and show the output as a picture

`check` will check all present samples (without rebuilding the parser)

`check bct_entries` will check only the bct_entries sample (without rebuilding the parser)

`check bct_entries -gui` will check only the bct_entries sample and show the output as a picture (without rebuilding the parser)

![Visualization of parse results on sample set indirect_entity_references](antlr4_parse_tree_example.png?raw=true "Title")

## Known issues
- attribute_variable and property_variable rules are not defined properly in DEMO-SL, need to be fixed in a later version
- if a name contains a space, in the samples it needs to be replaced by a _ (underscore). In later versions it should be fixed that (transaction, actor, bank, property, etc.) names can contain spaces as well
- probably some more...
