import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moval/pages/report_issue.dart';
import 'package:moval/utils/communication.dart';
import 'package:moval/utils/navigation.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  double titleFontSize = 20.0, subTitleFontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Help Center"),
      ),
      body: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            children: [
              const ListTile(
                title: Text("Real-time assistance"),
              ),
              ListTile(
                onTap: () {
                  makePhoneCall();
                },
                leading: const Icon(
                  Icons.phone_outlined,
                  color: Colors.blue,
                ),
                title: Text(
                  "Call us",
                  style: TextStyle(fontSize: titleFontSize),
                ),
                subtitle: Text(
                  "+254797228948",
                  style: TextStyle(fontSize: subTitleFontSize),
                ),
              ),
              ListTile(
                onTap: () {
                  openWhatsApp(context: context);
                },
                leading: const Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                ),
                title: Text(
                  "WhatsApp us",
                  style: TextStyle(fontSize: titleFontSize),
                ),
                subtitle: Text(
                  "+254797228948",
                  style: TextStyle(fontSize: subTitleFontSize),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              const ListTile(
                title: Text("Other"),
              ),
              ListTile(
                onTap: () {
                  openGmail();
                },
                leading: Icon(
                  Icons.mail_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Mail us",
                  style: TextStyle(fontSize: titleFontSize),
                ),
                subtitle: Text(
                  "info@movalenterprise.com",
                  style: TextStyle(fontSize: subTitleFontSize),
                ),
              ),
              ListTile(
                onTap: () {
                  nextPage(context: context, page: const ReportIssue());
                },
                leading: Icon(
                  Icons.help_outline,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Report issue",
                  style: TextStyle(fontSize: titleFontSize),
                ),
                subtitle: Text(
                  "In-app",
                  style: TextStyle(fontSize: subTitleFontSize),
                ),
              ),
            ],
          )),
    );
  }
}
