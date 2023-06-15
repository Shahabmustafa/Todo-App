import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/View_Model/login_controller.dart';
import '../Res/Component/custom_button.dart';
import '../Res/Component/text_form_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Textfield(
            title: 'Enter Your Email',
            controller: emailController,
          ),
          Textfield(
            title: 'Enter Your Password',
            controller: passwordController,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            loading: loginController.loading,
            title: 'Login',
            onTap: (){
              loginController.logIn(context,
                  emailController.text,
                  passwordController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
