import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../failures/email_failure.dart';
import 'package:http/http.dart' as http;
import '../../values/values.dart';
import 'email_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class EmailApi {
  ///portfolio-api-chi.vercel.app/api/getintouch
  Future<Email> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailApiImpl implements EmailApi {
  final http.Client client;
  static const _sendGridUrl = 'https://api.sendgrid.com/v3/mail/send';

  EmailApiImpl({required this.client});

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
      var headers = {
        'Authorization': 'Bearer ${dotenv.env['SENDGRID_API_KEY']}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(_sendGridUrl));
      request.body = json.encode({
        "personalizations": [
          {
            "to": [
              {"email": StringConst.DEV_EMAIL},
              {"email": "${dotenv.env['MY_PERSONAL_EMAIL']}"}
            ]
          }
        ],
        "from": {"email": StringConst.DEV_EMAIL, "name": name},
        "subject": "Message from My Portfolio: $subject",
        "content": [
          {
            "type": "text/html",
            "value": """
<h1 style="text-align: center;">Message from My Portfolio</h1>
<h4>From: $name</h4>
<h4>email: <a href="mailto:$email">$email</a></h4>
<h2 style="text-align: center;">Content</h2>
$message
"""
          }
        ]
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 202) {
        // SendGrid returns 202 for success
        debugPrint("SendGrid Success: ${response.reasonPhrase}");
        return Email(status: "success");
      } else {
        log("SendGrid Error: ${response.reasonPhrase}");
        throw EmailFailure.serverError();
      }
    } catch (e) {
      log("SendGrid Error: ${e.toString()}");
      throw EmailFailure.serverError();
    }
  }
}
