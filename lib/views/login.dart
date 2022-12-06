import 'package:flutter/material.dart';
import 'package:mypapi_feext/views/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/constant.dart';
import '../models/api_res.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtUsername.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirect(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${response.error}',
          ),
        ),
      );
    }
  }

  void _saveAndRedirect(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('accessToken', user.accessToken ?? '');
    await pref.setString('rc', user.rc ?? '');
    await pref.setString('message', user.message ?? '');
    await pref.setString('idStore', user.idStore ?? '');
    await pref.setString('username', user.username ?? '');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Menu(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            TextFormField(
              controller: txtUsername,
              validator: (val) => val!.isEmpty ? 'Invalid username' : null,
              decoration: kInputDecoration('Username'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: txtPassword,
              obscureText: true,
              validator: (val) =>
                  val!.length < 6 ? 'Required at least 6 chars' : null,
              decoration: kInputDecoration('Password'),
            ),
            const SizedBox(
              height: 10,
            ),
            loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : kTextButton(
                    'Login',
                    () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                          _loginUser();
                        });
                      }
                    },
                  ),
            const SizedBox(
              height: 10,
            ),
            // kLoginRegisterHint(
            //   'Dont have an acount? ',
            //   'Register',
            //   () {
            //     Navigator.of(context).pushAndRemoveUntil(
            //       MaterialPageRoute(
            //         builder: (context) => Register(),
            //       ),
            //       (route) => false,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
