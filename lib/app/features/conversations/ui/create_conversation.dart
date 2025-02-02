import 'package:general_app/app/shared/ui/app_page_header.dart';
import 'package:flutter/material.dart';

class CreateConversationScreen extends StatefulWidget {
  const CreateConversationScreen({
    super.key,
  });

  @override
  State<CreateConversationScreen> createState() => _CreateConversationScreenState();
}

class _CreateConversationScreenState extends State<CreateConversationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const AppPageHeader(name: "TEST");
  }
}
