import 'package:flutter/material.dart';

TextStyle headTextStyle() {
  return const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}


TextStyle subTitel() {
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
}

InputDecoration appInputStyle(label) {
  return InputDecoration(

      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      fillColor: Colors.black12,
      filled: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      hintText: label,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ));
}

ButtonStyle buttonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    shadowColor: const Color(0x00000004),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    elevation: 4,
  );
}
