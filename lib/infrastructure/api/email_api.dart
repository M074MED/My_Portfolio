import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../failures/email_failure.dart';
import 'email_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailjs/emailjs.dart' as emailjs;

abstract class EmailApi {
  Future<Email> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailApiImpl implements EmailApi {
  EmailApiImpl();

  _saveEmailToDatabase({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore.collection('contact').add({
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
      }).then((value) {
        debugPrint("Email saved to database");
      }).catchError((error) {
        log("Error saving email to database: $error");
      });
    } catch (e) {
      log("Error saving email to database: $e");
    }
  }

  Future<Email> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    _saveEmailToDatabase(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );
    try {
      Map<String, dynamic> templateParams = {
        "subject": subject,
        "from_name": name,
        "from_email": email,
        "message": message,
        "to_name": name,
        "to_email": email,
      };

      emailjs.EmailJSResponseStatus response = await emailjs.send(
        'sendgrid',
        'contact_me',
        templateParams,
        emailjs.Options(
          publicKey: const bool.hasEnvironment('EMAILJS_PUBLIC_KEY')
              ? const String.fromEnvironment('EMAILJS_PUBLIC_KEY')
              : dotenv.env['EMAILJS_PUBLIC_KEY'] ?? '',
          privateKey: const bool.hasEnvironment('EMAILJS_PRIVATE_KEY')
              ? const String.fromEnvironment('EMAILJS_PRIVATE_KEY')
              : dotenv.env['EMAILJS_PRIVATE_KEY'] ?? '',
        ),
      );

      if (response.status == 200) {
        debugPrint("Send Email Success: ${response.text}");
        return Email(status: "success");
      } else {
        log("Send Email Error: ${response.text}");
        throw EmailFailure.serverError();
      }
    } catch (e) {
      log("Send Email Error: ${e.toString()}");
      throw EmailFailure.serverError();
    }
  }
}
