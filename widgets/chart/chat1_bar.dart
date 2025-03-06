import 'package:flutter/material.dart';

class Chat1Bar extends StatelessWidget {
  const Chat1Bar({super.key,required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    // print(fill);
      print(fill);
    // TODO: implement build
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          // width: 20,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
                 

              color: Theme.of(context).colorScheme.primary.withValues( alpha: 1),
            ),
          ),
        ),
      ),
    );
  }
}
