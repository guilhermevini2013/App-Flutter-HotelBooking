import 'package:shared_preferences/shared_preferences.dart';

class ConfigAPI{
  final String _host = '192.168.31.106';
  final int _port = 8080;
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String get host => _host;

  int get port => _port;

  static Future<SharedPreferences> get prefs => _prefs;
}