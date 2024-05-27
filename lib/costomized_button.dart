import 'package:flutter/material.dart';

class CostomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  const CostomizedButton({Key? key, this.buttonText, this.buttonColor, this.onPressed, this.textColor}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    border: Border.all(width: 1,color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        buttonText!,
                         style: TextStyle(color: textColor, fontSize: 20,
                         ),
                      ))),
              ),
    );
  }
}