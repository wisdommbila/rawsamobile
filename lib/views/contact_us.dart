import 'package:flutter/material.dart';
import 'package:rawsa/views/widgets/rawsa_textfield.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              MotoBillsTextFormField(
                hintText: "Name",
                controller: _nameController,
                validator: (value) =>
                    value!.isEmpty ? "Name is required" : null,
              ),
              const SizedBox(height: 30),
              MotoBillsTextFormField(
                hintText: "Email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? "Email is required" : null,
              ),
              const SizedBox(height: 30),
              MotoBillsTextFormField(
                hintText: "Type your message",
                controller: _messageController,
                keyboardType: TextInputType.emailAddress,
                minLines: 5,
                maxLines: 5,
                validator: (value) =>
                    value!.isEmpty ? "Email is required" : null,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: ElevatedButton(
                  onPressed: () => _submitForm(context),
                  child: const Text("Send"),
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
        "Name: ${_nameController.text}\n"
        "Email: ${_emailController.text}\n"
        "Message: ${_messageController.text}",
      );
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'cotor@rawsa-women.org',
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
    }
  }
}
