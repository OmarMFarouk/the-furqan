import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thefurqan/blocs/quran_bloc/quran_cubit.dart';
import 'package:thefurqan/blocs/quran_bloc/quran_states.dart';
import 'package:thefurqan/components/drawer.dart';
import 'package:thefurqan/screens/reading_screen.dart';
import 'package:thefurqan/screens/search_screen.dart';
import 'package:thefurqan/src/app_root.dart';
import 'package:thefurqan/src/data/app_navigator.dart';

import '../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranCubit, QuranStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = QuranCubit.get(context);
          return cubit.quranModel == null
              ? const Center()
              : Scaffold(
                  key: _scaffoldKey,
                  drawer: const MyDrawer(),
                  backgroundColor: const Color(0xFFDAD0E1),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                'assets/images/drawer.png',
                                scale: 0.8,
                              ),
                              onTap: () =>
                                  _scaffoldKey.currentState?.openDrawer(),
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
                            IconButton(
                              onPressed: () {
                                AppRoot.setLocale(context, const Locale('ar'));
                              },
                              icon: const Icon(Icons.language),
                            ),
                            IconButton(
                              onPressed: () {
                                AppNavigator.push(
                                    context, const SearchScreen());
                              },
                              icon: const Icon(Icons.search),
                            ),
                            IconButton(
                              onPressed: () {
                                AppRoot.setLocale(context, const Locale('en'));
                              },
                              icon: const Icon(Icons.sign_language),
                            ),
                          ],
                        ),
                        Text(
                          S.of(context).Hello,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9D1DF2)),
                        ),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Text('No data');
                              } else {
                                var doc = snapshot.data as DocumentSnapshot;

                                return Text(
                                  doc['name'].toString(),
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff300759)),
                                );
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(children: [
                          Container(
                            alignment: AlignmentDirectional(
                                Localizations.localeOf(context).languageCode ==
                                        "ar"
                                    ? -0.7
                                    : 0.7,
                                0),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.18,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5B6F2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset(
                              'assets/images/quran.png',
                              scale: 0.7,
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 20,
                            child: Row(
                              children: [
                                const Icon(Icons.menu_book_sharp),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  S.of(context).last_read,
                                  style: const TextStyle(
                                      color: Color(0xff300759),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 80,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cubit.lastRead[0],
                                  style: const TextStyle(
                                      color: Color(0xff300759),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'Ayah no.1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ]),
                        Text(
                          '\n${S.of(context).Surahs}',
                          style: const TextStyle(
                              color: Color(0xff300759),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.54,
                          child: ListView.builder(
                            itemCount: cubit.quranModel!.data!.surahs!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                      onTap: () {
                                        setState(() {
                                          cubit.lastRead.insert(
                                              0,
                                              Localizations.localeOf(context)
                                                          .languageCode ==
                                                      "ar"
                                                  ? cubit.quranModel!.data!
                                                      .surahs![index].name
                                                      .toString()
                                                  : cubit
                                                      .quranEnglishModel!
                                                      .data!
                                                      .surahs![index]
                                                      .englishName
                                                      .toString());
                                        });
                                        AppNavigator.push(
                                            context,
                                            ReadingScreen(
                                              tafseerEnglishData: cubit
                                                  .tafseerEnglishModel!
                                                  .surahs![index]
                                                  .data![0],
                                              tafseerData: cubit
                                                  .tafseerModel!.surahs![index],
                                              dataNumber: index + 1,
                                              arabicData: cubit.quranModel!
                                                  .data!.surahs![index],
                                              englishData: cubit
                                                  .quranEnglishModel!
                                                  .data!
                                                  .surahs![index],
                                            ));
                                      },
                                      title: Text(
                                        Localizations.localeOf(context)
                                                    .languageCode ==
                                                "ar"
                                            ? cubit.quranModel!.data!
                                                .surahs![index].name
                                                .toString()
                                            : cubit.quranModel!.data!
                                                .surahs![index].englishName
                                                .toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff300759),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        Localizations.localeOf(context)
                                                    .languageCode ==
                                                "en"
                                            ? "${cubit.quranModel!.data!.surahs![index].revelationType} - ${cubit.quranModel!.data!.surahs![index].ayahs!.length} Verses"
                                            : cubit
                                                        .quranModel!
                                                        .data!
                                                        .surahs![index]
                                                        .revelationType ==
                                                    'Meccan'
                                                ? "مَكيَّة - ${cubit.quranModel!.data!.surahs![index].ayahs!.length} أية"
                                                : "مَدَنيَّة - ${cubit.quranModel!.data!.surahs![index].ayahs!.length} أية",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff300759),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      leading: Container(
                                          height: 40,
                                          alignment: Alignment.center,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/hexa.png'))),
                                          child: Text(
                                            cubit.quranModel!.data!
                                                .surahs![index].number
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          )),
                                      trailing: Text(
                                        Localizations.localeOf(context)
                                                    .languageCode ==
                                                "ar"
                                            ? cubit.quranModel!.data!
                                                .surahs![index].englishName
                                                .toString()
                                            : cubit.quranModel!.data!
                                                .surahs![index].name
                                                .toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffA44AFF),
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const Divider()
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
        });
  }
}
