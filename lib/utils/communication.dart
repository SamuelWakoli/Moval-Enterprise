import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Used to make phone calls.
Future<void> makePhoneCall() async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: "+254797228948",
  );
  await launchUrl(launchUri);
}

/// Used to open WhatsApp.
Future<void> openWhatsApp({required context}) async {
  final uri = Uri.parse("https://wa.me/254797228948");
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    // can't launch url
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Unable to launch WhatsApp")));
  }
}

/// Used to open Gmail
openGmail() async {
  //Email
  String email = Uri.encodeComponent("swwakoli@gmail.com");
  String subject = Uri.encodeComponent("Help Center");
  String body = Uri.encodeComponent("");
  Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
  await launchUrl(mail);
}
