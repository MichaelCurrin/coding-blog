# Learn To Code project

>This article is about the purpose of and learnings around my [learn-to-code](https://github.com/MichaelCurrin/learn-to-code) repo.

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

In Bash, the double-quotes allows substitution of variables, while single-quotes restricts to literal characters.

```bash
$ echo "$HOME"
/home/michael
$ echo '$HOME'
$HOME
```

Each language has its own style and syntax, but often these are borrowed from other languages. For example, `printf` in _Bash_ comes from the same keyword in _C_. And using the _Ruby_ syntax with the word "_puts_" (e.g. `puts "Hello world"`) to print a string seems weird compared with other modern languages, until you see that C has `putchar('H')` to print a character which probably influenced Ruby. 

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
# Python
string_value = "Hello"
decimal_value = 1
print("string: %s decimal: %d" % (string_value, decimal_value))
string: Hello decimal: 1
```

Though, the new Python standard is to use the curly brackets with the [format method](https://pyformat.info/).
```python
# Python 2.7+ and 3.2+
>>> string_value = "Hello"
>>> decimal_value = 1
>>> print("string: {0} decimal: {1}".format(string_value, decimal_value))
>>> # OR
>>> print("string: {string_value} decimal: {decimal_value}".format(string_value=string_value, 
                                                               decimal_value=decimal_value))
string: Hello decimal: 1
```

From Python 3.6, you can use the much cleaner [f strings](https://cito.github.io/blog/f-strings/), which implicitly substitute in values which are in scope.
```python
# Python 3.6
>>> string_value = "Hello"
>>> decimal_value = 1
>>> # Note the f prefix.
>>> print(f"string: {string_value} decimal: {decimal_value}")
string: Hello decimal: 1
```

_Ruby_ supports the implicit interpolation too, but some years before _Python_ did.
```ruby
irb> string_value = "Hello"
irb> decimal_value = 1
irb> puts "string: #{string_value} decimal: #{decimal_value}"
string: Hello decimal: 1
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
