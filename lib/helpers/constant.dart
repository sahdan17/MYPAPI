import 'package:flutter/material.dart';

// laravel API
// const baseURL = 'http://127.0.0.1:8000/api';
// const baseURL = 'http://192.168.95.227:8000/api';
const baseURL = 'http://10.0.2.2:8000/api/MYP';
const loginURL = '$baseURL/login';
const logoutURL = '$baseURL/logout';
const userURL = '$baseURL/readuser';
const productURL = '$baseURL/products';

// Errors
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';

// input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    contentPadding: const EdgeInsets.all(10),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.black,
      ),
    ),
  );
}

// button
TextButton kTextButton(String label, Function onPressed) {
  return TextButton(
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
      padding: MaterialStateProperty.resolveWith(
        (states) => const EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
    ),
    onPressed: () => onPressed(),
  );
}
