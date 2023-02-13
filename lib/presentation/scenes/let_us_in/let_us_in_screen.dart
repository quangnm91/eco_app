import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LetUsInScreen extends StatelessWidget {
  const LetUsInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/images/let_in_bg.png'),
                fit: BoxFit.scaleDown,
                color: Colors.grey.shade50,
                colorBlendMode: BlendMode.multiply,
              ),
            ),
            Center(
              child: Text(
                'Let\'s in',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 10,
                    child: Image(image: AssetImage('assets/images/ic_fb.png')),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Continue with Facebook',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 10,
                    child:
                        Image(image: AssetImage('assets/images/ic_google.png')),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Continue with Google',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 10,
                    child:
                        Image(image: AssetImage('assets/images/ic_apple.png')),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Continue with Apple',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: Divider(endIndent: 8)),
                Text('or'),
                Expanded(child: Divider(indent: 8))
              ],
            ),
            const SizedBox(height: 24),
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
                'Sign in with password',
                style: TextStyle(color: Colors.white),
              ),
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
          ]),
    );
  }
}
