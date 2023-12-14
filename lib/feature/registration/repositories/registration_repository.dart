import 'package:dio/dio.dart';
import 'package:driver_app/core/consts/consts.dart';
import 'package:driver_app/feature/registration/models/token_model.dart';
import 'package:driver_app/feature/registration/models/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationRepository {
  final Dio dio;
  RegistrationRepository({required this.dio});

  Future<TokenModel> registration({required String otp}) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await dio.post(
      'accounts/tg-login',
      data: {'otp': otp},
    );
    // сохраняем
    final result = TokenModel.fromJson(response.data);
    // accessToken есть время жизни 20 дней примерно
    await prefs.setString('accessToken', result.access ?? '');
    // когда обычный токен закончелся refreshToken обновляет его
    await prefs.setString('refreshToken', result.refresh ?? '');
    
    final userInfo = await dio.get(
      'accounts/me/',
      options: Options(
        headers: {
          'Authorizaation': 'Bearer ${prefs.getString(AppConsts.accesToken)}',
        },
      ),
    );

    final UserInfoModel userInfoData = UserInfoModel.fromJson(userInfo.data);

    await prefs.setString('id', userInfoData.id ?? '');

    return result;
  }
}
