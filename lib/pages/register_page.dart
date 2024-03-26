import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();

    if(_pwController.text == _confirmController.text){
      try{
        _auth.signUpWithEmailPassword(
        _emailController.text, 
        _pwController.text
        );
      }catch (e){
        showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
      }
    }
    else{
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passsword don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(height: 50),

          //welcome back message
          Text(
            "Let's create an account for you",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),

          // email textfield
          MyTextField(
            hinText: "Email",
            obscureText: false,
            controller: _emailController,
          ),

          const SizedBox(height: 10),

          //pw textfield
          MyTextField(
            hinText: "Password",
            obscureText: true,
            controller: _pwController,
          ),

          const SizedBox(height: 10),

          //confirm textfield
          MyTextField(
            hinText: "Confirm Password",
            obscureText: true,
            controller: _confirmController,
          ),

          const SizedBox(height: 20),
          //login button
          MyButton(
            text: "Register",
            onTap: () => register(context),
          ),

          const SizedBox(height: 20),
          //register

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
