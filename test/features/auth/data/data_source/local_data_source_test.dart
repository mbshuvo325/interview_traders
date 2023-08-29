
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traders/featurs/auth/data/data_source/local_data_source.dart';

class MocSharedPreference extends Mock implements SharedPreferences {}

void main() {
  AuthLocalDataSourceImpl? authLocalDataSourceImpl;
  MocSharedPreference? mocSharedPreference;

  setUp(() {
    mocSharedPreference = MocSharedPreference();
    authLocalDataSourceImpl = AuthLocalDataSourceImpl(sharedPreferences: mocSharedPreference!);
  });

  group("Local Database", () {
    test("Should return token", () async{
      when(mocSharedPreference!.getString("token")).thenReturn("token");
      final result = await authLocalDataSourceImpl!.getToken();
      verify(mocSharedPreference!.getString("token"));
      expect(result, equals("token"));
    });

    test("Should set and return token", () async{
      await authLocalDataSourceImpl!.cacheToken("token");
      verify(mocSharedPreference!.setString("token", "token"));
    });
  });
}