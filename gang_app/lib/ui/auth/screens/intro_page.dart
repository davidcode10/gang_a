import 'package:flutter/material.dart';
import 'package:gang_app/ui/auth/screens/login_register.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: true,
      next: const Icon(Icons.arrow_forward),
      skip: const Text("Skip"),
      done: const Text("Done"),
      nextColor: Colors.white,
      skipColor: Colors.white,
      doneColor: Colors.white,
      globalBackgroundColor: const Color(0xFF4CA456),
      dotsDecorator: const DotsDecorator(activeColor: Colors.white),
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginRegister()));
      },
      onSkip: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginRegister()));
      },
      pages: [
        PageViewModel(
            reverse: true,
            title: 'Welcome',
            body: 'To the world of GangAPP',
            footer: Container(
              padding: const EdgeInsets.only(top: 89),
              child: Column(
                children: [
                  Image.asset('assets/image/GangAPP_logo.png'),
                  const Padding(
                      padding: EdgeInsets.only(top: 11),
                      child: Text(
                        'Here you will find Gangas',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ))
                ],
              ),
            ),
            decoration: const PageDecoration(
              titlePadding: EdgeInsets.only(top: 104, bottom: 11),
              titleTextStyle: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              bodyTextStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              pageColor: Color(0xFF4CA456),
            )),
      ],
    );
  }

  Widget sentences(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.white),
      ),
    );
  }

  Widget writer(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 54, right: 30),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.white),
      ),
    );
  }
}
