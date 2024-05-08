import 'package:flutter/material.dart';
import 'package:ktebbi/views/widgets/home/RoundedImage.dart';

class LanguageAppButton extends StatelessWidget {
  const LanguageAppButton({super.key, required this.title, required this.flagUrl, this.onTap});

  final String title;
  final String flagUrl ; 
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          RoundedImage(imageUrl: flagUrl , isNetworkImage: false, borderRadius: 0, width: 30 , height: 30, fit: BoxFit.contain,) , 
          Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        ],)
      ),
    );
    
  }
}