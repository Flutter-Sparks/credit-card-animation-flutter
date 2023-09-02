import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCardFront extends StatefulWidget {
  final String cardNo;
  final String exp;

  const CreditCardFront({
    Key? key,
    required this.cardNo,
    required this.exp,
  }) : super(key: key);

  @override
  State<CreditCardFront> createState() => _CreditCardFrontState();
}

class _CreditCardFrontState extends State<CreditCardFront> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 370,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 56, 56, 56)),
        gradient: const LinearGradient(colors: [
          Color(0xff29282A),
          Color.fromARGB(255, 59, 59, 59),
        ]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage('assets/bank_logo.png'),
                height: 20,
              ),
              Text(
                'Mono Bank',
                style: GoogleFonts.poppins().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage('assets/chip.png'),
                height: 27,
              ),
              Image(
                image: AssetImage('assets/nfc.png'),
                height: 32,
              ),
            ],
          ),
          const SizedBox(height: 13),
          Text(
            widget.cardNo.isEmpty ? 'XXXX XXXX XXXX XXXX' : widget.cardNo,
            style: GoogleFonts.inconsolata().copyWith(
                color: widget.cardNo.isEmpty
                    ? Colors.white.withOpacity(0.2)
                    : Colors.white,
                fontSize: 23,
                letterSpacing: 2),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.exp.isEmpty ? 'XX/XX' : widget.exp,
                style: GoogleFonts.inconsolata().copyWith(
                    color: Colors.white.withOpacity(0.3), fontSize: 19),
              ),
              const Image(
                image: AssetImage('assets/mcard.png'),
                height: 27,
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
