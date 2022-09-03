import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../buttons/RoundIconButton.dart';

class AgeOrWeight extends StatelessWidget {
  const AgeOrWeight({
    Key? key,
    required this.title,
    required this.lableText,
    required this.controller, required this.onPressedMinus, required this.onPressedPlus,
  }) : super(key: key);

  final String title;
  final String lableText;
  final TextEditingController? controller;
  final Function onPressedMinus;
  final Function onPressedPlus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 15,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[800],
          ),
          height: 200,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 120,
                  child: TextFormField(

                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*')),
                    ],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    autovalidateMode: AutovalidateMode.disabled,
                    controller: controller,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: lableText,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundIconButton(icon: Icons.remove, onPressed: ()=>onPressedMinus()),
                  const SizedBox(
                    width: 20,
                  ),
                  RoundIconButton(icon: Icons.add, onPressed: ()=>onPressedPlus()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
