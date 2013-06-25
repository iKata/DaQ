#第二天

##Spider
###单元测试
- `require 'test/unit'`(引用类库)
- `< Test::Unit::TestCase`(继承体系)
- `test`(test开头)
- `assert`

###邮箱
- before_at
- after_at
- email_regexp
- @ @@ $

###对象中有什么？
####实例变量
- obj.instance_variables

	Ruby中的类和它的实例变量没有任何关系.instance_variables实际是一个用来存储实体变量的数组
	
- obj.instance_eval

	instance_eval可以打开obj的作用域，查看或者修改obj里的变量

####方法
- object.methods
- object.class.instance_methods

	和C#以及Java不同，对象的方法并没有存放在对象里，而是存放在对象的class里。因为这些方法被所有该类的实例共享。所以object.methods == object.class.instance_methods
	
一个对象的实例变量存在于对象本身，而一个对象的方法存在于对象自身的类。这就是为什么同一个类的对象共享同样的方法，但不共享变量的原因。

###爬
- open-uri
- split
- scan
- \s \w + . * ? m
- 贪婪和懒惰
- () $1 $2
- 散列表
- : ''

##代码块
- animals.each{|animal| puts animal}
- 5.times{puts 'print 5 times'}
- 实现自己的代码块 my_times
- yield
- &block

##类
- 4.class.superclass.superclass.superclass.sueprclass
- 4.class.class.superclass.superclass.superclass
- @ @@ $ attr_
- 常量与变量

##模块
- include MD_Marker
- < 
