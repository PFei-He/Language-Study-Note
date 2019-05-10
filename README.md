语言学习笔记
===
学习编程语言过程中的记录，包含有每种语言的特性，异同点，语法等等不同的知识。

说明
---

### 关于
此笔记只是本人学习过程中的一点知识归集，并不一定会列出所有语言的所有知识点，也不会对语言进行任何介绍，目前是学懂一点，记录一点，欢迎各位童鞋一起来记录，也欢迎转给更多的人学习。<br><br>
由于学习语言不可避免的要在真正工程中使用，为学习时能更真切的学到语言在实际项目中的应用，此笔记会上传一些实际工程项目中不涉及版权问题及企业机密的代码片段或文件以便学习。

### 目录
以下列出部分例子，全部内容请点进语言下查看。

##### [C](https://github.com/PFei-He/Language-Study-Note/tree/master/C) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/C/helloworld)
```c
#include <stdio.h>

void say();

int main(int argc, const char * argv[]) {
    say();
    return 0;
}

void say() {
    printf("Hello World!\n");
}
```

##### [C#](https://github.com/PFei-He/Language-Study-Note/tree/master/C%23) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/C%23/helloworld)
```cs
using System;

public class M {
    public static void Main() {
    	M m = new M();
    	m.say();
    }

    void say() {
        Console.WriteLine("Hello World!");
    }
}
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/C%23/foreach)
```cs
using System;

public class M {
    public static void Main() {
        int[] array = {1, 2};
        Console.WriteLine(array);
        foreach (int i in array) {
            Console.WriteLine(i);
        }
    }
}
```

##### [C++](https://github.com/PFei-He/Language-Study-Note/tree/master/C%2B%2B) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/C%2B%2B/helloworld)
```c++
#include <iostream>

void say();

int main(int argc, const char * argv[]) {
    say();
    return 0;
}

void say() {
    std::cout << "Hello World!" << std::endl;
}
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/C%2B%2B/foreach)
```c++
#include <iostream>

int main(int argc, const char * argv[]) {
    int array[] = {1, 2};
    for (int i : array) {
        std::cout << i << std::endl;
    }
    return 0;
}
```

##### [D](https://github.com/PFei-He/Language-Study-Note/tree/master/D) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/D/helloworld)
```d
module main;

import std.stdio;

void main(string[] args) {
    say();
}

void say() {
    writeln("Hello World!");
}
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/D/foreach)
```d
module main;

import std.stdio;

void main(string[] args) {
    int[] array = [1, 2];
    foreach (int i; array) {
        writeln(i);
    }
}
```

##### [Dart](https://github.com/PFei-He/Language-Study-Note/tree/master/Dart) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Dart/helloworld)
```dart
void main() {
  say();
}

void say() {
  print('Hello World!');
}
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Dart/foreach)
```dart
void main() {
  var array = [1, 2];
  print(array);
  array.forEach((i) => {
    print(i)
  });
}
```

##### [Erlang](https://github.com/PFei-He/Language-Study-Note/tree/master/Erlang) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Erlang/helloworld)
```erlang
-module(main).

%% API
-export([main/0]).

main() -> {
  say()
}.

say() -> {
  io:fwrite("Hello World!\n")
}.
```

##### [Go](https://github.com/PFei-He/Language-Study-Note/tree/master/Go) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Go/helloworld)
```go
package main

import "fmt"

func main() {
	say()
}

func say() {
	fmt.Println("Hello World!")
}
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Go/foreach)
```go
package main

import "fmt"

func main() {
	array := [2]int{1, 2}
	fmt.Println(array)
	for i := range array {
		fmt.Println(i)
	}
}
```

##### [Groovy](https://github.com/PFei-He/Language-Study-Note/tree/master/Groovy) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Groovy/helloworld)
```groovy
def main() {
    say()
}

def say() {
    println "Hello World!"
}

main()
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Groovy/foreach)
```groovy
def main() {
    def array = [1, 2]
    println(array)
    for (int i in array) {
        println(i)
    }
}

main()
```

##### [HTML](https://github.com/PFei-He/Language-Study-Note/tree/master/HTML) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/HTML/helloworld)
```html
<!DOCTYPE html>

<html>
	<head>
		<title>Hello World!</title>
	</head>
	<body>
		<h1>Hello World!</h1>
	</body>
</html>
```

##### [Java](https://github.com/PFei-He/Language-Study-Note/tree/master/Java) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Java/helloworld)
```java
public class main {
    public static void main(String args[]) {
        main m = new main();
        m.say();
    }

    void say() {
        System.out.println("Hello World!");
    }
}
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Java/foreach)
```java
public class main {
    public static void main(String args[]) {
        int[] array = {1, 2};
        System.out.println(Arrays.toString(array));
        for (int i: array) {
            System.out.println(i);
        }
    }
}
```

##### [JavaScript](https://github.com/PFei-He/Language-Study-Note/tree/master/JavaScript) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/JavaScript/helloworld)
```javascript
function main() {
    say();
}

function say() {
    console.log("Hello World!");
}

main();
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/JavaScript/foreach)
```javascript
array = ['1', '2'];
console.log(array);
for (var i in array) {
    console.log(array[i]);
}
```

##### [Kotlin](https://github.com/PFei-He/Language-Study-Note/tree/master/Kotlin) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Kotlin/helloworld)
```kotlin
fun main(args: Array<String>) {
    say()
}

fun say() {
    println("Hello World!")
}
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Kotlin/foreach)
```kotlin
fun main(args: Array<String>) {
    val array = arrayOf(1, 2)
    array.forEach {
        println(it)
    }
}
```

##### [Lua](https://github.com/PFei-He/Language-Study-Note/tree/master/Lua) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Lua/helloworld)
```lua
function main()
    say()
end

function say()
    print "Hello World!";
end

main()
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Lua/foreach)
```lua
local array = {1, 2}
print(array)
for i,j in pairs(array) do
    print(i)
    print(j)
end
```

##### [Objective-C](https://github.com/PFei-He/Language-Study-Note/tree/master/Objective-C) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Objective-C/helloworld)
```objective-c
#import <Foundation/Foundation.h>
#import "OC.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        OC *oc = [[OC alloc] init];
        [oc say];

        [OC say];
    }
    return 0;
}
```
```objective-c
#import <Foundation/Foundation.h>

@interface OC : NSObject

- (void)say;

+ (void)say;

@end
```
```objective-c
#import "OC.h"

@implementation OC

- (void)say
{
    NSLog(@"Hello World!");
}

+ (void)say
{
    NSLog(@"Hello World!");
}

@end
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Objective-C/foreach)
```objective-c
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = @[@1, @2];
        NSLog(@"%@", array);
        for (NSNumber *i in array) {
            NSLog(@"%@", i);
        }
    }
    return 0;
}
```

##### [Perl](https://github.com/PFei-He/Language-Study-Note/tree/master/Perl) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Perl/helloworld)
```perl
use strict;
use warnings FATAL => 'all';

sub main() {
    say();
}

sub say() {
    print "Hello World!\n";
}

main();
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Perl/foreach)
```perl
use strict;
use warnings FATAL => 'all';

my @array = qw(1 2);
print "@array\n";
foreach my $i (@array) {
    print "$i\n";
}
```

##### [PHP](https://github.com/PFei-He/Language-Study-Note/tree/master/PHP) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/PHP/helloworld)
```php
<?php
function main() {
    say();
}

function say() {
    echo "Hello World!";
}

main();
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/PHP/foreach)
```php
<?php
$array = ["1", "2"];
echo $array."\n";
foreach ($array as $i) {
    echo $i."\n";
}
```

##### [Python](https://github.com/PFei-He/Language-Study-Note/tree/master/Python) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Python/helloworld)
```python
def main():
    say()


def say():
    print("Hello World!")


main()
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Python/foreach)
```python
array = ["1", "2"]
print(array)
for i in array:
    print(i)
```

##### [Ruby](https://github.com/PFei-He/Language-Study-Note/tree/master/Ruby) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Ruby/helloworld)
```ruby
def main
  say
end

def say
  puts 'Hello World!'
end

main
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Ruby/foreach)
```ruby
array = ['1', '2']
puts array
array.each do |i|
  puts i
end
```

##### [Rust](https://github.com/PFei-He/Language-Study-Note/tree/master/Rust) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Rust/helloworld)
```rust
fn main() {
    say();
}

fn say() {
    println!("Hello World!");
}
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Rust/foreach)
```rust
fn main() {
    let array = [1, 2];
    for i in &array {
        println!("{}", i);
    }
}
```

##### [Scala](https://github.com/PFei-He/Language-Study-Note/tree/master/Scala) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Scala/helloworld)
```scala
object main {
  def main(args: Array[String]): Unit = {
    say()
  }
    
  def say(): Unit = {
    println("Hello World!")
  }
}
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Scala/foreach)
```scala
object main {
  def main(args: Array[String]): Unit = {
    val array = Array(1, 2)
    for (i <- array) {
      println(i)
    }
  }
}
```

##### [Swift](https://github.com/PFei-He/Language-Study-Note/tree/master/Swift) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Swift/helloworld)
```swift
import Foundation

func main() {
    say()
}

func say() {
    print("Hello World!")
}

main()
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Swift/foreach)
```swift
import Foundation

var array = [1, 2]
print(array)
for i in array {
    print(i)
}
```

##### [TypeScript](https://github.com/PFei-He/Language-Study-Note/tree/master/TypeScript) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/TypeScript/helloworld)
```typescript
class Main {
    constructor() {}
    
    say() {
        console.log("Hello World!");
    }
}
    
let main = new Main();
main.say();
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/TypeScript/foreach)
```typescript
let array = [1, 2];
array.forEach((i) => {
    console.log(i);
});
```
