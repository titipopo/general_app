import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:general_app/app/features/auth/cubit/sign_in_cubit.dart';
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
      body: BlocProvider<SignInCubit>(
        create: (context) => SignInCubit(),
        child: const LoginView(),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();

    return BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state.status.isError) {
            context.pop(); // remove load dialog
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
                    onPressed: () => signInCubit.signInWithEmail(
                        _emailController.text.trim(),
                        _passwordController.text.trim()),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Colors.black,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppLocalizations.of(context).forgotPassword,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      context.go(AppRouters.register);
                    },
                    child: Text(
                      AppLocalizations.of(context).newHere,
                    ),
                  ),
                  const Text(
                    'Continue with',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppIconButton(
                    text: 'Google',
                    icon: const FaIcon(FontAwesomeIcons.google, size: 24),
                    onPressed: signInCubit.signInWithGoogle,
                  ),
                  const SizedBox(height: 10),
                  AppIconButton(
                    text: 'GitHub',
                    icon: const FaIcon(FontAwesomeIcons.github, size: 24),
                    onPressed: signInCubit.signInWithGithub,
                  ),
                ],
              ),
            ))));
  }
}
