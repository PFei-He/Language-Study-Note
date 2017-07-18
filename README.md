语言学习笔记
===
学习编程语言过程中的记录，包含有每种语言的特性，异同点，语法等等不同的知识。

说明
---

### 关于
此笔记只是本人学习过程中的一点知识归集，并不一定会列出所有语言的所有知识点，也不会对语言进行任何介绍，目前是学懂一点，记录一点，欢迎各位童鞋一起来记录，也欢迎转给更多的人学习。

### 目录
以下列出部分例子，全部内容请点进语言下查看。

##### [C#](https://github.com/PFei-He/Language-Study-Note/tree/master/C%23) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/C%23/Hello%20World)
```cs
    void say() {
        Console.WriteLine("Hello World!");
    }
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/C%23/foreach)
```cs
    int[] array = {1, 2};
    Console.WriteLine(array);
    foreach (int i in array) {
        Console.WriteLine(i);
    }
```

##### [C++](https://github.com/PFei-He/Language-Study-Note/tree/master/C%2B%2B) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/C%2B%2B/Hello%20World)
```c++
	void say() {
		std::cout << "Hello World!" << std::endl;
	}
```

##### [C](https://github.com/PFei-He/Language-Study-Note/tree/master/C) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/C/Hello%20World)
```c
	void say() {
		printf("Hello World!\n");
	}
```

##### [Go](https://github.com/PFei-He/Language-Study-Note/tree/master/Go) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Go/Hello%20World)
```go
    func say() {
        fmt.Println("Hello World!")
    }
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Go/foreach)
```go
    array := [2] int {1, 2}
    fmt.Println(array)
    for i := range array {
        fmt.Println(i)
    }
```

##### [Java](https://github.com/PFei-He/Language-Study-Note/tree/master/Java) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Java/Hello%20World)
```java
    void say() {
        System.out.println("Hello World!");
    }
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Java/foreach)
```java
    int[] array = {1, 2};
    System.out.println(array);
    for (int i: array) {
        System.out.println(i);
    }
```

##### [JavaScript](https://github.com/PFei-He/Language-Study-Note/tree/master/JavaScript) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/JavaScript/Hello%20World)
```javascript
    function say() {
        console.log("Hello World!");
    }
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
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Kotlin/Hello%20World)
```kotlin
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
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Lua/Hello%20World)
```lua
    function say()
        print "Hello World!\n"
    end
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
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Objective-C/Hello%20World)
```objective-c
    - (void)say 
    {
        NSLog(@"Hello World!");
    }
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Objective-C/foreach)
```objective-c
    NSArray *array = @[@1, @2];
    NSLog(@"%@", array);
    for (NSNumber *i in array) {
        NSLog(@"%@", i);
    }
```

##### [Perl](https://github.com/PFei-He/Language-Study-Note/tree/master/Perl) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Perl/Hello%20World)
```perl
    sub say {
        print "Hello World!\n";
    }
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Perl/foreach)
```perl
    my @array = ('1', '2');
    print "@array\n";
    foreach my $i (@array) {
        print "$i\n";
    }
```

##### [PHP](https://github.com/PFei-He/Language-Study-Note/tree/master/PHP) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/PHP/Hello%20World)
```php
    function say() {
        echo "Hello World!\n";
    }
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/PHP/foreach)
```php
    $array = ["1", "2"];
    echo $array;
    foreach ($array as $i) {
        echo $i."\n";
    }
```

##### [Python](https://github.com/PFei-He/Language-Study-Note/tree/master/Python) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Python/Hello%20World)
```python
    def say():
        print "Hello World!"
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Python/foreach)
```python
    array = ["1", "2"]
    print array
    for i in array:
        print i
```

##### [Ruby](https://github.com/PFei-He/Language-Study-Note/tree/master/Ruby) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Ruby/Hello%20World)
```ruby
    def say()
      puts "Hello World!"
    end
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Ruby/foreach)
```ruby
    array = ["1", "2"]
    puts array
    array.each do |i|
      puts i
    end
```

##### [Rust](https://github.com/PFei-He/Language-Study-Note/tree/master/Rust) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Rust/Hello%20World)
```rust
    fn say() {
        println!("Hello World!");
    }
```

##### [Scala](https://github.com/PFei-He/Language-Study-Note/tree/master/Scala) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Scala/Hello%20World)
```scala
    def say(): Unit = {
      println("Hello World!")
    }
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Scala/foreach)
```scala
    val array = Array(1, 2)
    for (i <- array) {
      println(i)
    }
```

##### [Swift](https://github.com/PFei-He/Language-Study-Note/tree/master/Swift) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/Swift/Hello%20World)
```swift
    func say() {
        print("Hello World!")
    }
```

* [foreach](https://github.com/PFei-He/Language-Study-Note/tree/master/Swift/foreach)
```swift
    var array = [1, 2]
    print(array)
    for i in array {
        print(i)
    }
```

##### [TypeScript](https://github.com/PFei-He/Language-Study-Note/tree/master/TypeScript) <br>
---
* [Hello World](https://github.com/PFei-He/Language-Study-Note/tree/master/TypeScript/Hello%20World)
```typescript
```
