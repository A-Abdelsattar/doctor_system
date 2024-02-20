import 'package:doctor/core/utils/app_colors.dart';
import 'package:doctor/features/auth_view/view_model/cubit/auth_cubit.dart';
import 'package:doctor/features/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AuthCubit(),
  child: Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is RegisterSuccessState){
      print(state.message);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
    }
  },
  builder: (context, state) {
    var cubit=AuthCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
         children: [
            SizedBox(height: 50,),
            Center(
              child: Text(cubit.isLogin?'Login':"Register",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
            SizedBox(height: 80,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:AppColors.kGreyColor
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          if(!cubit.isLogin){
                          cubit.changeLoginState();}
                        },
                        child: Container(
                                           width: MediaQuery.of(context).size.width/2.4,
                          decoration: BoxDecoration(
                            color: cubit.isLogin?AppColors.kMainColor:AppColors.kGreyColor,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text("Login",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          if(cubit.isLogin){
                          cubit.changeLoginState();}
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/2.4,
                          decoration: BoxDecoration(
                            color:cubit.isLogin? AppColors.kGreyColor:AppColors.kMainColor,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text("Register",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 60,),
            if(cubit.isLogin)
            Form(child: Column(
              children: [TextFormField(
                cursorColor: AppColors.kMainColor,
                decoration: InputDecoration(

                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,vertical: 15
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.kMainColor),
                      borderRadius: BorderRadius.circular(20)
                  ),

                ),
              ),
                SizedBox(height: 20,),
                TextFormField(
                  cursorColor: AppColors.kMainColor,
                  decoration: InputDecoration(

                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kMainColor),
                        borderRadius: BorderRadius.circular(20)
                    ),

                  ),
                ),],
            )),
            if(!cubit.isLogin)
            Form(child: Column(
              children: [
                TextFormField(
                  controller: cubit.nameController,
                cursorColor: AppColors.kMainColor,
                decoration: InputDecoration(
                  hintText: 'name',
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,vertical: 15
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.kMainColor),
                      borderRadius: BorderRadius.circular(20)
                  ),

                ),
              ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: cubit.emailController,
                  cursorColor: AppColors.kMainColor,
                  decoration: InputDecoration(
                    hintText: 'email',
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kMainColor),
                        borderRadius: BorderRadius.circular(20)
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: cubit.phoneController,
                  cursorColor: AppColors.kMainColor,
                  decoration: InputDecoration(
                    hintText: 'phone',
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kMainColor),
                        borderRadius: BorderRadius.circular(20)
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: cubit.passwordController,
                  cursorColor: AppColors.kMainColor,
                  decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kMainColor),
                        borderRadius: BorderRadius.circular(20)
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: cubit.confirmationPasswordController,
                  cursorColor: AppColors.kMainColor,
                  decoration: InputDecoration(
                    hintText: "confirm password",
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kMainColor),
                        borderRadius: BorderRadius.circular(20)
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: cubit.addressController,
                  cursorColor: AppColors.kMainColor,
                  decoration: InputDecoration(
                    hintText: "address",
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kMainColor),
                        borderRadius: BorderRadius.circular(20)
                    ),

                  ),
                ),
                 SizedBox(height: 20,),
                TextFormField(
                  controller: cubit.titleController,
                  cursorColor: AppColors.kMainColor,
                  decoration: InputDecoration(
                    hintText: "title",
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,vertical: 15
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kMainColor),
                        borderRadius: BorderRadius.circular(20)
                    ),

                  ),
                ),

                ElevatedButton(onPressed: (){
                  cubit.register();
                }, child: Text("register"))
              ],
            ))

          ],
        ),
    );
  },
),
    ),
);
  }
}
