import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_practice/shared/buttons.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          width: constraints.maxWidth * 0.7,
          height: constraints.maxHeight * 0.5,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Your BMI Result is...',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '$bmi',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(child: Center(child: BmiResult(bmi: bmi))),
              CustomButton(
                  buttonText: 'OK',
                  onTap: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      );
    });
  }
}

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, required this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    if (bmi <= 18.5) {
      return const Text('저체중');
    } else if (bmi > 18.5 && bmi <= 23) {
      return const Text('정상');
    } else if (bmi > 23 && bmi <= 25) {
      return const Text('비만전단계');
    } else if (bmi > 25 && bmi <= 30) {
      return const Text('1단계 비만');
    } else if (bmi > 30 && bmi <= 35) {
      return const Text('2단계 비만');
    } else {
      return const Text('3단계 비만');
    }
  }
}
