import 'package:flutter/material.dart';

class ModeAppButton extends StatelessWidget {
  const ModeAppButton({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
    
  }
}
