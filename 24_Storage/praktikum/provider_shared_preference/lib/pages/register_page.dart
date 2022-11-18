import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shared_preference/pages/home_page.dart';
import 'package:provider_shared_preference/providers/user_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.checkRegister(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text('Name'),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    border: const UnderlineInputBorder(),
                  ),
                  validator: (name) {
                    if (name != null && name.length < 4) {
                      return 'Enter at least 4 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Email'),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    border: const UnderlineInputBorder(),
                  ),
                  validator: (email) {
                    if (email != null && !EmailValidator.validate(email)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Phone Number'),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                    border: const UnderlineInputBorder(),
                  ),
                  validator: (phoneNumber) {
                    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

                    if (phoneNumber!.isEmpty) {
                      return 'Please enter mobile number';
                    } else if (!regExp.hasMatch(phoneNumber)) {
                      return 'Please enter valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Password'),
                const SizedBox(
                  height: 10,
                ),
                Consumer<UserProvider>(
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: value.toogle,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            value.toogleTheme();
                          },
                          icon: Icon(value.toogle
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.3)),
                        border: const UnderlineInputBorder(),
                      ),
                      validator: (password) {
                        if (password != null && password.length < 5) {
                          return 'Enter min. 5 characters';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    String username = _nameController.text;
                    String email = _emailController.text;

                    if (isValidForm) {
                      userProvider.addBool(false);
                      userProvider.setName(username);
                      userProvider.setEmail(email);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  child: const Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
