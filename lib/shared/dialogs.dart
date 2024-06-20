import 'package:flutter/material.dart';

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
              SizedBox(height: 20),
              Text(
                'Your BMI Result is...',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '$bmi',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
    });
  }
}
