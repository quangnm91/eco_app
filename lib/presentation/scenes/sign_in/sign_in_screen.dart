import 'package:eco_app/data/local/authenticated_cache.dart';
import 'package:eco_app/domain/usecases/auth_usecase.dart';
import 'package:eco_app/presentation/scenes/sign_in/sign_in_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector.dart';
import '../../widgets/checkbox_component.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = SignInBloc(
        authUsecases: injector<AuthUsecases>(),
        authenticatedCache: injector<AuthenticatedCache>());
    return BlocListener<SignInBloc, SignInState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == SignInStatus.error) {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('ERROR'),
                  content: Text(state.message),
                  actions: [
                    TextButton(
                        child: const Text('Ok'),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                );
              });
        }
        if (state.status == SignInStatus.success) {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('SUCCESS'),
                  content: const Text('Press Ok to continue!'),
                  actions: [
                    TextButton(
                        child: const Text('Ok'),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                );
              });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          padding:
              const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 120),
          children: [
            const Text('Login to Your Account',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(height: 36),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? Colors.black
                        : Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
              onChanged: bloc.rxEmail.sink.add,
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                hintText: 'Email',
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? Colors.black
                        : Colors.grey),
                suffixIcon: const Icon(Icons.visibility_off),
                suffixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? Colors.black
                        : Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
              onChanged: bloc.rxPassword.sink.add,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CheckboxComponent(),
                Text(
                  'Remember me',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(height: 8),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
              ),
              onPressed: () {
                bloc.add(ClickSignInButtonEvent(
                    bloc.rxEmail.values.last, bloc.rxPassword.values.last));
              },
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Forgot the password?',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(child: Divider(endIndent: 8)),
                Text('or continue with'),
                Expanded(child: Divider(indent: 8))
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10)),
                  child: const CircleAvatar(
                    radius: 10,
                    child: Image(image: AssetImage('assets/images/ic_fb.png')),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10)),
                  child: const CircleAvatar(
                    radius: 10,
                    child:
                        Image(image: AssetImage('assets/images/ic_google.png')),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10)),
                  child: const CircleAvatar(
                    radius: 10,
                    child:
                        Image(image: AssetImage('assets/images/ic_apple.png')),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Dont have an account? ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {print('on tap sign up')})
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
