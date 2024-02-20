import 'package:doctor/core/services/dio_helper/dio_helper.dart';
import 'package:doctor/core/services/dio_helper/endPoint.dart';
import 'package:doctor/core/services/sp_helper/sp_helper.dart';
import 'package:doctor/core/services/sp_helper/sp_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context)=>BlocProvider.of(context);

  bool isLogin=true;
  changeLoginState(){
    isLogin=!isLogin;
    emit(ChangeLoginStatus());
  }
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmationPasswordController=TextEditingController();
  var addressController=TextEditingController();
  var titleController=TextEditingController();

  Future<void> register()async{
    emit(RegisterLoadingState());
    final response=await DioHelper.postData(url: EndPoint.register, data: {
      "name":nameController.text,
      "email":emailController.text,
      "phone":phoneController.text,
      "password":passwordController.text,
      "password_confirmation":confirmationPasswordController.text,
      "title":titleController.text,
      "address":addressController.text,
      "gender":0,
    });
    if(response.statusCode==200){
      SharedPreferenceHelper.saveData(key: SharedPreferencesKeys.token, value:
      response.data['data']['token']
      );
      emit(RegisterSuccessState(response.data['message']));
    }
    else{
      emit(RegisterErrorState(response.data['message']));
      print(response.data);
    }
  }
}
