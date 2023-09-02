import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'card/credit_card.dart';
import 'formatters/index.dart';

void main() {
  runApp(const CreditCardExampleApp());
}

class CreditCardExampleApp extends StatelessWidget {
  const CreditCardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: CardPage(),
      ),
    );
  }
}

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late TextEditingController _cvvCTRL;
  late TextEditingController _noCTRL;
  late TextEditingController _expCTRL;

  @override
  void initState() {
    _cvvCTRL = TextEditingController();
    _noCTRL = TextEditingController();
    _expCTRL = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cvvCTRL.dispose();
    _noCTRL.dispose();
    _expCTRL.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget input({
      required String placeHolder,
      required TextEditingController controller,
      required List<TextInputFormatter> formatters,
    }) {
      return TextFormField(
        inputFormatters: formatters,
        onChanged: (value) {
          setState(() {});
        },
        controller: controller,
        style: GoogleFonts.poppins().copyWith(
          fontSize: 13,
        ),
        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins()
              .copyWith(color: Colors.grey, letterSpacing: 1),
          hintText: placeHolder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 176, 176, 176),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 220, 220, 220),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Image(
          image: AssetImage('assets/logo.png'),
          height: 30,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CreditCard(
                  cvv: _cvvCTRL.text,
                  number: _noCTRL.text,
                  expiry: _expCTRL.text,
                ),
                const SizedBox(height: 50),
                Form(
                    child: Column(
                  children: [
                    input(
                      placeHolder: 'CARD NUMBER',
                      controller: _noCTRL,
                      formatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CardNumberFormatter(),
                        LengthLimitingTextInputFormatter(19)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                            child: input(
                          formatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            EXPFormatter()
                          ],
                          placeHolder: 'EXPIRY (MM/DD)',
                          controller: _expCTRL,
                        )),
                        const SizedBox(width: 15),
                        Flexible(
                          child: input(
                            formatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3)
                            ],
                            placeHolder: 'CVV',
                            controller: _cvvCTRL,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Add Payment method'.toUpperCase(),
                          style: GoogleFonts.poppins().copyWith(
                            letterSpacing: 1,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
