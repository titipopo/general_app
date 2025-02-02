import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:general_app/app/features/auth/cubit/register_cubit.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/core/index.dart';
import 'package:general_app/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<RegisterCubit>(
        create: (context) => RegisterCubit(),
        child: const RegisterView(),
      ),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    return BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status.isError) {
            context.pop();
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text('error'),
                  );
                });
          } else if (state.status.isSuccess) {
            context.go(AppRouters.home);
          } else {
            AppDialog.showAppDialog(
              context,
              const SizedBox(
                height: 100,
                width: 70,
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            );
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Center(
                child: SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'App',
                        style: GoogleFonts.aDLaMDisplay(
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      const FaIcon(FontAwesomeIcons.ghost, size: 40),
                      // Image.asset(
                      //   'assets/images/vibrant_bubble.png',
                      //   width: 60,
                      //   height: 60,
                      // ),
                    ],
                  ),
                  const Text(
                    'A Convenience Application.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).email,
                      hintText: AppLocalizations.of(context).emailHint,
                      prefixIcon: const Icon(Icons.email_rounded),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).emailError;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).password,
                      hintText: AppLocalizations.of(context).passwordHint,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).passwordError;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  AppIconButton(
                    text: AppLocalizations.of(context).login,
                    icon:
                        const FaIcon(FontAwesomeIcons.rightToBracket, size: 24),
                    onPressed: () => registerCubit.registerWithEmail(
                        _emailController.text.trim(),
                        _passwordController.text.trim()),
                  ),
                ],
              ),
            ))));
  }
}
