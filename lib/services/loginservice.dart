// @dart=2.9
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

class LoginService {

  Future<Token> login() async {
    SettingsData settings = new SettingsData();
    await settings.load();
    String baseUrl = settings.url;
    String appID = settings.appID;
    String appSecret = settings.appSecret;
    String terminal = settings.terminal;
    String username = settings.username;
    String password = settings.password;
    if (baseUrl == null || baseUrl.isEmpty)
      throw 'Posibolt url details not found';
    if (username == null || username.isEmpty || password == null || password.isEmpty)
      throw 'Please enter a username & password';
    String url = '$baseUrl/AdempiereService/oauth/token?username=$username&password=$password&grant_type=password&terminal=$terminal';
    // url = Uri.encodeFull(url);
    String credentials = "$appID:$appSecret";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);
    try {
      Response response = await get(
        Uri.parse(url),
        headers: {HttpHeaders.authorizationHeader: "Basic $encoded"},
      );
      if (response.statusCode != 200 && response.statusCode != 400) {
        throw 'Wrong values in settings';
      }
      if (response.body != null) {
        Map data = jsonDecode(response.body);
        if (data['error'] != null) {
          throw data['error_description'];
        } else if (data['access_token'] != null) {
          String access_token1 = json.decode(response.body)['access_token'];

          print("the tocken is $access_token1");

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token',access_token1);
          return Token.setInstance(data, settings.url);
        } else {
          throw 'Unable to connect to server';
        }
      } else {
        throw 'Unable to connect to server';
      }
    } on SocketException catch(e) {
      throw 'Unable to connect to server';
    } catch(e) {
      print(e);
      throw e;
    }
  }
}

class SettingsData {
  String url;
  String appID;
  String appSecret;
  String terminal;
  String username;
  String password;

  SettingsData({this.url,this.appID,this.appSecret,this.terminal});

  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('url', this.url);
    await prefs.setString('appID', this.appID);
    await prefs.setString('appSecret', this.appSecret);
    await prefs.setString('terminal', this.terminal);
  }

  Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String baseUrl = prefs.getString('url');
    String appID = prefs.getString('appID');
    String appSecret = prefs.getString('appSecret');
    String terminal = prefs.getString('terminal');
    this.url = baseUrl;
    this.appID = appID;
    this.appSecret = appSecret;
    this.terminal = terminal;
    this.username = prefs.getString('username');
    this.password = prefs.getString('password');
  }

  Future saveUserNamePassword(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
  }

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username');
    return username;
  }
}

class Token {
  String access_token;
  String token_type;
  int expires_in;
  DateTime createTime;
  String url;

  Token({this.access_token,this.token_type,this.expires_in});

  static Token setInstance (Map map, String url) {
    Token token = Token(access_token:map['access_token'],token_type:map['token_type'],expires_in:map['expires_in']);
    token.createTime = DateTime.now();
    token.url = url;
    // instance = token;
    return token;
  }

  bool isValid() {
    DateTime time = DateTime.now();
    Duration duration = time.difference(createTime);
    return duration.inSeconds <= expires_in;
  }
}