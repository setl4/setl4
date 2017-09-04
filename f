## SETL4 Functions

   SETL4 provides the following functions:

### Core functions

-  add(set,elem)            Adds element to set.
-  equal(a,b)               Tests if two SETL4 objects are equal.
-  member(elem,set)         Tests if _elem_ is a member of _set_.
-  new(str)                 Returns a new set specified by _str_.
-  set.size(s)              Returns number of elements in set. Can also be written as _#set_.

### Output / Show

-  out(text1,text2)         Outputs _text1_, then _text2_ enclosed in '[]' if _text2_ not null.
-  show(v)                  Show value of _v_.

### Iteration

-  loop(set,this)           Set up iteration over _set_ using _next_. _this_ names variable updated during iteration.
-  next(set)                Returns next element in iteration defined by prevous _loop_, fails if no more elements.
-  this(set)                Returns current iteration value for _set_.

### Set functions

-  arbitrary(x)             Returns arbitary element of set or random integer, according to type of _x_.
-  difference(a,b)          Returns set of members of set _a_ not in the set _b_.
-  exists(set,expr)         Tests if an expression is true for at least one element in a set.
-  filter(set,expr)         Returns set of elements in _set_ for which _expr_ is true.
-  forall(set,expr)         Tests if an expression is true for every element of a set.
-  integers(n)              Returns set of integers 1 ... n.
-  intersection(a,b)        Returns set of elements common to two sets.
-  powerset(set)            Return the powerset of _set_, the set of all the subsets of _set_.
-  product(seq)             Returns (Cartesian) product of a sequence of sets or strings.
-  sorter(set,type)         Sorts a set, map or string according to _type_.
-  subset(a,b)              Tests if the set _b_  is a subset of set _a_
-  union(a,b)               Returns set consisting of all the members in two sets.
-  visit(set,expr)          Visits each element of set _set_ and evaluates _expr_ for that element.

### Maps

-  compose(a,b)             Returns composition of two maps or tables.
-  defined(map,key)         Tests if a map is defined for a specified key.
-  domain(map)              Returns set of elements in the domain of a map.
-  get(map,key)             Gets the value of map _map_ for _key_ for a map.
-  put(map,key,val)         Defines the value of a map key.
-  range(map)               Returns set of elements in the range of a map.

### Sequences
-  pop(stack)               Pop the top of a stack and return its value.
-  push(stack,value)        Push value onto a stack.
-  slice(str,first,last)    Like SPITBOL subst, also works for sequences and tuples.
-  top(s)                   Returns top element of sequence viewed as stack.

### Boolean functions

-  and(a,b)                 Tests if both operands are true.
-  false(e)                 Tests if argument is false.
-  not(expr)                Tests if operand is false.
-  or(a,b)                  Tests if either operand is true.
-  true(e)                  Tests if operand is true.

### Error handling

-  assert(expr)             Tests that _expr_ is true, ends execution otherwise.
-  error(s)                 Write out string _s_ and end execution.

### Numeric

-  binary(n)                Returns string with value of _n_ in binary number.
-  even(n)                  Tests if _n_ is even.
-  factorial(n)             Returns n!  = n * (n -1) * ... * 1.
-  int(n)                   Returns _n_ if n is integer or is string in exponential form
-  multiple(n,m)            Tests if _n_ is a multiple of _m_.
-  number(s)                Returns integer defined by _s_.
-  odd(n)                   Tests if _n_ is odd.
-  prime(n)                 Tests if _n_ is prime.
-  primes(n)                Returns set of primes less than _n_.
-  random(n)                Returns random integer if _n_ is integer, else random element of set or map.
-  random.seed()            Sets random number seed to initialize _random_.
-  square.root(n)           Returns integer square root on _n_

### String

-  append(str,w,ch)         Appends _ch_ (or space if _ch_ is null) to _str_, then _w_
-  join(a,b)                Joins several sequences/strings into one sequence/string
-  pack(seq)                Packs sequence of strings into single string.
-  tolower(s)               Returns _s_ with upper case letters replaced by lower case equivalent.
-  toupper(s)               Returns _s_ with lower case letters replaced by upper case equivalent.
-  split(s)                 Returns sequence of whitespace-separated words into _s_.
-  tokens(s)                Returns sequence of the tokens in _s_.
-  unpack(str)              Unpacks string into sequence of its characters.
-  words(s,w)               Returns sequence of words (defined by _w_) in _s_.

### Input / Output

-  checkout(filename)       Returns ('checks out') set or map defined by a text file from the libary
-  reader(filename,expr)    Returns sequence of lines in file _filename_, using _expr_ (if given).
-  reader(str,delim)        Like _reader(filename..)_ but reads lines from a string with lines.
-  writer(lines)            Writes sequence _lines_ to standard output.

### General

-  compare(a,b)             Compares two integers or strings, returning -1 (less), 0 (equal), or +1 (greater).
-  frequency(s)             Returns frequency of values in sequence, map or string _s_.
-  quicksort(seq)           Use Hoare's quicksort algorithm to sort a sequence.
-  show.boolean(e)          Evaluates string _s_ as expression, shows value
-  show.eval(expr)          Evaluates _expr_, returns 'success' if true, else 'false'
-  show.text(v)             Same as _show()_, but strings are not enclosd in quotes.

### Internal: Debug / Tracing

-  traceon()                Turns on tracing.
-  traceoff()               Turns off tracing


