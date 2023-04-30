import 'package:flutter/material.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  String? _issue;
  bool loading = false;

  InputBorder textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );

  sendIssue() {
    if (_globalKey.currentState!.validate()) {
      //TODO: Code for sending suggestion
    }
  }

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Suggestion"),
      ),
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
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
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.send,
                      autofocus: true,
                      minLines: 10,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Type your suggestion here",
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        enabledBorder: textFieldBorder,
                        focusedBorder: textFieldBorder,
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red)),
                        focusedErrorBorder: textFieldBorder,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Cannot send empty suggestion';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _issue = value;
                      },
                      onFieldSubmitted: (value) {
                        _issue = value;
                        sendIssue();
                      },
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () async {
                              sendIssue();
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
                                    "Send",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ))),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
