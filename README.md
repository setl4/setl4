
# SETL4 - A New Implementation of SETL

 # SETL4 - An Implementation of SETL Written in SPITBOL


 ## What is SPITBOL?

    SNOBOL is a general purpose programming language with special emphasis
    on processing strings and text that was developed at Bell Labs in the
    1960's by a team led by Ralph Griswold. The final version was called SPITBOL4.

    Macro SPITBOL, or SPITBOL, is a very efficient implementation of SNOBOL4.
    Created by Robert B. K. Dewar and Ken Belcher in 1969, SPITBOL/360
    was written in IBM/360 assembly language, in a style Dewar termed
    "aggressive assembly." That is, using every trick in the book to write
    the fastest, most compact, code possible.
 
    For example, SNOBOL4 requires maintaining a count of the number of
    statements executed and the ability to stop execution when a specified
    number of statements have been executed.  SPITBOL/360 does this by
    computing an unnormalized floating point constant such that successive
    increments of it result in floating point overflow when the limit is reached.

    Dewar and Belcher also wrote Realia COBOL, a COBOL compiler for Intel/x86
    written in COBOL. It produced very efficient code, better code than,
    for example, that produced by IBM's product COBOL compiler.

    Dewar ported SPITBOL/360 to several machines. Dewar joined the faculty
    of the Courant Institute of Mathematical Sciences (CIMS) of New York
    University (NYU) as a Professor in the early 1970's. In 1973,
    while working with Anthony P. "Tony" McCann of Leeds University,
    Dewar created Minimal, a portable assembly language. Dewar and
    McCann then rewrote SPITBOL in Minimal, resulting in Macro SPITBOL,
    or SPITBOL. The implementation has proved very stable, with only
    minor changes in the last several decades.

    Macro SPITBOL is remarkably small. The code consists of about 28,000
    lines: 2000 lines of comments defining Minimal, 5000 lines of constant/data
    declarations, and 21,000 lines of code.  Every line of code has a comment.
    The executable for x86 Linux is less than 150 kilobytes.

    SPITBOL was implemented for several machines and operating systems by
    a small team that included Steve Duff, Mark Emmer, Bob Goldberg, and Dave Shields:
    ICL 1900, Univac, CDC 6600, IBM PC, Apple Macintosh, SUN Solaris Sparc,
    Microsoft (DOS/NT/Windows), Intel x86_64 (Unix/Linux), and x86_64 Apple iOS.
    Special credit is due Mark Emmer, who led the project from the mid 1980's
    to 2009, when Dave Shields became the maintainer of SPITBOL.

    SETL4 requires a modified version of standard SPITBOL called SPITBOL4.
    SPITBOL4 differs from standard SPITBOL as follows:
 
 -  There is no automatic case folding. In standard SPITBOL the names 'x' and 'X' are the same;
    they are different in SPITBOL4.
 -  The default case is lower case.
 -  The function _set()_ has been renamed to _zet_, so that _set_ can be used as an identifier.
 -  The default value of _&anchor_ is 1. The default value of _&trim_ is 1.

    The file `bin/setl4' provided as part of the distribution is the executable for _spitbol4_.

 ## What is SETL?

    SETL (SET Language)  is  a programming language with  finite sets as
    the fundamental data type. It was created by Jacob T. "Jack" Schwartz
    of the Courant Institute of Mathematical Sciences (CIMS) of New York
    University (NYU).

    Jack founded the SETL project in 1970. It was later funded by two
    five-year grants from the Office of Naval Research.

    SETL was used to write NYU Ada/Ed, the first validated Ada compiler.
    Devloped on the DEC Vax 11/780, Ada/Ed was ported to the IBM PC (DOS)
    by a team led by Dave Shields.


 ## Why the name SETL4?

    The SETL Project produced three implementations of SETL. The first was
    written by Dave Shields in BALM, a language developed by Prof. Malcom
    Harrison of CIMS, the second by Henry S. "Hank" Warren in PL/I while on
    leave from IBM, and the third by Robert B. K. Dewar and Art Grand in LITTLE,
    a low-level implementation language developed at CIMS.

    SETL4 is the fourth implementation of SETL produced during the course of
    the SETL Project.  Dave Shields wrote the first implementation. This was
    followed by two more implementations. This is the fourth implementation
    written by a member of the SETL project,  hence the name SETL4.


 ## Brief Introduction to SETL4

    SETL4 extends SPITBOL by adding the datatype _set_ to represent finite sets.

    A set is a collection of distinct elements: for example,  _{a,b,c}_ is a set,
    as is _{a,b,c,a}_; however, _{a,b,c,a}_ has only three elements, and is
    equal to _{a,b,c}_.

    For example, the folowing SETL4 expression determines if the integer _P_ is prime:

            !exists(|'int 2 P' @ 'multiple(P,this)')

    where _multiple(a,b)_ is true if and only if _a_ is a multiple of _b_.

 ## Sets in SETL4

    SETL4 provides several kinds of sets.

    Sets of kind 'set' are a collection of distinct members.

    Sets of kind 'map' consist of a series or ordered pairs,
    called entries. The first element of an entry is the key,
    and the second is the value.  No two entries in the map can
    have the same key but different values.

    Sets of kind 'iterator' consist of  integers of the form
 ```
    low, low + step, ... high
 ```

    or

 ```
    high, high - step ... low
 ```

    If only _low_ is specified, then the iteator is interpreted as 'iterator 1 low'.
    For example, 'iterator 100' is the set 1, 2, ... 100.
    and 'iterator 5 25 5' is the set {5 10 15 20 25}; where
    iteration over the iterator will go in order 5, 10 ... 25.
    'iterator 25 5 -5' is the same set; but iteration will
    go in the order 25,20 ... 5.
 
    If _high_ is less than _low_, then a negative step is undersood,
    even if it is given as a positive value. For example, both
    `iter 25 5 -5` and `iter 25 5 5' go in order "25, 20 ... 1"

    Iterators support efficient iteration, but they provide only
    the operations of iteration and membership; you cannot
    add or remove an element from an iterator.

    Sets of kind 'integer' are intended or sets of integers
    containing many elements. See below for more details.

    A sequence is a map defined on a set of consecutive positive integers.
    For example 'sequence 5' is a map defined on 1, 2, ... 5.

    Sequences are represented in the same way as a map. They differ from a map only
    in that iteration over a sequence returns the values of the sequence, not the
    instances of _entry_ that are returned when iterating over a map.

    By convention, the kinds are writtten 'int', 'iter', 'map', 'seq', and 'set'.


 ## Sets of integers

    SETL4 sets of kind _integers' provide an efficient implementation of a set with
    many non-negative integers, such as  a set with more than a million integers.
 
    The set is represented by a table of strings, each with  _setl4.config.int_ characters,
    so that the first block represents the integers `0 .. _setl4_config.int_ -1 and so forth.
    Addition to  the set is done by setting the appropriate character in a block to '+'.
    New blocks are allocated only when necesary.

    The SPITBOL function BREAK is used to find the next element
    in the set when iterating over the set.

 ## Ordered Pairs

    In set theory, sets are not ordered. The set _{a,b}_ is the same as (equal to)
    the set _{b,a}_.

    Although sets are not ordered, sets can be used to define an ordered pair:

    data('pair(first,second)')

    by defining _pair(a,b)_ to be
 
        _{a,{a,b}}_
 
    It is easy to prove that, given this definition, _pair(a,b)_ is equal
    to _pair(c,d)_ if and only if _a_ is equal to _c_ and _b_ is equal to _d_.


 ## Maps

    A map defined on a finite set is a set of ordered pairs,
    or entries, that define a relation between the first element of an entry,
    its _key_, and the second element of the entry, the value of the map for _key_.

    data('entry(key,value)')

    A set of ordered pairs is a map if and only if there do not exist two entries
    _entry(a,b)_ and _entry(c,d)_ such that _a_ is equal to _c_ and _b_ is not equal to _d_.
    For example, the map defined by the set _{[one,1],[2,two],[one,1]}_ is valid, but
    one cannot define a map based on the set _{[one,1],[2,two],[one,3]}_.

    However, SETL4 does allow the use of a set of pairs that would not
    be allowed in stanard set theory to define a map. If two of more pairs
    have the same first value, the the last such pair encountered defines the
    value to be used. For exampe, the set _{entry(one,1),entry(2,two),entry(one,3)}_ produces
    the same map as _{entry(one,3),entry(2,two)}_.

    Though you can use _entry to give a key and its associated value, the
    preferred convention is separate a key and its value with a colon.
    allows you to write "key:value," 
 ```
        new('map' one:1 two:2 three:3')

 ```

    instead of

 ```
        new('map' entry('one',1) ' ' entry('two',2) ' ' entry('three',3) )
 ```

    Though in set theory, maps are defined in terms of sets, in the SETL4
    implementation, sets are represented are maps, by mapping each element
    to itself. For example, the set _{a,b,c}_ is kept as the map: {a:a,b:b,c:c}.

    SETL4 supports adding entries to a set of kind _map_ by using the
    key and value in the entry to define the value of the map for _key(entry)_
    to be _value(entry)_.

    The SPITBOL datatype TABLE provides the machinery to implement maps.
    SPITBOL provides no way to determine the number of entries in a table
    other than converting the map to an array. This is the only way in
    SPITBOL to iterate over a SPITBOL table.

    For this reason, maps are implemented using two tables: _index_ and _key_.
    Each new entry added to a map is given an integer id, starting with one.
    The field _index_ maps the id's to the associated pairs.
    The entries in _index_ allow efficient iteration over the
 
    The table _key_ maps keys in the map to the corresponding entry in the map.
    The entries in _key_ permit efficient retrieval of the map's value for a given key.

    SETL4 supports stacks by implementing them as a sequence. The fuction
    _push()_ pushes a value on to the stack; the function _pop_ removes the
    top value.


 ## Loops, Iterators

    Loops in SPITBOL have the form of a test followed by the loop body,
    with the body ending with a branch back to the test.

   For example, here is a loop that prints the first one hundred integers:

 ```
 test
        i = i + 1
        le(i,100)                       :f(done)
        output = i                      :(test)
 done
 ```

    This can also be written as:

 ```
 test
        output = le(i = i + 1,100) i    :s(test)
 ```

    Loops in SETL4 are constructed using the _loop_ and _next_ statements.

    A loop has the form:

 ```
        loop(set,thisname)
 
    set.next
        var = next(set)     :f(set.done)
        out(this)           :(set.next)
    set.done
 ```

    The first operand specifies of _loop_ gives the set or range of values
    of the iteration.  The optional second argument names a variable that is
    updated as part of successful call to _next_.  The name _this_ is used
    if the second argument is not given. The _loop_ statement above can be
    written as _loop(set)_ or also _loop(set,.this)_ or _loop(set,'this').
 
    Loops can have a specific variable associated with a loop.

 ```
        loop(set,.this.s)
        ...
    set.next
        next(set)           :f(set.done)
        out(this.s)         :(set.next)
    set.done
 ```

    The _loop_ statement creates an instance of _iterator_ to control the
    iteration. The _next_ statement advances the iteration by producing the
    next element or failing if no more elements remain.

    See the functions _prime_ and _primes_ defined below to see _loop_
    and _next_ in action. See also the code for _exists_ and _forall_.

 ## Showing Values

    Use the function _show()_ to display the value of a SETL4 or SPITBOL object

    Sets are listed with the values enclosed in '{}'.
    Sequences of ten or fewer elements are listed with the
    values enclosed in '()'. Sequences of more than ten elements
    are listed with the index and value enclosed in '[]').
    Pairs and entries are listed with the component values enclosed in '()'.

 ## Additional Operations Provided as an Artifact of the Implementation

    The use of the tables _set.index_ and _set.key_ to implement a set makes it
    possible to provide some operations not available in in standard set theory.
    For example, it is possible to retrieve elements using the function _get_.
    _Get(s,i)_ retrieves the i-th element in the set.

    The function _sorter_ can be used to determine the order in which the elements
    of a set are accessed during an iteration, or to 'sort' the tables implementing
    the set. For example, _sorter(s,'+v')_ sorts a map in increasing order of the
    values of the map. _sorter(s,'-v')_ sorts the values in descendng order, and
    so forth. For example, here is the code to find the ten members with
    the largest values in a map:

 ```
        sorter(map,'-v')
        largest = new('set')
        iter = new('iter 1 10')
        loop(set)
 
    largest.add
 
        add(largest,next(set))               :s(largest.add)
 ```

    _Sorter_ is used by the _show_ function to display the values of a set or
    map in a standard order. For example, if _s_ is a set with the elements
    'a', 'b' and 'c', then _show(s)_ yields `set 'a' 'b' 'c' }`, not
    `set 'b' 'c' 'a' }`.
 ## SETL4  Operator Symbols

    SETL4 provides the following operator symbols:
 
    _#s_        returns the size of a string or set _s_
    _x ~ s_     tests if _x_ is member of set _s_
    _s @ e_     is equivalent to _filter(s,e)
    _=s_        returns the value of the iteration variable (usually 'this') of a loop.

    For example, _member(x,s)_ can be written _x ~ s_, _set.size(x)_ can be written
    _#s_, and _filter(s,e)_ can be written _s @ e_.

 ## Sample data

    Programs need data. Since SPITBOL is designed to analyze and manipulate text, SETL4 provides
    a library consisting of several works chosen from the world's greatest literature, including
    the works of William Shakespeare, a dictionary, and the text of the King James version
    of the Bible. Except for the dictionary, all texts were obtained using Project Gutenberg.

    As an extension of SPITBOL, SETL4 brings the raw power and speed of SPITBOL to the task
    of working with text. Additional functions are provided, including a lexical scanner, or
    tokenizer, to assist in performing deep, detailed analysis of textual structure.

    Several of these functions have as their purpose the translation of text into sets, maps,
    and sequences. For example, the tokenizer returns a sequence consisting of the tokens
    in a line of text.

    In order to be able to use the program ./examples/align.stl to align the
    goto fields in the source, use the variable _char(58)_ where
    the colon character enclosed in quotes would normally be used.

 ## SETL4 Functions

    SETL4 provides the following functions:
 
 -  add(set,elem)               Adds element to set.
 -  and(a,b)                    Tests if both operands are true.
 -  append(str,w,ch)            Appends _ch_ (or space if _ch_ is null) to _str_, then _w_
 -  arbitrary(n)                Returns arbitary (randomly chosen) integer in 1 .. _n_.
 -  arbitrary(set)              Returns arbitary (randomly chosen) element of _set_.
 -  ascii(line)                 Returns the text of line with every ascii character identified
 -  assert(expr)                Tests that _expr_ is true, ends execution otherwise.
 -  assert.type(obj,type)       Tests that _obj_ has SPITBOL datatype _type_, ends execution otherwise.
 -  begins(str,sub)             Tests if string _str_ begins with string _sub_.
 -  binary(n)                   Returns string with value of _n_ in binary number.
 -  checkout(filename)          Returns ('checks out') set or map defined by a text file from the libary
 -  compare(a,b)                Compares two integers or strings, returning -1 (less), 0 (equal), or +1 (greater).
 -  compose(a,b)                Returns composition of two maps or tables.
 -  datename(date)              Returns string based on current time suitable for use as filename.
 -  defined(map,key)            Tests if a map is defined for a specified key.
 -  difference(a,b)             Returns set of members of set _a_ not in the set _b_.
 -  domain(map)                 Returns set of elements in the domain of a map.
 -  equal(a,b)                  Tests if two SETL4 objects are equal.
 -  even(n)                     Tests if _n_ is even.
 -  exists(set,expr)            Tests if an expression is true for at least one element in a set.
 -  factorial(n)                Returns n!  = n * (n -1) * ... * 1.
 -  frequency(s)                Returns frequency of values in sequence, map or string _s_.
 -  from(set,elem)              Returns set consisting of the members of a set except a specified member.
 -  get(map,key)                Gets the value of map _map_ for _key_ for a map.
 -  get(set,i)                  Gets the i-th element in a set, or fails if no such element.
 -  false(e)                    Tests if argument is false.
 -  filter(set,expr)            Returns set of elements in _set_ for which _expr_ is true.
 -  forall(set,expr)            Tests if an expression is true for every element of a set.
 -  integers(n)                 Returns set of integers 1 ... n.
 -  intersection(a,b)           Returns set of elements common to two sets.
 -  is.plain(s)                 Tests if _s_ is plain type: integer, name, real, or string.
 -  join(a,b)                   Joins two strings into a single string by concatenating them.
 -  less(str,sub)               Removes the first instance of each character in _sub_ from _str_,
 -  longest(set)                Returns the longest string in a set.
 -  loop(set,this)              Set up iteration over _set_ using _next_. _this_ names variable updated during iteration.
 -  tolower(s)                  Returns _s_ with upper case letters replaced by lower case equivalent.
 -  minimum(set)                Returns the shortest string in a set.
 -  multiple(n,m)               Tests if _n_ is a multiple of _m_.
 -  odd(n)                      Tests if _n_ is odd.
 -  out(text1,text2,text3)      Outputs _text1_, then _text2_ enclosed in '[]' if _text2_ not null.
 -  pack(seq)                   Packs sequence of strings into single string.
 -  plain(v)                    Returns string representing a plain type, per is.plain().
 -  powerset(set)               Return the powerset of _set_, the set of all the subsets of _set_.
 -  prefix(str,pre)             Takes a list of space-separated words in _str_, prefixes each with _pre_.
 -  product(seq)                Returns (Cartesian) product of a sequence of sets.
 -  member(set,elem)            Tests if _elem_ is a member of _set_.
 -  new(str)                    Returns a new set specified by _str_.
 -  next(set)                   Returns next element in iteration defined by prevous _loop_, fails if no more elements.
 -  not(expr)                   Tests if operand is false.
 -  number(s)                   Returns integer defined by _s_.
 -  or(a,b)                     Tests if either operand is true.
 -  push(stack,value)           Push value onto a stack.
 -  pop(stack)                  Pop the top of a stack and return its value.
 -  prime(n)                    Tests if _n_ is prime.
 -  primes(n)                   Returns set of primes less than _n_.
 -  put(map,key,val)            Defines the value of a map key.
 -  quicksort(seq)              Use Hoare's quicksort algorithm to sort a sequence.
 -  random(n)                   Returns random integer if _n_ is integer, elsel random element of set or map.
 -  random.seed()               Sets random number seed to initialize _random_.
 -  range(map)                  Returns set of elements in the range of a map.
 -  reader(filename,expr)       Returns sequence of lines in file _filename_, using _expr_ (if given).
 -  reader(str,delim)           Like _reader(filename..)_ but reads lines from a string with lines.
 -  remove(set,elem)            Removes arbitary element from set, or most recent entry from map.
 -  #set               Returns number of elements in set _set_.
 -  show(v)                     Shows value of _v_.
 -  show.plain(v)               Same as _show()_, but strings are not enclosd in quotes.
 -  show.b(e)                   Shows value of _b_ as boolean.
 -  show.lines(lines,number)    Shows a sequence of lines, with id if _number_ not null.
 -  slice(str,first,last)       Like SPITBOL substr to work for sequences and tuples.
 -  sorter(set,type)            Sorts a set, map or string according to _type_.
 -  split.line(line)            Splits line of blank-separated words into sequence.
 -  split.string(str)           Splits string into sequence of characters.
 -  square.root(n)              Returns integer square root on _n_
 -  subset(a,b)                 Tests if the set _b_  is a subset of set _a_
 -  this(set)                   Returns current iteration value for _set_.
 -  thousands(s)                Returns _s_ with a comma every three spaces from the right.
 -  top(s)                      Returns top element of sequence viewed as stack.
 -  traceon()                   Turns on tracing.
 -  traceoff()                  Turns off tracing
 -  tokens(line)                Returns sequence of the tokens in _line_.
 -  true(e)                     Tests if operand is true.
 -  union(a,b)                  Returns set consisting of all the members in two sets.
 -  unpack(str)                 Unpacks string into sequence of its characters.
 -  toupper(s)                  Returns _s_ with upper case letters replaced by lower case equivalent.
 -  visit(set,expr)             Visits each element of set _set_ and evaluates _expr_ for that element.
 -  words(line,w)               Returns sequence of words (defined by _w_) in _line_.
 -  writer(lines)               Writes sequence _lines_ to standard output.

##  Installing SETL4
Here are the instructions on how to install Linux on a Chromebook, tested on the
Chromebook I use:   ACER Chromebook 14  CB3-431.

Use Google to search for 'crouton' and go there. This is the 'crouton' program for
installing Linux alongside the standard Chrome OS. This requires installng the
crouton extension, downloading the crouton program, and then installing your
desired Linux variant.

I use lxde, as disk space on Chromebook is limited, and lxde has small footprint.

```
  sudo sh ~/Downloads/crouton -t xiwi,lxde

```

This will run for a while and them seem to stop. However, if you look
closely, you will find that Crouton is waiting for you to enter a username.
(This is not immediately obvious, as the question is displayed in dark
colors against an even darker background.)

You should install the the following useful programs:

```
  meld - visual file comparator
  okular - reader for PDF files
  git - to clone the SETL4 system from github.

Going forwrd, access Linux as follows:

From Chrome OS, type 
```
        ctrl-alt-t
```
to open shell

Type
```
    sudo startlxde
```
to start lxde

You can now switch between lxde and Chrome OS using
```
    ctrl-alt-tab-back
```
or
```
    ctrl-alt-tab-forward
```

where 'back' is the back arrown key, the second from left on top row, and
'forward' is the forward rrow key, the third from left on the top row.

Good luck. Away you go ...

