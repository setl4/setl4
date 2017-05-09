# setl4
setl4 executable specification

false = 0
true = 1

and(b1,b2): returns true if and only if both a and b are true

or(b1,b2) - returns true if and only if either a or b is true.

even(n) - returns true if and only if n is even

odd(n) - returns true if and only if n is odd

factorial(n) - returns factorial(n) = n * (n - 1) * (n - 2 ... 1

prime(n) - returns true if and only if n is prime

square.root(n) -integer square root

data('str(str.size,str.index.str.key,str.max,str.next,str.text)')

date('set(set.index,set.key,set.size,set.max,set.next)')

data('int(int.low,int.high,int.step,int.next)')

data('pair(first,second))

data('entry(key,value)')

data('line(mark,text)')

setl4.size(s)

set4.reduce(obj,expr)

set4.member(x,s)

next(obj)

setl4.next(obj)

setl4.loop(obj)

loop(obj)

exists(obj,expr)

exists.not(obj,expr)

forall(obj,expr)

integers(low,high,step)

join.str(word)

map.domain(map)

map.equal(a,b)

map.get(map,key)

map.inverst(map)

map.new(init)

map.put(map,key,val)

map.range(map)

map.test(map,key)


mark(line,text)

number.cardinal(n,word)

number.thousands(n)

out(text1,text2,text3)

random(n)

random.seed()

seq.add(seq.val)

seq.extend(seq,len)

seq.get(seq,i)

seq.integers(n)

seq.new(n)

seq.push(seq,val)

seq.range

seq.put(seq,i,val)

set.add(set,val)

set.difference(a,b)

set.equal(a,b)

set.in(elem,set)

set.integers(n)

set.less(set,elem)

set.new(init)

set.notin(s,x)

set.set.subset(a,b

set.set.union(a,b


show(v,lvl)

show.line(line)

show.lines(lines,title)

show.quote(str)

show.words(words)

str.append(str,w,ch)

str.ascii(line)

str.ascii.init(init)

str.frequency(str)

str.lower(s)

str.spaces(line)

str.less(str,sub)

str.prefix(str,pre)

str.slice(str,first,last)

str.upper(s)

str.reader(filename,expr)

str.reader.string(str,delim)

str.tokens(line)

str.words(line)

str.writerr(lines)

setl4.traceoff()

setl4.traceon()

visit(obj,expr) - loop over _obj_ and call _eval(expr)_ for each member.

*map.loop(map,kind)



SETL4 assigns a meaning to a number of operator symbols not used in SPITBOL:

'#' is a unary operator that returns the size of its operand.

'@' is a binary operator that invokes the _reduce_ operator.
	"obj @ expr" is same as _setl4.reduct(obj,expr)_

'=' is a unary operator that returns the last iteration value
	returned by its operand.

'&' is a binary operator that concatenates its arguments. This is
	an alternative to SPITBOL's unconventional use of a blank character 
	to indicate concatenation.

'~' is a binary operator for testing membership; 'x ~ s' is shorthand
	for '_set.member(x,s)_'



