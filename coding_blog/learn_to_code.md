# Learn To Code project


>This article is about the purpose of and learnings around my [learn-to-code](https://github.com/MichaelCurrin/learn-to-code) repo.
>
>_2018, Feb 22nd_


I like to write tutorials when I learn to solve a problem with _Python_, _Bash_, _Git_, _Thunderbird mail_ or other areas. It is a useful reference when I need to solve the problem again.

I aim to get at least beginner level experience in a variety of languages, for flexibility and perspective. I enjoy writing a few scripts or tutorials to consolidate what I've learned. In that repo, I include instructions on how to get started, such as running a _C_, _PHP_ or _Ruby_ script for the first time.

From reading about the [C programming language](https://en.wikipedia.org/wiki/C_(programming_language)), which first appeared in 1972, I was amazed to find that so many sources say it is pervasive, powerful and quick. It is a low-level language that is close to [machine code](https://en.wikipedia.org/wiki/Machine_code) (which is one step away from binary), which means you can use _C_ to do manage the machine precisely and efficiently. It is used behind-the-scenes to implement many coding languages, including _Java_, _Python_, _iOS_, _Bash_ and _SQL_ to name a few. Languages influence each other, but I find it fascinating to go a common root, to see where certain conventions come from, or where there was something missing which could be added in a newer language. In _C_ for example there are functions but no classes, memory is not garbage collected it is in _Java_ or _Python_ and _integer_ values for `1` and `0` are typically used in place of _True_ and _False_ because there is no _boolean_ type (at least in the original _C_ standard).

Quoting works differently across languages. In Python, the double-quoted `"H"` and single-quoted `'H'` are equivalent and both a create a string. In Java, double-quotes is a `String` type while single-quotes is a `char` type.

I was surprised to find that in C there is _no_ string type, though, double-quotes allows creation of an array of characters.

```c
void main()
{
    char one_letter = 'H';
    char one_letter_alt[1] = "H";
    char many_letters[5] = "Hello";
}
```

In _Bash_, the double-quotes allows substitution of variables, while single-quotes restricts to literal characters.

```bash
$ NAME='Michael'
$ echo Hello $NAME!
Hello Michael!
$ echo "Hello $NAME!"
Hello Michael!
$ echo 'Hello $NAME!'
Hello $NAME!
```

This is similar in _PHP_.

```php
$ php -a
php > $name = 'Michael';
php > echo 'Hello ' . $name . '!';
Hello Michael!
php > echo "Hello $name!";
Hello Michael!
php > echo 'Hello $name!';
Hello $name!
```

In _Bash_, double quotes around a variable can give different output compared to without.

```bash
$ echo $HOME
/home/michael
$ echo "$HOME" # Same output as above.
/home/michael
$ echo ~
/home/michael
$ echo "~" # Will not expand.
~
```

Each language has its own style and syntax, but often these are borrowed from other languages. For example, `printf` in _Bash_ comes from the same keyword in _C_. And using the _Ruby_ syntax with the word "_puts_" (e.g. `puts "Hello world"`) to print a string seems unlike other languages I've come across, Until you see that _C_ actually has `puts` ([print string](https://www.tutorialspoint.com/c_standard_library/c_function_puts.htm)) and `putchar` ([print character](https://www.tutorialspoint.com/c_standard_library/c_function_putchar.htm) and that probably influenced _Ruby_.

Interpolating (or substituting) values into a string in _C_ and _Python_ is also very similar.

```c
// C
#include <stdio.h>

void main()
{
    char string_value[5] = "Hello";
    int decimal_value = 1;
    printf("string: %s decimal: %d\n", string_value, decimal_value);
    // string: Hello decimal: 1
}
```

```python
$ python
>>> string_value = "Hello"
>>> decimal_value = 1
>>> "string: %s decimal: %d" % (string_value, decimal_value)
>>> string: Hello decimal: 1
```

Though, the newer Python standard (for versions 2.7+ and 3.2+) is to use the curly brackets as the [format method](https://pyformat.info/).

```python
$ python
>>> string_value = "Hello"
>>> decimal_value = 123
>>> "string: {0}. decimal: {1}".format(string_value, decimal_value)
string: Hello. decimal: 123
>>> # OR
>>> "string: {greeting}. decimal: {number}".format(greeting=string_value, 
                                                   number=decimal_value)
string: Hello. decimal: 123
```

From Python 3.6, you can use the much cleaner [f strings](https://cito.github.io/blog/f-strings/), which implicitly substitutes in values which are in scope, provide the string has a `f` prefix.
```python
$ python3.6
>>> greeting = "Hello"
>>> number = 123
>>> f"string: {greeting}. decimal: {number}"
string: Hello. decimal: 123
```

_Ruby_ supports the implicit interpolation too, but some years before _Python_ did.

```ruby
$ irb
irb> greeting = "Hello"
irb> numbner = 123
irb> puts "string: #{greeting}. decimal: #{number}"
string: Hello. decimal: 123
```

The increment notation of `i++;` is in Java and JavaScript. It actually goes back at least as far as _C_. In _Python_, you can just do `i += 1`.

Most languages I looked at use a semi-colon at the end of a line. _Python_ doesn't require it, but it allows it and treats it like a link break. 

```python
# Python
x = 1
x += 1
# Equivalent to:
x = 1; x +=1
```

The semi-colon is JavaScript is required when in [strict mode](https://www.w3schools.com/js/js_strict.asp), but otherwise it can be [inferred in some cases](http://es5.github.io/#x7.9). Though, this is [not recommended](https://stackoverflow.com/questions/8108903/are-semicolons-mandatory-in-javascript-statements) because it can be ambiguous.



There are different approaches to creating functions in each language. _Python_ uses `def my_func():`, _JavaScript_ uses `function my_func() {}`, a [Bash function](https://ryanstutorials.net/bash-scripting-tutorial/bash-functions.php) accepts either `my_func() {}` or `function my_func {}`, while a [C function](https://www.tutorialspoint.com/cprogramming/c_functions.htm) has no function keyword but is in the format `return_type my_func {}`.

I am going to aim adding to my Learnt to Code repo regularly and when I find something more that is worth writing about, I'll add more content here.
