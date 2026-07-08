import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:larica_ufba/theme/app_theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            const Text(
              'Organize-se melhor.',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Alinhe seus objetivos',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/tasks');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Continue'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}