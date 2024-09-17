import 'package:flutter/material.dart';
import 'package:movie_app/widgets/bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Por favor, insira seu e-mail';

                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                    return 'Por favor, insira um e-mail válido';

                  if (value != 'felipeMurilo@gmail.com')
                    return 'Email ou senha inválido';

                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Por favor, insira sua senha';

                  if (value != '123') return 'Email ou senha inválido';
                  return null;
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login bem-sucedido')),
                    );

                    await Future.delayed(Duration(seconds: 2), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavBar()));
                    }).timeout(Duration(seconds: 2));
                  }
                },
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
