
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MoreView();
  }
}

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    // final authCubit = context.read<AuthenticationCubit>();
    // String displayName = authCubit.state.user.name ?? '';
    // String email = authCubit.state.user.email ?? '';
    // String avatar = authCubit.state.user.imageUrl ?? '';
    String displayName = '';
    String email = '';
    String avatar = 'https://picsum.photos/200';
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          AppSectionContainer(children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                AppCircleAvatar(
                  url: avatar,
                  // isBorder: true,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: displayName,
                      fontWeight: FontWeight.bold,
                      size: AppSizes.s28,
                    ),
                    AppText(text: email),
                  ],
                ),
              ]),
            ),
          ]),
          AppSectionContainer(children: [
            ListTile(
              onTap: () => {
                context
                    .go('${AppRouterStrings.more}/${AppRouterStrings.profile}')
              },
              trailing: const AppIcon(iconData: Icons.navigate_next),
              leading: const AppIcon(iconData: Icons.person),
              title: AppText(
                text: AppLocalizations.of(context).profile,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () => context
              // .go(AppRouterStrings.settings),
                 .go('${AppRouterStrings.more}${AppRouterStrings.settings}'),
              trailing: const AppIcon(iconData: Icons.navigate_next),
              leading: const AppIcon(iconData: Icons.settings),
              title: AppText(
                  text: AppLocalizations.of(context).settings,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          AppIconButton(
            text: AppLocalizations.of(context).logout,
            icon: const AppIcon(
                iconData: FontAwesomeIcons.rightFromBracket, size: 24),
            // onPressed: () => authCubit.signOut(),
            onPressed: () => {},
          ),
        ]));
  }
}
