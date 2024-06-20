import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/user_provider.dart';
import 'package:riverpod_practice/shared/dialogs.dart';

import '../shared/textfields.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showDialog(BuildContext context, double bmi) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(bmi: bmi);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userNotifierProvider);
    final bmi = user.weight / (user.height * user.height);

    final heightController = TextEditingController();
    final weightController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              // const Text('BMI'),
              Text(
                'H',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              RoundedTextFormField(
                hintText: '키를 입력하세요',
                controller: heightController,
                onFieldSubmitted: (height) {
                  ref
                      .read(userNotifierProvider.notifier)
                      .updateHeight(double.parse(height));
                },
              ),
              Text(
                'W',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              RoundedTextFormField(
                hintText: '몸무게를 입력하세요',
                controller: weightController,
                onFieldSubmitted: (weight) {
                  ref
                      .read(userNotifierProvider.notifier)
                      .updateWeight(double.parse(weight));
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _showDialog(context, bmi);
                },
                child: const Text('확인'),
              ),
              // Text('bmi : $bmi'),
            ],
          ),
        ),
      ),
    );
  }
}
