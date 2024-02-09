import 'package:flutter/material.dart';

class CureencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  const CureencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color:
            isInverted ? Colors.white : const Color.fromARGB(255, 25, 27, 36),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 28,
                      color: !isInverted
                          ? Colors.white
                          : const Color.fromARGB(255, 25, 27, 36),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                          color: !isInverted
                              ? Colors.white
                              : const Color.fromARGB(255, 25, 27, 36),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      code,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 2.6,
              child: Transform.translate(
                offset: const Offset(-4, 6),
                child: Icon(
                  icon,
                  color: !isInverted
                      ? Colors.white
                      : const Color.fromARGB(255, 25, 27, 36),
                  size: 60,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
