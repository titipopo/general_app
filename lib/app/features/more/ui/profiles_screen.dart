
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const ProfileView();
//   }
// }

// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});

//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   bool _readonly = true;
//   late bool _editable;
//   FocusNode nameFocus = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _editable = _readonly;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authCubit = context.read<AuthenticationCubit>();
//     String displayName = authCubit.state.user.name ?? '';
//     String email = authCubit.state.user.email ?? '';
//     String id = authCubit.state.user.id;
//     String avatar = authCubit.state.user.imageUrl ?? '';
//     DateTime? creationTime =
//         authCubit.state.user!.metadata?.creationTime;
//     DateTime? lastSignInTime =
//        authCubit.state.user!.metadata?.lastSignInTime;
//     String strCreationTime = creationTime != null
//         ? DateFormat(AppLocalizations.of(context).dateFormatYMD)
//             .format(creationTime)
//         : '';
//     String strLastSignInTime = lastSignInTime != null
//         ? DateFormat(AppLocalizations.of(context).dateFormatYMD)
//             .format(lastSignInTime)
//         : '';

//     return Scaffold(
//         body: SafeArea(
//             child: Column(children: [
//       AppPageHeader(
//         name: AppLocalizations.of(context).profiles,
//         child: IconButton(
//             onPressed: () {
//               context.go(AppRouters.more);
//             },
//             icon: const Icon(Icons.navigate_before)),
//       ),
//       SingleChildScrollView(
//           child: Column(children: [
//         CircleAvatar(
//           radius: 100, // Image radius
//           backgroundImage: NetworkImage(avatar),
//         ),
//         SectionContainer(children: [
//           VerticalSection(
//             label: AppLocalizations.of(context).profileName,
//             isInput: true,
//             child: TextFormField(
//               readOnly: _readonly,
//               initialValue: displayName,
//               focusNode: nameFocus,
//               decoration: InputDecoration(
//                 suffixIcon: IconButton(
//                   icon: Icon(_editable ? Icons.edit_off : Icons.edit),
//                   onPressed: () {
//                     setState(() {
//                       _readonly = false;
//                     });
//                     FocusScope.of(context).requestFocus(nameFocus);
//                   },
//                 ),
//               ),
//             ),
//           ),
//           VerticalSection(
//             label: AppLocalizations.of(context).profileEmail,
//             isInput: true,
//             child: TextFormField(
//               readOnly: _readonly,
//               initialValue: email,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 suffixIcon: IconButton(
//                   icon: Icon(_editable ? Icons.edit_off : Icons.edit),
//                   onPressed: () {
//                     setState(() {
//                       _readonly = false;
//                     });
//                   },
//                 ),
//               ),
//             ),
//           ),
//           VerticalSection(
//             label: AppLocalizations.of(context).profileId,
//             child: GestureDetector(
//                 onTap: () async {
//                   await Clipboard.setData(ClipboardData(text: id));
//                 },
//                 child: Text(id)),
//           ),
//           VerticalSection(
//             label: AppLocalizations.of(context).profileJoinedOn,
//             child: const Text('strCreationTime'),
//           ),
//           VerticalSection(
//             label: AppLocalizations.of(context).profileLastLogin,
//             child: const Text('strLastSignInTime'),
//           ),
//         ]),
//         AppIconButton(
//           text: AppLocalizations.of(context).profileLogout,
//           color: Colors.black,
//           icon: const FaIcon(FontAwesomeIcons.rightFromBracket, size: 24),
//           onPressed: () => authCubit.signOut(),
//         ),
//       ]))
//     ])));
//   }
// }
