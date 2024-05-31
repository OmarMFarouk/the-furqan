import 'package:flutter/material.dart';
import 'package:thefurqan/blocs/auth_bloc/auth_cubit.dart';
import 'package:thefurqan/generated/l10n.dart';
import '../screens/drawer/settings_screen.dart';
import '../src/data/app_navigator.dart';
import 'auth_button.dart';
import 'drawer_button.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xFFDAD0E1),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.07,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icon_quran.png',
                        scale: 1,
                        color: const Color(0xff300759),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        S.of(context).appTitle,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff300759)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ],
              ),
              Expanded(
                child: ListView(children: [
                  DrawerButtons(text: S.of(context).account, onTap: () {}),
                  DrawerButtons(
                      text: S.of(context).settings,
                      onTap: () {
                        AppNavigator.push(context, const SettingsScreen());
                      }),
                  DrawerButtons(text: S.of(context).privary, onTap: () {}),
                  DrawerButtons(text: S.of(context).help, onTap: () {}),
                  DrawerButtons(text: S.of(context).about, onTap: () {}),
                ]),
              ),
              MyAuthButton(
                  text: 'Logout',
                  onTap: () {
                    AuthCubit().logoutUser(context);
                  }),
            ],
          ),
        ));
  }
}
