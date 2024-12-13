import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          'I\'m a Backend Developer with experience in building${!Responsive.isLargeMobile(context) ? ' ' : '\n'}scalable, efficient,${!Responsive.isLargeMobile(context) ? '\n' : ' '}secure web applications and${Responsive.isLargeMobile(context) ? '\n' : ' '}backend systems.${Responsive.isLargeMobile(context) ? '\n' : '\n'}With expertise in JavaScript and PHP.',
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: value),
        );
      },
    );
  }
}