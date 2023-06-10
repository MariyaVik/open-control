import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function()? onTap;
  const ServiceCard(
      {super.key, required this.child, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Ink(
            // margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            child: child,
          ),
        ),
      ),
    );
  }
}
