#第三天

##类
使用instance_methods(false)发现class自己定义的实例方法.Class.superclass指向Module，而new是Class的扩展。因此Module是不可以被实例化的

- class
- module

Class、Module和My_Class一样不过是一个对象，通过class定义MyClass时，不过是声明一个常量而已。这个Class就代表着那个对象

- Test::Unit::TestCase
- Module.constants

对象无非就是一组变量外加一个提向类的引用
类无非就是一个对象外加一组实例方法和一个对其超类的引用

##类的体系
Class的父类是Module，Module也是类。Module不可被实例化，所以在使用时采用include。superclass只可能找到父类，但是却找不到它mixin了哪些Module。`Class.ancestors`可以帮助我们。

- 向右一步，再向上
- Kernel(很多方法像关键字一样，但它实际来自于Kernel的实例方法)
- Printable Document My_Class，看看顺序

##Jekyll
###简单版本
- gem install jekyll
- _layouts
- default.html {{content}}
- index.md
- jekyll --server

###加点料
- _posts
- md:
- index.md

	{%for post in site.posts%}
	{%endfor%}
- copy md 到 _posts 
- jekyll --server

###美化版
- Copy js css
- 更改模板
- 	head
- 	content
- 	about
- copy index.md 覆盖原index.md
- copy post.html 到 _layouts
- 修改md里的模板采用post