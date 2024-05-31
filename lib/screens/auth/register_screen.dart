import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/auth_bloc/auth_cubit.dart';
import '../../blocs/auth_bloc/auth_states.dart';
import '../../components/auth_button.dart';
import '../../components/text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.authToggle});
  final Function authToggle;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
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
                      const Text(
                        "Quran App",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF300759),
                        ),
                      ),
                      const Text(
                        "Alsalamu Alaykum",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff9d1df2),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Sign up",
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
                          controller: authCubit.name,
                          hasIcon: false,
                          hint: 'name',
                          isPassword: false),
                      const SizedBox(
                        height: 40,
                      ),
                      MyTextField(
                          controller: authCubit.email,
                          hasIcon: false,
                          hint: 'e-mail',
                          isPassword: false),
                      const SizedBox(
                        height: 40,
                      ),
                      MyTextField(
                          controller: authCubit.password,
                          hasIcon: true,
                          hint: 'password',
                          isPassword: true),
                      MyAuthButton(
                          text: 'Sign up',
                          onTap: () async {
                            await authCubit.registerUser(context);
                            authCubit.email.clear();
                            authCubit.password.clear();
                            authCubit.name.clear();
                          }),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          const Text("Already have an account ?",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF300759),
                              )),
                          TextButton(
                              onPressed: () {
                                authToggle();
                              },
                              child: const Text("Login here",
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
