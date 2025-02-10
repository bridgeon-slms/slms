
  import 'package:flutter/material.dart';

Padding costumTextfeild() {
    return Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                    color: Colors.grey,
                  )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey
                    ),
                      borderRadius: BorderRadius.circular(12))),
            ),
          );
  }