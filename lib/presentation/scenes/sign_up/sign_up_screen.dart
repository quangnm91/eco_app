import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../base/checkbox_component.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 120),
        children: [
          Text('Create Your Account',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
          SizedBox(height: 36),
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
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)),
              hintText: 'Password',
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
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),
          const SizedBox(height: 36),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Sign up',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: Divider(endIndent: 8)),
              Text('or continue with'),
              Expanded(child: Divider(indent: 8))
            ],
          ),
          SizedBox(height: 16),
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
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10)),
                child: const CircleAvatar(
                  radius: 10,
                  child: Image(image: AssetImage('assets/images/ic_apple.png')),
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
                      text: 'Sign in',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () => {})
                ]),
          ),
        ],
      ),
    );
  }
}
