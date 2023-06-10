import 'package:flutter/material.dart';
import 'package:todo_app/Auth/auth_controller.dart';
import 'package:todo_app/widget/text_form_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController controller = AuthController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          CustomButton(
            title: 'Login',
            onTap: (){
              controller.LogIn(context, emailController.text, passwordController.text);
            },
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text("Your Account has't Create Please Sign Up"),
          ),
        ],
      ),
    );
  }
}


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthController controller = AuthController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Textfield(
            title: 'Enter Your User Name',
            controller: userNameController,
          ),
          Textfield(
            title: 'Enter Your Email',
            controller: emailController,
          ),
          Textfield(
            title: 'Enter Your Password',
            controller: passwordController,
          ),
          CustomButton(
            title: 'Sign Up',
            onTap: (){
              controller.SignUp(context, userNameController.text, emailController.text, passwordController.text);
            },
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Your Account has't Create Please Sign Up"),
          ),
        ],
      ),
    );
  }
}
