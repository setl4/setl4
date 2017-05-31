
### SETL4 - raw power and speed of SPITBOL for non-numeric computing using set theory


## Utility Functions

In addition to the set-theoretic functions defined in _setl4.stl_, SETL4 provides
the following utility functions.

even(n)                     Tests if _n_ is even
factorial(n)                Returns n!  = n * (n -1) * ... * 1
multiple(n,m)               Tests if _n_ is a multiple of _m_
number(n)                   Returns _n_ as one or two words if possible, else returns _n_
odd(n)                      Tests if _n_ is odd
prime(n)                    Tests if _n_ is prime
primes(n)                   Returns set of primes less than _n_
square.root(n)              Returns integer square root on _n_
thousands(s)
append(str,w,ch)            Appends _ch_ (or space if _ch_ is null) to _str_, then appends _w_
ascii(line)                 Returns the text of line with every ascii character identified
datename(date)              Returns string based on current time suitable for use as filename
digits()                    Returns list of digits: '0 1 2 .. 9'
frequency(str)              Returns map giving frequency of characters in _str_
letters()                   Returns list of letters : 'a b c ... z A B ... Z''
less(str,sub)               Removes the first instance of each character in _sub_ from _str_,
lletters()                  Returns list of lower case letters : 'a b c ... z'
lower(s)                    Returns _s_ with upper case letters replaced by lower case equivalent
out(text1,text2,text3)      Outputs _text1_, then _text2_ enclosed in '[]' if _text2_ not null,
                        then _text3_ if _text3_ is not null.
prefix(str,pre)             Takes a list of space-separated words in _str_ and prefixes each
                        with the string _pre_
reader(filename,expr)       Returns sequence of lines in file _filename_, using _expr_ (if given)
                        to filter out lines to be ignored.
reader(str,delim)           Like _reader(filename..)_ but reads lines from a string with lines
                            separated by delimiter _delim_
slice(str,first,last)       Same as SPITBOL _substr(str,first,last)_
tokens(line)                Returns sequence of the tokens in _line_
uletters()                  Returns list of upper case letters : 'A B C ... Z''
upper(s)                    Returns _s_ with lower case letters replaced by upper case equivalent
writer(lines)               Writes sequence _lines_ to standard output.

SETL4 is an implementation of SETL written in SPITBOL.


What is SPITBOL?

SNOBOL is a general programming language with special emphasis on processing 
strings and text that was  developed at Bell Labs in the 1960's by a team 
led by Ralph Griswold. The final version was called SNOBOL4.

Macro SPITBOL, or SPITBOL, is a very efficient implemenation of SNOBOL4.
Created by Robert B. K. Dewar and Ken Belcher in 1969, SPITBOL/360 
was written in IBM/360 assembly language, in what Dewar called
"aggressive assembly."

For example, SNOBOL4 requires maintaining a count of the number of 
statements executed and the ability to stop execution when a specified 
number of statements have been executed.  SPITBOL/360 does this by
computing an unnormalized floating point constant such that successive 
increments result in floating point overflow when the limit is reached.

Dewar and Belcher also wrote Realia COBOL, a COBOL compiler for Intel/x86 
written in COBOL. It produced very efficient code, better
code than, for example, that produced by IBM's product COBOL compiler.

Dewar ported SPITBOL/360 to several machines. Dewar joined the CIMS faculty
as a Professor in the early 1970's. In 1973, while working
with Anthony P. "Tony" McCann of Leeds University, he developed
Minimal, a portable assembly language. Dewar and McCann then rewrote
SPITBOL in Minimal, producing Macro SPITBOL, or SPITBOL. 
The implementation has proved very stable, with few changes in
several decades.

Macro SPITBOL is remarkably small. The code consists of about 28,000
lines: 2000 lines of comments defining Minimal, 5000 lines of constant/data 
declarations, and 21,000 lines of code.  Every line has a comment.
The executable for x86 Linux is 144 kilobytes.

SPITBOL was implemented for many machines and operating systems by
a small team that included Steve Duff, Mark Emmer, Bob Goldberg, and Dave Shields:
ICL 1900, Univac, CDC 6600, IBM PC, Apple Macintosh, SUN Solaris Sparc, 
Microsoft (DOS/NT/Windows), Intel x86_64 (Unix/Linux), and x86_64 Apple iOS.  
Special credit is due Mark Emmer, who led the project from the mid 1980's
to 2009. Dave Shieldsl has maintained SPITBOL since then.


What is SETL?

SETL (SET Language)  is  a programming language with  finite sets as 
the fundamental data type. It was created by Jacob T. "Jack" Schwartz 
of the Courant Institute of Mathematical Sciences (CIMS) of New York 
University (NYU).

Jack founded the SETL project in 1970. It was later funded by two 
five-year grants from the Office of Naval Research.

SETL was used to write NYU Ada/Ed, the first validated Ada compiler.
Devloped on the DEC Vax 11/780, Ada/Ed was ported to the IBM PC (DOS)
by a team led by Dave Shields.


Why the name SETL4?

The SETL Project produced three implementations of SETL. The first was
written by Dave Shields in BALM, a language developed by Prof. Malcom 
Harrison of CIMS, the second by Henry S. "Hank" Warren in PL/I while on 
leave from IBM, and the third by Robert B. K. Dewar and Art Grand in LITTLE,
a low-level implementation language developed at CIMS.

SETL4 is the fourth implementation of SETL produced by a member 
(Dave Shields) of the NYU SETL project, hence the name SETL4.


Brief Introduction to SETL4

SETL4 extends SPITBOL by adding the datatype _set_ to represent
finite sets. 

For example, the folowing SETL4 expression determines if the integer _P_ is prime:

    !exists(|'int 2 P' @ 'multiple(P,this)')

where _multiple(a,b) is true if and only if _a_ is a multiple of _b_.

Sets in SETL4

SETL4 provides several kinds of sets.

Sets of kind 'set' are a collection of distinct members.

Sets of kind 'map' consist of a series or ordered pairs,
called entries. The first element of an enter is the key,
the second is the value.  No two entries in the map can 
have the same key but different values.

Sets of kind 'iterator' consist of positive integers of the form

low, low + step, ... high

For example 'iterator 5 25 5' is the set {5 10 15 20 25}.
Iterators support efficient iteration, and suppor only the
operations of iteration and membership.

Sets of kind 'integer' define a map on the positive integers.
The members usually, but not necessarily consist of a sequence
of integers with no gaps; for example 'sequence 5' is a map defined
on 1, 2, ... 5.

Sets of kind 'sequence' ('seq') are a map defined on a set of positive integers
that usually, but not necessarily, consists of a consecutive sequence of integers.

Sets of kind 'string' consists of a map from integers to characters.

By convention, the kinds are writtten 'int', 'iter', 'map', and 'set'.

Additonal SETL4 data types

SETL4 provides the following data types in addtion to _set_: 

_entry_   _line_   _token_

where 

entry(key,value)            is an entry in a map;
line(mark,text)             is a line of text and an associated mark (tag); and
token(lineno,ndx,type,text) is a lexeme, or lexical token.


SETL4 Global variables


setl4.ascii.name = 
setl4.ascii.value =  
setl4.random_var =

Useful patterns

setl4.any.digit         =   any('0123456789')
setl4.span.digits       =   span('0123456789')
setl4.break.digit       =   break('0123456789')

setl4.break.letter      =   break(&lcase &ucase)
setl4.any.letter        =   any(&lcase &ucase)
setl4.span.letters      =   span(&lcase &ucase)
setl4.span.spaces       =   span(' ' char(9))
setl4.break.space       =   break(' ' char(9))

setl4.any.word          =   any(&lcase &ucase '0123456789')
setl4.span.word         =   span(&lcase &ucase '0123456789')


SETL4 Functions

abbrev(a,b)                     Test that the first operand is an initial substring of the second.
add(set,elem)                   Adds element to set
and(a,b)                        And: Tests if both operands are true
arb(n)                          Returns arbitary (randomly chosen) integer in 1 .. _n_
arb(set)                        Returns arbitary (randomly chosen) element of _set_
assert(expr)                    Tests that _expr_ is true, ends execution otherwise
assert.type(obj,type)           Tests that _obj_ has SPITBOL datatype _type_, ends execution otherwise
at(set,expr)                    Evaluates _expr_ for for current iterate of _set_
join(a,b)                       Joins two strings into a single string by concatenating them
defined(map,key)                Tests if a map is defined for a specified key
difference(a,b)                 Returns set of members of set _a_ not in the set _b_
domain(map)                     Returns set of elements in the domain of a map
equal(a,b)                      Tests if two SETL4 objects are equal
exists(set,expr)                Tests if an expression is true for at least one element in a set
from(set,elem)                  Returns set consisting of the members of a set except a specified member
get(map,key)                    Gets the value of map _map_ for _key_ for a map
get(set,i)                      Gets the i-th element in a set, or fails if no such element
false(e)                        tests if argument is false
forall(set,expr)                Tests if an expression is true for every element of a set
filter(set,expr)                Filter:; returns subset of _set_ for which _expr_ is true
int(s)                          Returns integer defined by _s_
integers(n)                     Returns set of integers 1 ... n
intersection(a,b)               Returns set of elements common to two sets
loop(set)                       Set up iteration over _set_ using _next_
mark(line)                      Annotates, or marks, a line
member(elem,set)                Tests set membership
new(str)                        Returns new set specified by _st_
next(set)                       Returns next element in iteration defined by prevous _loop_, fails if no more elements
not(expr)                       Not: Tests if operand is false
or(a,b)                         Or: Tests if either operand is true
push(stack,value)               Push value onto a stack
pop(stack)                      Pop the top of a stack
put(map,key,val)                Defines the value of a map key
random(n)                       Returns random element
random.seed()                   Sets random number seed to initialize _random_
range(map)                      Returns set of elements in the range of a map
rank(set)                       Returns the rank, or normal form, of a set or string.
subset(a,b)                     Tests if the second set is a subset of the first set
union(a,b)                      Returns set consisting of all the members in two sets
set.size(set)                   Returns number of elements in set _set_
traceoff()                      Turns off tracing
show(v,lvl)                     Show value of _v_, with _lvl_ set non-zero when listing member of set
show.b(e)                       Show value of _b_ as boolean
show.line(line)                 Show string _line_ with spaces replaced by '.'
show.lines(lines,title)         Show non-empty lines in array of lines, with title 'title'
show.q(str)                     Show string enclosed in appropriate quote character (" or ') 
show.words(words)               Show a sequence of words, separated by space character
traceon()                       Turns on tracing
this(set)                       Returns current iteration value for _set_
true(e)                         Tests if operand is true
visit(set,expr)                 Visits each element of set _set_ and evaluates _expr_ for that element
words(str)                      Returns sequence of words, separated by spaces, in a string,


Set Data Type
-------------

A set is defined by the following datatype:

data('set(set.index,set.key,set.kind,set.size,set.next,set.low,set.high,set.max,set.step,set.text,set.seq,set.this)')

where

    _set.index_         a SPITBOL table used to map the integer
                        id assigned each element to the value of the element.
                        It is used to support fast iteration.

    _set.key_           a SPITBOL table mapping set elements to index entries.

    _set.kind_          is the kind of the set, one of 'set', 'map', 'int, 
                        'seq'. The kind is  specified when the 
                        set is created. The default value is 'set'.

    _set.size_          the current number of members.

    _set.next           is iteration index when iterating over set
                        when iterating over a 

    _set.low_           lower bound of _int_ 

    _set.high_          upper bound of _int_ 

    _set.step_         number of values between members of set of kind _int_.

    _set.text_          is the text of the set of kind _str_

    _set.this           the last value returned by the _next_ primitive

    _set.max'           maximum number of elements. This applies to sets of kind 'integers'.

## Sets of integers

SETL4 sets of kind _integers' provide an efficient implementation of a set of 
integers, in the form of a string such that an integer _i_ is in the set only
if the i-th character of the string is '+'. The string is represented by a 
table in blocks of 100 characters, so that the first block represents the integers 
1 .. 100, and so forth. New chunks are allocated only when necesary.  The SPITBOL 
function BREAK is used to find the next element in the set when iterating over the set.

## Maps

In mathematics, a map defined on a finite set is a set of 
ordered pairs, or entries,  that define a relation between the 
first element of an entry, its _key_, and the second element 
of the entry, the value of the map for _key_.

data('entry(key,value)')

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

SETL4 also provides the datatype _stack_ that implements a stack, providing
the funcitons _push_ and _pop_. Stacks are created by the function _new.stack_.

data('stack(stack.stack,stack.top)')


