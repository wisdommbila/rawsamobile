import 'package:flutter/material.dart';
import 'package:rawsa/views/widgets/rawsa_textfield.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpMePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MotoBillsTextFormField(
                hintText: "Name",
                controller: _nameController,
                validator: (value) =>
                    value!.isEmpty ? "Name is required" : null,
              ),
              const SizedBox(height: 30),
              MotoBillsTextFormField(
                hintText: "Type your concern. We are here to help",
                controller: _messageController,
                keyboardType: TextInputType.emailAddress,
                minLines: 10,
                maxLines: 20,
                validator: (value) =>
                    value!.isEmpty ? "Email is required" : null,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: ElevatedButton(
                  onPressed: () => _submitForm(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    "Send To Us",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final String subject = Uri.encodeComponent(_nameController.text);
      final String body = Uri.encodeComponent(
        "Message: ${_messageController.text}",
      );
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'coor@rawsa-women.org',
        query: 'subject=$subject&body=$body',
      );

      launchUrl(emailUri);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Opening email app...")),
      );

      // Reset the form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
      Navigator.of(context).pop();
    }
  }
}
