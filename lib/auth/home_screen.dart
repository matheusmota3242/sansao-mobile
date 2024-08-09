import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sansao_mobile/api/api_service.dart';
import 'package:sansao_mobile/training/training_references_screen.dart';
import 'package:sansao_mobile/utils/screen_utils.dart';

import 'auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _storage = const FlutterSecureStorage();
  final _formKey = GlobalKey<FormState>();

  final _authService = AuthService();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  var authenticated = false;

  @override
  void initState() {
    _authService.validateUserToken().then((value) {
      if (value.body == true) {
        setState(() {
          authenticated = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Padding(
      padding: ScreenUtils.screenPadding,
      child: authenticated
          ? const TrainingReferencesScreen()
          : Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: textTheme.titleMedium,
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: 'Username',
                        labelStyle: textTheme.labelMedium),
                  ),
                  TextFormField(
                    style: textTheme.titleMedium,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: textTheme.labelMedium),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _authService
                              .authenticate(_usernameController.text,
                                  _passwordController.text)
                              .then((value) async {
                            if (value.hasError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'An error happpened while authenticating'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Authenticated'),
                                ),
                              );
                              setState(() {
                                authenticated = true;
                              });
                            }
                          });
                        }
                      },
                      child: const Text('Enviar'))
                ],
              )),
    ));
  }
}
