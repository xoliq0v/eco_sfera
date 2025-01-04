import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';

class PriceBadge extends StatefulWidget {
  const PriceBadge({super.key});

  @override
  State<PriceBadge> createState() => _PriceBadgeState();
}

class _PriceBadgeState extends State<PriceBadge> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 50,
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(35),
          ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg'
                ),
              ),
              15.horizontalSpace,
              Text('1,000', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 15
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
