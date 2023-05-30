import 'package:flutter/material.dart';


class BuildInkWell extends StatelessWidget {
  const BuildInkWell({
    super.key,
    required this.icon,
    required this.text,
  });

  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.9, color: Colors.grey))),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 24,
                color: Colors.white,
              ),
              const SizedBox(width: 15),
              Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
