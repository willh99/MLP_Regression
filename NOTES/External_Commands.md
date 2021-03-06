Essential External Tools:
=========================

`grep` (General Irregular Expression Parser):
---------------------------------------------
+ Used to search for text patterns based on regular expressions
+ `grep -i`: case insensitive
  - Example: `grep -i what*`
+ `grep -v`: excludes lines that match the pattern
  - Example: `grep -v what*`
+ `grep -r`: recurisive
  - Example: `grep -r what*`
+ `grep -e` (egrep): matches more regular expressions
  - Example: `grep -e 'what' -e 'else'*`
+ `grep -A5`: shows 5 lines afer the matching regex
    - `grep -B4`: shows 4 lines before the matching regex

`test:`
-------
+ Allows for testing of many items
+ Expressions:  
`test(ls /etc/hosts)`
+ Strings:  
`test -z $1`
+ Integers:  
`test $1 =6`
+ File Comarisons: `test file1 -nt file2`
  - `-nt` checks if file1 is newer than file2
+ File Properties: 	`test -x file 1`
  - `-x` checks if the file is an excecutable file
+ Three ways to use test
  - Test command: 	`test -z $1`
  - Single Sqr. Brackets: `[ -z $1 ]`
    * Equivalent to test command
- Double Sqr. Brackets: `[[ -z $1 ]]`
	* Has `&&` and `||` built in as well, but not universally compatable

`cut` and `sort`:
-------------
+ cut filters a specific column or field out of a line
+ sort is used to sort data in a specific order
+ output of cut is often piped to the sort command
+ Look up how to use on the Internet

`tail` and `head`:
--------------
+ `tail` - displays last lines of a file (10 by default)
  - `tail -2 filename/` ==> displays last 2 lines
+ `head` - displays first lines of a file (10 by default)
  - `head -2 filename/` ==> diaplays first 2 lines

`sed`:
------
+ A programming language with many utilities including text processing
+ Very powerful, be careful
+ Too rich to cover here. [Best to look it up](https://likegeeks.com/sed-linux/)

`awk`:
------
+ Also a very rich language
+ Filters information based on regular expression-based patterns
+ [Look this up as well](https://www.tutorialspoint.com/unix_commands/awk.htm)

`tr`:
-----
+ helps in transforming strings
+ `echo hello | tr [a-z] [A-Z]` ==> HELLO
  - Translates lowercase to uppercase
+ `echo hello | tr [:lower:] [:upper:]`
  - Same as above but more campatable with some languages (UNII Code)

`trap`:
-------
+ can be used to redefine signals
  - i.e. to disallow Ctrl+c
+ Consult man 7 signal for a list of available signals


`bash`:
-------
+ Can be used to open bash terminal in non-bash environment if installed
+ Debugging and analyzing tools are available when running with bash
+ `-v` to show verbose output (including error messages)
+ `-n` to check for syntax errors
+ `-x` show xtrace information
+ Use `DEBUG` trap to show debugging information for everything with that section of script
  - Example:
```bash
function erroneous {
    echo the error is $error
}	

trap DEBUG
echo this line is ok
erroneous
trap - DEBUG
```