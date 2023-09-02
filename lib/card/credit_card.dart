import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'back.dart';
import 'front.dart';

class CreditCard extends StatefulWidget {
  final String cvv;
  final String number;
  final String expiry;

  const CreditCard({
    Key? key,
    required this.cvv,
    required this.number,
    required this.expiry,
  }) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  bool frontSide = true;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          angle = (angle + pi) % (2 * pi);
        });
      },
      child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 500),
          tween: Tween<double>(begin: 0, end: angle),
          builder: (context, double angle, _) {
            (angle >= (pi / 2)) ? frontSide = false : frontSide = true;
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0001)
                ..rotateY(angle),
              child: frontSide
                  ? CreditCardFront(
                      cardNo: widget.number,
                      exp: widget.expiry,
                    )
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(pi),
                      child: CreditCardBack(
                        cvv: widget.cvv,
                      ),
                    ),
            );
          }),
    );
  }
}
