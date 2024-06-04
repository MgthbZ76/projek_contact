import 'package:flutter/material.dart';

class CostomizedTextfield extends StatefulWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;

  const CostomizedTextfield({Key? key, required this.myController, this.hintText, this.isPassword}) : super(key: key);

  @override
  _CostomizedTextfieldState createState() => _CostomizedTextfieldState();
}

class _CostomizedTextfieldState extends State<CostomizedTextfield> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType: widget.isPassword!
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: !widget.isPassword!,
        autocorrect: !widget.isPassword!,
        obscureText: widget.isPassword! ? _isObscure : false,
        controller: widget.myController,
        decoration: InputDecoration(
          prefixIcon: widget.isPassword! ? const Icon(Icons.lock) : const Icon(Icons.email),
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: const Color(0xffE8ECF4),
          filled: true,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }
          return null;
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CostomizedTextfield extends StatefulWidget {
//   final TextEditingController myController;
//   final String? hintText;
//   final bool? isPassword;

//   const CostomizedTextfield({Key? key, required this.myController, this.hintText, this.isPassword}) : super(key: key);

//   @override
//   _CostomizedTextfieldState createState() => _CostomizedTextfieldState();
// }

// class _CostomizedTextfieldState extends State<CostomizedTextfield> {
//   bool _isObscure = true;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: TextField(
//         keyboardType: widget.isPassword!
//             ? TextInputType.visiblePassword
//             : TextInputType.emailAddress,
//         enableSuggestions: !widget.isPassword!,
//         autocorrect: !widget.isPassword!,
//         obscureText: _isObscure,
//         controller: widget.myController,
//         decoration: InputDecoration(
//           suffixIcon: widget.isPassword!
//               ? IconButton(
//                   icon: Icon(
//                     _isObscure ? Icons.visibility : Icons.visibility_off,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _isObscure = !_isObscure;
//                     });
//                   },
//                 )
//               : null,
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           fillColor: const Color(0xffE8ECF4),
//           filled: true,
//           hintText: widget.hintText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
// }
