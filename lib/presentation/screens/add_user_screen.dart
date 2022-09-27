import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:note_app/presentation/controller/note_bloc.dart';
import 'package:note_app/presentation/controller/note_event.dart';
import 'package:note_app/presentation/controller/note_state.dart';

import '../../core/services/service_locator.dart';
import '../controller/user/user_bloc.dart';
import '../controller/user/user_event.dart';
import '../controller/user/user_state.dart';
import 'component/component.dart';
import 'component/get_image_screen.dart';
import 'component/get_interest_data_screen.dart';

class AddUserScreen extends StatefulWidget {
  AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  IconData suffixIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context) => sl<UserBloc>(),
        child: BlocBuilder<UserBloc, UserState>
          (builder: (context, state) {

            print(state.userImage);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add User'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const GetImageScreen(),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          label: 'User Name',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Name must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.text,
                        suffixIcon: suffixIcon,
                        validator: (value) {
                          if (value.length < 8) {
                            return 'password should have alphabet and numbers with minimum length of 8 char';
                          }
                          return null;
                        },
                        sufixPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                            suffixIcon = isPassword
                                ? Icons.visibility
                                : Icons.visibility_off;
                          });
                        },
                        isPassword: isPassword,
                        label: 'Password',
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.text,
                          label: 'Email',
                          validator: (value) {
                            if (!EmailValidator.validate(value)) {
                              return 'Incorrect Email';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: height * 0.04,
                      ),
                       GetInterestDataScreen(),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      defaultButton(function: (){
                        if(formKey.currentState!.validate()){

                          sl<UserBloc>().add(AddUserEvent(
                            image: state.userImage.toString()=="null"?null:state.userImage.toString(),
                            email: emailController.text,
                            interstedId: (GetInterestDataScreen().index).toString(),
                            password: passwordController.text,
                            userName: nameController.text
                          ));
                        }
                      }, text: 'Save'),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
