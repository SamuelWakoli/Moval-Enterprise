import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditUsername extends StatefulWidget {
  const EditUsername({Key? key}) : super(key: key);

  @override
  State<EditUsername> createState() => _EditUsernameState();
}

class _EditUsernameState extends State<EditUsername> {
  String? _newUsername;
  bool loading = false;

  InputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Enter new name",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      label: const Text("Name"),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                      errorBorder: textFieldBorder,
                      focusedErrorBorder: textFieldBorder,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _newUsername = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () async {
                            if (_newUsername != null) {
                              setState(() {
                                loading = true;
                              });
                              FirebaseAuth.instance.currentUser!
                                  .updateDisplayName(_newUsername)
                                  .whenComplete(() => Navigator.pop(context));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Enter your name")));
                            }
                          },
                          child: loading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Text(
                                  "Update username",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ))),
                ],
              ),
            )),
      ),
    );
  }
}
