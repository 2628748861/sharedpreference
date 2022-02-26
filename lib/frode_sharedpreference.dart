import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._privateConstructor();
  static final SharedPreference instance =
      SharedPreference._privateConstructor();
  late SharedPreferences _preferences;

  Future<String> init() async {
    try {
      _preferences = await SharedPreferences.getInstance();
      return 'SharedPreference初始化成功';
    } catch (e) {
      return 'SharedPreference初始化失败:$e';
    }
  }

  /// 设置key-value
  Future<bool> set(String key, dynamic value) async {
    assert(value != null);
    var type = value.runtimeType;
    print('type is $type');
    var result;
    switch (type) {
      case int:
        result = _preferences.setInt(key, value);
        break;
      case String:
        result = _preferences.setString(key, value);
        break;
      case bool:
        result = _preferences.setBool(key, value);
        break;
      case double:
        result = _preferences.setDouble(key, value);
        break;
      case List:
        result = _preferences.setStringList(key, value);
        break;
      default:
        String encodeValue = jsonEncode(value);
        result = _preferences.setString(key, encodeValue);
        break;
    }
    return result;
  }

  /// 获取指定key值得value
  /// serializable:是否是序列化对象
  dynamic get(String key, {bool serializable = false}) {
    if (!serializable) return _preferences.get(key);
    return jsonDecode(_preferences.get(key).toString());
  }

  /// 删除指定key值
  Future<bool> removeKey(String key) {
    if (!_preferences.containsKey(key)) throw '删除失败,key不存在';
    return _preferences.remove(key);
  }

  /// 清空
  Future<bool> clear() {
    return _preferences.clear();
  }
}
