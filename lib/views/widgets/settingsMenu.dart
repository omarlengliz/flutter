import 'package:flutter/material.dart';
import 'package:ktebbi/core/constants/color.dart';
import 'package:ktebbi/views/widgets/home/headingSection.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({super.key, required this.icon, required this.title, required this.subtitle, required this.children});
  final IconData icon ;
  final String title ;
  final String subtitle ;
  final List<Widget> children ; 

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(  
      shape: Border(),
      
      leading: Icon(icon , size:28 , color :AppColor.primary ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subtitle,style: Theme.of(context).textTheme.labelMedium,),
      expandedCrossAxisAlignment:CrossAxisAlignment.start ,
      children:children

    );
  }
}