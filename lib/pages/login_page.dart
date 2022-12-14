import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30.0),
                const Text('Почта пользователя:', style: TextStyle(fontSize: 20.0),),
                TextFormField(
                  key: const Key('emailTextField'),
                  decoration: const InputDecoration(
                    hintText: "Enter email",
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Пожалуйста введите свой Email';
                    String p = "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                    RegExp regExp = new RegExp(p);
                    if (regExp.hasMatch(value)) return null;
                    return 'Это не E-mail';
                  },
                ),
                const SizedBox(height: 30.0),
                const Text('Пароль:', style: TextStyle(fontSize: 20.0),),
                TextFormField(
                  key: const ValueKey('passwordTextField'),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Пожалуйста введите ваш пароль';
                  },
                ),
                new SizedBox(height: 20.0),
                ElevatedButton(onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/second');
                  }
                }, child: const Text('Проверить',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}

