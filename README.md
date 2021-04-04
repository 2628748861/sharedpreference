# cons

A new Flutter package project.

## Getting Started

这是一个用于操作本地sharedpreference文件的工具.

[github项目主页地址](https://github.com/2628748861/sharedpreference)

使用方法:

安装依赖:

```
dependencies:
  frode_sharedpreference: xx
```

应用初始化
    
```
 try{
      var result =await SharedPreference.instance.init();
      print('result is $result');
    }catch(e){
      print('error is $e');
    }
    
正常输出:
I/flutter (23132): init is 初始化成功.
如有异常请自行排查.
```
设置sharepreference的key,value

user.dart
```
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class User{
  String name;
  int age;
  User(this.name,this.age);

  String get names=>this.name;
  set names(String _names)=>this.name=_names;

  factory User.fromJson(Map<String,dynamic> json)  => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```


```
 //String
 SharedPreference.instance.set('data1', 'abc');
 //int
 SharedPreference.instance.set('data2', 123);
 //bool
 SharedPreference.instance.set('data3', false);
 //double
 SharedPreference.instance.set('data4', 123.0);
 //List<String>
 SharedPreference.instance.set('data5', ['a','b','c']);
 //User 设置序列化对象(对象一定要是序列化的哦)
 SharedPreference.instance.set('data6', User('jack',100));
 //List<User>
 SharedPreference.instance.set('data7',[User('xiaoming',100),User('hua',100),User('qiang',100)] );
 
```
获取值

```
var r=SharedPreference.instance.get('data1');
print('data1 is $r');
var user=SharedPreference.instance.get('data6',serializable: true);
print('user.name is ${user['name']}'); 
var users=SharedPreference.instance.get('data7',serializable: true);
print('users[0].name is ${users[0]['name']}'); 
输出:
I/flutter (23132): data1 is abc
I/flutter (23134): users[0].name is xiaoming
```
删除key

```
SharedPreference.instance.removeKey('key');
```
清空sharepreference

```
SharedPreference.instance.clear();
```

