Bash Scripting Need to Knows:
=============================

Variables
---------
* Variables are statically set as such:  
  `FILENAME=/some/path/to/file`
* Variables are used as such:  
  `echo $FILENAME`
* Variables can be read interactively from command line:  
  `read FILENAME`
* Script Arguments can be accessed as such:
  * Get first argument: `echo $1`
  * Get 12 argument (mush use `shift` in older shells):  `echo ${12}`
* Variables can be declared as a specific type if desired
  - `declare -r var=1` *(readonly)*
  - `declare -i var=1` *(number)*
  - `declare -a var` *(array)*
  - `declare -f function_name` *(function)*
  - `declare -x var=1` 	*(export)*

Conditionals and Flow Control:
------------------------------
#### If-Else Statements
```bash
if [[ expression ]];
then
    # Do Stuff
elif [[ expression ]];
then
    # Do Different Stuff
else
    # Do Other stuff
fi
```
#### && and ||
* With && second part will only work if first part is true
* With || second part will only work if first part is false
* Can condense functionality of If-Else statements
* Example:  
```bash
[ -z $1 ] && echo no argument provided
[ -f $FILE] || echo "$FILE is not a file"
```

#### For-Loops:
* Examples:
```bash
for i in $VARNAME
do 
    #stuff here
done
```
	
```bash
for i in {1..5}; do echo $i; done
```

#### Case Statements
* Example:
```bash
case $VAR in
    yes)
        echo ok
        ;;
    no | nee)
        echo too bad
        ;;
    *)
        echo try again
        ;;
esac
```

#### While-Loops:
```bash
while statement;
do
    # do stuff like up a counter
done
```

#### Until:
```bash
until ((users | grep $1 > /dev/null));
do
    echo $1 is not logged in yet
    sleep 5
done
echo $1 has just logged in
mail -s "$1 has just logged in" root < .
```

#### Select:
* Used for menu interfaces
* Example:  
```bash
select TASK in *;
do
    case $REPLY in
        1)
		    case stuff
			;;
        ...
    esac

    if [ -n "$TASK" ];
    then
        clear
        $TASK
        break
    else
        echo "INVALID"
    fi
done
```

Special Characters
------------------
| Character | Meaning               |
|:---------:|-----------------------|
| ~         | Home Directory        |
| `         | Command substitution  |
| #         | Comment               |
| $         | Variable expression   |
| &         | Background Process    |
| *         | String Wildcard       |
| (         | Start subshell        |
| )         | End subshell          |
| \         | Quote next character  |
| \|        | Pipe                  |
| [         | Start char set wldcrd |
| ]         | End char set wldcrd   |
| {         | Start command block   |
| }         | End command block     |
| ;         | Shell cmd separator   |
| '         | Strong quote          |
| "         | Weak quote            |
| <         | Input redirect        |
| >         | Output redirect       |
| /         | Pathname separator    |
| ?         | Single wildcard char  |


Quoting
-------
* Single/Strong Quotes surrounding a string of characters tells the compiler to ignore any possible syntax and treat it as a pure string
* Double/Weak Quotes treat some but not all characters as special characters.
  - The charaters $ and ` retain their special meaning w/ double quotes.
  - \ retains its special meaning only when followed by one of the following: $, `, ", \, or newline


Handling Arguments
------------------
+ Use `for` loops to evaluate all possible arguments
+ Use `$@` to refer to al arguments provided, where all arguments can be treated 1-by-1
+ Use `$#` to count the amount of arguments provided
+ Use `$*` to get a single string that contains all arguments
+ Interating through all arguments:
```bash
for i in $@
do
    echo $j
done
```
+ First 9 arguments can be called with `$1` through `$9`
    * `$0` is the name of the script itself
+ In bash, curly braces can be used for high number arguments as such: `${10}`
+ In older terminals you must use the shift command
	- This command literally shifts the commands so that `$2` => `$1`, `$3` => `$2`, etc.
	- Use when compatibility is a possible issue 	


Command Substitution
--------------------
+ Allows use of command result in a script and provides flixibility
    * Depricated syntax: ``` `command` ```
    * Preferred syntax: `$(command)`
    * Example:
	  - `cp /var/log/messages /var/log/messages.$(date +%d-%m-&y)`


String Verification
-------------------
+ `test -z` tests if a string is empty
+ `[[..]]` checks for specific patterns
  -Example: `[[ $1=='[a-z]*' ]] || echo $1` does not start with a letter

Here Documents
--------------
+ Here documents are used for I/O redirection to a list of commands
  - Replace echo in long scripts
  - Examples:
```bash
	cat <<End-of-message
	---------------------------
	This is line 1
	This is line 2
	This is line 3
	---------------------------
	End-of-message
```
```bash
	wall <<EndOfMessage
	Vending Options:
	1.	Chips
	2.	Water
	3.	Gum
	EndOfMessage
```
```bash
	lftp localhost <<EndofSession
	ls
	get hosts
	bye
	EndOfSession
```

Substitution Operators
----------------------
`${VAR:-word}`: if `$VAR` exists, use its value, if not, return the value "word". *(does not change value of VAR)*

`${VAR:=word}`: if `$VAR` exists, use its value, if not, set default value to "word".

`${VAR:?message}`: if `$VAR` exists, show its value. If not, display `VAR` followed by `message`. If `message` is omitted, the message `VAR: parameter null of not set` will be shown.

`${VAR:offst:lngth}`:	if `$VAR` exists, show the substring of `$VAR`, starting at the offset continuing for the given length

  Pattern Matching 
------------------
+ Wildcard Operator (`*`): *.txt, filename.*, *part*
  - Ex. rm *.txt
+ Search for pattern from beginning of variable, delete shortest part that matches and return rest: `${VAR#pattern}`
  - Example:
```bash 
FILENAME=/usr/bin/blah
echo ${FILENAME#*/}

# output: usr/bin/blah
```

+ Search for pattern from beginning of variable, delete longest part that matches and return rest: `${VAR##pattern}`
  - Example:
```bash
FILENAME=/usr/bin/blah
echo ${FILENAME##*/}

# output: blah
```

+ Search for pattern from end of variable, delete the shortest part that matches and return the rest: `${VAR%pattern}`
  - Example:
```bash
FILENAME=/usr/bin/blah
echo ${FILENAME%/*}

# ouput: /usr/bin/
```

+ Search for pattern from end of variable, delete the longest part that matches and return the rest: `${VAR%%pattern}`
  - Example:
```bash
FILENAME=/usr/bin/blah
echo ${FILENAME%%/*}

# ouput: --NULL--
```

Regular Expressions
-------------------
+ Search patterns for certain utilities (such as grep, awk, sed, etc.)
+ Should put them between strong quotes or shell doesn't interpret them  

| Regex | Description |
|:-----:|-------------|
| `^text` | Line starts with text |
| `text$` | Line ends with text |
| `.` | Widlcard (matches any single character) |
| `[abc],[a-c]` | Matches a, b, or c |
| `*` | Matches 0 to an infinite number of the previous character |
| `\{2\}` | Matches exactly 2 of the previous character |
| `\{1,3\}` | Match a min of 1 or max of 3 of the previous character |
| `colou?r` | Match 0 or 1 of the previous character (make prev char optional) |


Calculation
-----------
+ Internal bash calculation: `$(( 1 + 1 ))`
+ External calculation with `let`:
  - not capable of using decimals
```bash
#!/bin/bash
#$1 is first number $2 is operator, and $3 is second number
let x="$1 $2 $3"
echo $x
```
+ External calculation with `bc`:
  - Calculator with its own shell interface
  - Expensive since it is an external command
  - Can deal with decimals
  - Use in non-interactive mode:
	`echo "scale=9; 10/3" | bc`
  - Or use in a variable
	`VAR=$(echo "scale=9; 10/3" | bc)`

Working with Options
--------------------
+ `getopts` is a special term to get options
+ `:` deliminates option which needs to be followed by an argument
	+ Example:
```bash
while getopts "abc:" opt;
do
    case $opt in
        a ) VAR1=-m ;;
        b ) VAR2="-g 100" ;;
        c ) VAR3="-s $OPTARG" ;;
        * ) echo `usage: makeuser [-a] [-b] [-c shell] username` ;;
    esac
done
```

Functions
---------
+ Must be defined before they can be used
+ Approach 1:
```bash
function help
{
    echo "Add some script"
}
```
+ Approach 2:
```bash
help ()
{
    echo "Add some script"
}
```
Call function by using function name (by itself)  
E.g. `help`

Arrays
------
+ Modern Bash can also support multiple values in a single variable
  + Example:
```bash
names=(linda lisa laura lori)
names[0]=linda
names[1]=lisa
```
+ Show everything in the array: `echo $(names[@])`
+ Show number of elements in the array: `echo $(#names[@])`

Include Files
-------------
+ Used to separte dynamic code from static code (i.e. static variable declarations)
+ Makes scripts more portable and readable
+ Include with `source` or the `.` command
`. /etc/init.d/functions`

Security Tips
-------------
+ Design before you write a script
+ Always quote user input
+ Never use eval (user can open a subshell)
+ Protect the `$PATH` variable
+ Use full command names

`time:`
-----
+ Show excecution time of a script
  - Useful to help optimise runtime

`strace:`
---------
+ Will show all the system calls made by a script
+ Using `-c` will count number of systcalls and show completion time
  - Helpful for deducing which command is more efficient