import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/user_provider.dart';
import 'package:riverpod_practice/shared/buttons.dart';
import 'package:riverpod_practice/shared/dialogs.dart';

import '../shared/textfields.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _showDialog(BuildContext context, double bmi) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(bmi: bmi);
      },
    );
  }

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);
    final bmi = double.parse(
        (user.weight / (user.height * user.height) * 10000).toStringAsFixed(1));

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  height == ''
                      ? 0
                      : ref
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
                  weight == ''
                      ? 0
                      : ref
                          .read(userNotifierProvider.notifier)
                          .updateWeight(double.parse(weight));
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonText: 'Enter',
                onTap: () {
                  _showDialog(context, bmi);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
