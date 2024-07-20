import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.nextStep,
  });

  final void Function() nextStep;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  label: const Text('Email'),
                  hintText: 'Enter your Email Address',
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color:
                          Color.fromARGB(31, 245, 2, 2), // Default border color
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12, // Default border color
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (email) {
                  return email != null && EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: !_passwordVisible,
                obscuringCharacter: 'x',
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(_passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: _togglePasswordVisibility,
                  ),
                  label: const Text('Password'),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color:
                          Color.fromARGB(31, 245, 2, 2), // Default border color
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12, // Default border color
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: !_passwordVisible,
                obscuringCharacter: 'x',
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(_passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: _togglePasswordVisibility,
                  ),
                  label: const Text('Confirm Password'),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color:
                          Color.fromARGB(31, 245, 2, 2), // Default border color
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black12, // Default border color
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(fontSize: 15.0),
            ),
            const SizedBox(
              width: 12.0,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Log In',
                style: TextStyle(fontSize: 15.0, color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 70.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => widget.nextStep(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  maximumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Register',style: TextStyle(
                  color: Colors.white),),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
