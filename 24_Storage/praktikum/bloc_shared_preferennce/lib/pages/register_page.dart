import 'package:bloc_shared_preferennce/bloc/user_bloc.dart';
import 'package:bloc_shared_preferennce/pages/home_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final userProvider = BlocProvider.of<UserBloc>(context);
    userProvider.add(
      CheckUser(context: context),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text('Name'),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
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
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
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
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
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
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserChanged) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: state.toogle,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<UserBloc>(context)
                                  .add(ChangeUser());
                            },
                            icon: Icon(state.toogle
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.3)),
                          border: const UnderlineInputBorder(),
                        ),
                        validator: (password) {
                          if (password != null && password.length < 5) {
                            return 'Enter min. 5 characters';
                          }
                          return null;
                        },
                      );
                    }
                    return const Text('Something went wrong');
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
                      userProvider.add(AddBool(newUser: false));
                      userProvider.add(AddName(username: username));
                      userProvider.add(AddEmail(email: email));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
