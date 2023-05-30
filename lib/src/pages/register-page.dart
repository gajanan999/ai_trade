import 'package:ai_trade/src/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user-model.dart';
import '../constants/constant.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            REGISTER_HEADER,
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: REGISTER_USERNAME_LABEL,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => userModel.username = value,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: REGISTER_PASSWORD_LABEL,
                  ),
                  obscureText: true,
                  onChanged: (value) => userModel.password = value,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: REGISTER_MOBILENUMBER_LABEL,
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => userModel.mobileNumber = value,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    // // Attempt to register a new user with the entered credentials
                    // bool success = await userModel.registerUser();
                    // if (success) {
                    //   // If successful, navigate to the home page
                    //   Navigator.pushReplacementNamed(context, '/home');
                    // } else {
                    //   // If unsuccessful, display an error message
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Error registering user'),
                    //     ),
                    //   );
                    // }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size.fromWidth(80)),
                  ),
                  child: const Text(REGISTER_BUTTON),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
