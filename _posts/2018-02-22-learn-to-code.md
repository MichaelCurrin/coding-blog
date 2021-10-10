---
title: Learn To Code Project
description: Learnings around my [Learn To Code](https://github.com/MichaelCurrin/learn-to-code) guide.
tags: learning
---

I like to write tutorials when I learn to solve a problem with _Python_, _Bash_, _Git_, _Thunderbird mail_ or other areas. It is a useful reference when I need to solve the problem again.

I aim to get at least beginner level experience in a variety of languages, for flexibility and perspective. I enjoy writing a few scripts or tutorials to consolidate what I've learned. In that repo, I include instructions on how to get started, such as running a _C_, _PHP_ or _Ruby_ script for the first time.

From reading about the [C programming language](https://en.wikipedia.org/wiki/C_(programming_language)), which first appeared in 1972, I was amazed to find that so many sources say it is pervasive, powerful and quick. It is a low-level language that is close to [machine code](https://en.wikipedia.org/wiki/Machine_code) (which is one step away from binary), which means you can use _C_ to do manage the machine precisely and efficiently. It is used behind-the-scenes to implement many coding languages, including _Java_, _Python_, _iOS_, _Bash_ and _SQL_ to name a few. Languages influence each other, but I find it fascinating to go a common root, to see where certain conventions come from, or where there was something missing which could be added in a newer language. In _C_ for example there are functions but no classes, memory is not garbage collected it is in _Java_ or _Python_ and _integer_ values for `1` and `0` are typically used in place of _True_ and _False_ because there is no _boolean_ type (at least in the original _C_ standard).

## Strings and characters

String data types differently across languages.

In _Java_, double-quotes is a `String` type while single-quotes is a `char` type.

In _Python_, the double-quoted `"H"` and single-quoted `'H'` are equivalent and both a create a string.

I was surprised to find that in _C_ there is _no_ string data type. Though, double-quotes allows creation of an array of characters.

```c
void main()
{
    char one_letter = 'H';
    char one_letter_alt[1] = "H";
    char many_letters[5] = "Hello";
}
```

## Substitution

In _Bash_, the double-quotes allows substitution of variables, while single-quotes restricts to literal characters.

```sh
$ NAME='Michael'
$ echo Hello $NAME!
Hello Michael!
$ echo "Hello $NAME!"
Hello Michael!
$ echo 'Hello $NAME!'
Hello $NAME!
```

This is similar in _PHP_.

```sh
$ php -a
```
```php
php > $name = 'Michael';
php > echo 'Hello ' . $name . '!';
Hello Michael!
php > echo "Hello $name!";
Hello Michael!
php > echo 'Hello $name!';
Hello $name!
```

### Bash

In _Bash_, double quotes around a variable can give different output compared to without.

```sh
$ echo $HOME
/home/michael
$ echo "$HOME" # Same output as above.
/home/michael
$ echo ~
/home/michael
$ echo "~" # Will not expand.
~
```

### C

Interpolating (or substituting) values into a string in _C_ and _Python_ is also very similar.

```c
// C
#include <stdio.h>

void main()
{
    char greeting[5] = "Hello";
    int number = 1;
    printf("string: %s. decimal: %d\n", greeting, number);
    // string: Hello. decimal: 1
}
```

### Python

```sh
$ python
```
```python
>>> greeting = "Hello"
>>> number = 123
>>> "string: %s. decimal: %d" % (greeting, number)
>>> string: Hello. decimal: 123
```

Though, the newer Python standard (for versions 2.7+ and 3.2+) is to use the curly brackets as the [format method](https://pyformat.info/).

```sh
$ python
```
```python
>>> string_value = "Hello"
>>> decimal_value = 123
>>> "string: {0}. decimal: {1}".format(string_value, decimal_value)
string: Hello. decimal: 123
>>> # OR
>>> "string: {greeting}. decimal: {number}".format(greeting=string_value,
                                                   number=decimal_value)
string: Hello. decimal: 123
```

From _Python_ version 3.6, you can use the much cleaner [f strings](https://cito.github.io/blog/f-strings/), which implicitly substitutes in values which are in scope, provide the string has a `f` prefix.

```
$ python3.6
```
```python
>>> greeting = "Hello"
>>> number = 123
>>> f"string: {greeting}. decimal: {number}"
string: Hello. decimal: 123
```

### Ruby

_Ruby_ supports the implicit interpolation too, but some years before _Python_ did.

```sh
$ irb
```
```ruby
irb> greeting = "Hello"
irb> number = 123
irb> puts "string: #{greeting}. decimal: #{number}"
string: Hello. decimal: 123
```

## Print functions

I've noted that languages borrow from each other, especially from older languages.

Examples of printing

### Bash

```sh
# bash
$ printf 'Foo'
$ sprintf 'Foo'
$ echo 'Foo'
```

See [printf](https://linuxconfig.org/bash-printf-syntax-basics-with-examples) notes and [
What is the difference between printf, sprintf and fprintf?
](https://www.geeksforgeeks.org/difference-printf-sprintf-fprintf/)


### PHP

```php
print 'Foo';
print('Foo');
echo 'Foo';
echo('Foo';)
```

See also the [print_r](http://php.net/manual/en/function.print-r.php) function.


### Python

```python
# python2
print 'Foo'
# python3
print('Foo')
```

### Ruby

```ruby
puts 'Foo'
print 'Foo'
```

### C

Newline characters must be explicitly set.

```c
putchar('F');
puts("\n");

puts("Foo\n");

printf("%s %d\n", "Foo", 100);
```

See [puts](https://www.tutorialspoint.com/c_standard_library/c_function_puts.htm) for print a  string and [putchar](https://www.tutorialspoint.com/c_standard_library/c_function_putchar.htm) to print a character.


## Incrementing

The increment notation of `i++;` is in Java and JavaScript. It actually goes back at least as far as _C_. In _Python_, you can just do `i += 1`.


## Line termination

### Bash

A semicolon is not required in general use, but it can be useful for executing multiple commands in one line.

```sh
$ echo 'Line 1'
Line 1
$ echo 'Line 2'
Line 2
$ echo 'Line 1'; echo 'Line 2'
Line 1
Line 2
```

A semi-colon can also be useful for doing an `if` or `for` conditional in a single line.


For example, check if a value is greater than another.

```sh
$ if [ 3 -gt 2 ]; then echo 'Yes'; else echo 'No'; fi```
Yes
```

The longer way is with line breaks instead of semi-colons.
```sh
$ if [ 3 -gt 2 ]
> then echo 'Yes'
> else echo 'No'
> fi
Yes
```

In a script, this would be:

```sh
if [ 3 -gt 2 ]
  then
    echo 'Yes'
  else
    echo 'No'
fi
```

### PHP

```php
$x = 1;
```

### Python

A newline character is used in Python. A semi-colon is optional but discouraged.

```python
x = 1
y = 2;
```

Though, it can be useful for writing a single line of multiple statements.

```python
x = 1
y = 2
print(x + y)
```

```python
x = 1; y = 2; print(x + y);
```

And also useful running multiple _Python_ commands with a single string argument in _Bash_.

```sh
$ python3 -c 'x = 1; y = 2; print(x + y)'
3
```

Line breaks also work for that single string argument.

```sh
$ python3 -c 'x = 1
> y = 2
> print(x + y)
> '
3
```

### JavaScript

The semi-colon is JavaScript is required when in [strict mode](https://www.w3schools.com/js/js_strict.asp), but otherwise it can be [inferred in some cases](http://es5.github.io/#x7.9). Though, this is [not recommended](https://stackoverflow.com/questions/8108903/are-semicolons-mandatory-in-javascript-statements) because it can be ambiguous.

```javascript
"use strict";
var x = 1;
var y = 2;
```

## Functions

There are different approaches to creating functions in each language.

_Python_ uses `def my_func():`.

_JavaScript_ uses `function my_func() {}`.

A [Bash function](https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php) accepts either `my_func() {}` or `function my_func {}`.

While a [C function](https://www.tutorialspoint.com/cprogramming/c_functions.htm) has no function keyword but is in the format `return_type my_func {}`.
