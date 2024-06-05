import 'package:flutter/material.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
   final textfield = TextEditingController();

  onNumberTapped(value) {
    setState(() {
      textfield.text += value;
    });
  }

  onCancelText() {
    if (textfield.text.isNotEmpty) {
      var newvalue = textfield.text.substring(0, textfield.text.length - 1);
      setState(() {
        textfield.text = newvalue;
      });
    }
  }

  Widget inputField() {
    return Container(
      color: Colors.white,
      height: 60,
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        readOnly: true,
        enableInteractiveSelection: false,
        controller: textfield,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }

  Widget gridView() { 
    return Container(
      width: 500,
      padding: const EdgeInsets.only(left: 80, right: 80, top: 60),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        children: [
          keyField("1"),
          keyField("2"),
          keyField("3"),
          keyField("4"),
          keyField("5"),
          keyField("6"),
          keyField("7"),
          keyField("8"),
          keyField("9"),
          starField(),
          keyField("0"),
          hashField(),
          blankField(),
          dialField(),
          backSpace()
        ],
      ),
    );
  }

  Widget keyField(numb) {
    return InkWell(
      onTap: () => onNumberTapped(numb),
      child: Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(60)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numb,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget starField() {
    return InkWell(
      onTap: () => onNumberTapped("*"),
      child: Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(60)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "*",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget hashField() {
    return InkWell(
      onTap: () => onNumberTapped("#"),
      child: Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(60)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "#",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget backSpace() {
    if (textfield.text.isNotEmpty) {
      return InkWell(
        onTap: () => onCancelText(),
        child: Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.backspace_outlined,
                size: 25,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(height: 0);
    }
  }

  Widget dialField() {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.green[500], borderRadius: BorderRadius.circular(60)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.phone,
            size: 35,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget blankField() {
    return InkWell(
      child: Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(60)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Calls'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(children: [inputField(), gridView()]),
      ),
    );
  }
}