import 'package:e_commerce/core/resources/constatnt_manager.dart';
import 'package:e_commerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@Singleton(as:AuthLocalDataSource )
class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(LocalContstant.token)!;
  }

  @override
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(LocalContstant.token, token);
  }
}
