import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thefurqan/screens/home_screen.dart';
import 'package:thefurqan/src/data/app_navigator.dart';
import '../../blocs/auth_bloc/auth_cubit.dart';
import '../../blocs/auth_bloc/auth_states.dart';
import '../../components/auth_button.dart';
import '../../components/text_field.dart';
import '../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.authToggle});
  final Function authToggle;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          AppNavigator.pushR(context, HomeScreen());
        }
      },
      builder: (context, state) {
        var authCubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xFFDAD0E1),
          body: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      "assets/images/mosque.png",
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Text(
                        S.of(context).appTitle,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF300759),
                        ),
                      ),
                      Text(
                        S.of(context).Hello,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9d1df2),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment:
                            Localizations.localeOf(context).languageCode == "ar"
                                ? Alignment.topRight
                                : Alignment.topLeft,
                        child: Text(
                          S.of(context).header1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff9d1df2),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                          controller: authCubit.email,
                          hasIcon: false,
                          hint: S.of(context).email,
                          isPassword: false),
                      const SizedBox(
                        height: 40,
                      ),
                      MyTextField(
                          controller: authCubit.password,
                          hasIcon: true,
                          hint: S.of(context).password,
                          isPassword: true),
                      MyAuthButton(
                          text: S.of(context).header1,
                          onTap: () async {
                            await authCubit.loginUser(context);
                            authCubit.email.clear();
                            authCubit.password.clear();
                          }),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Text(S.of(context).login_question,
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF300759),
                              )),
                          TextButton(
                              onPressed: () {
                                authToggle();
                              },
                              child: Text(S.of(context).login_answer,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff0E18F6),
                                  ))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
