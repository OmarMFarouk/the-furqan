// ignore_for_file: use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:thefurqan/components/custom_alert.dart';
import 'package:thefurqan/src/data/app_navigator.dart';

import '../components/ayah_tile.dart';
import '../components/drawer.dart';
import '../components/share_button.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen(
      {super.key,
      required this.arabicData,
      required this.englishData,
      required this.dataNumber,
      required this.tafseerData,
      required this.tafseerEnglishData
      // this.tafseerData,
      });
  final dynamic tafseerEnglishData;
  final dynamic dataNumber;
  final dynamic tafseerData;
  final dynamic arabicData;
  final dynamic englishData;
  // final tafseerData;
  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final player = AudioPlayer();
  bool isPlaying = false;

  Future<void> playAudioFromUrl(String url) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      if (isPlaying == false) {
        setState(() {
          isPlaying = true;
        });

        await player.play(
          UrlSource(url),
        );
        player.onPlayerComplete.listen((event) {
          setState(() {
            isPlaying = false;
          });
        });
      } else if (isPlaying == true) {
        {
          setState(() {
            isPlaying = false;
          });

          await player.pause();
        }
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Connect to internet")));
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  int selectedId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        backgroundColor: const Color(0xFFDAD0E1),
        key: _scaffoldKey,
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
                          'assets/images/back.png',
                          scale: 0.95,
                        ),
                        onTap: () => AppNavigator.pop(context),
                      ),
                      Text(
                        Localizations.localeOf(context).languageCode == "ar"
                            ? widget.arabicData.name
                            : widget.arabicData.englishName,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff300759)),
                      ),
                      IconButton(
                        icon: Icon(
                          selectedId == -10 && isPlaying
                              ? Icons.pause
                              : Icons.play_circle_outline_rounded,
                          color: const Color(0xffA44AFF),
                          size: 40,
                        ),
                        onPressed: () {
                          playAudioFromUrl(
                              "https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/${widget.dataNumber.toString().padLeft(3, '0')}.mp3");
                          selectedId = -10;
                        },
                        tooltip: "Play",
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: widget.arabicData.ayahs.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(223, 18, 25, 49),
                                    borderRadius: BorderRadius.circular(15)),
                                width: double.infinity,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            const Color(0xffA44AFF),
                                        radius: 15,
                                        child: Text(
                                          widget.arabicData.ayahs[index]
                                              .numberInSurah
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return CustomDialog(
                                                    ifText:
                                                        'Look at the tafseer of this holy verse\n﴾${widget.englishData.ayahs[index].text}﴿\n${widget.tafseerEnglishData.ayahs![index].text}',
                                                    elseText:
                                                        'انظر لهذة الأية الكريمة\n﴾${widget.arabicData.ayahs[index].text}﴿',
                                                    ifContentText:
                                                        '${widget.tafseerEnglishData.ayahs![index].text}',
                                                    elseContentText:
                                                        "${widget.tafseerData.data[index].fields!.text}",
                                                  );
                                                },
                                              );
                                            },
                                            child: const Icon(
                                              Icons.live_help_outlined,
                                              color: Color(0xffA44AFF),
                                              size: 30,
                                            ),
                                          ),
                                          ShareButton(
                                              index: index,
                                              ifText:
                                                  'Look at this holy verse\n﴾${widget.englishData.ayahs[index].text}﴿',
                                              elseText:
                                                  'تفقد هذة الأية الكريمة\n﴾${widget.arabicData.ayahs[index].text}﴿'),
                                          VersePlayButton(
                                              selectedId: selectedId,
                                              onTap: () {
                                                playAudioFromUrl(widget
                                                    .arabicData
                                                    .ayahs[index]
                                                    .audio);
                                                selectedId = index;
                                              },
                                              isPlaying: isPlaying,
                                              id: index),
                                          const Icon(
                                            Icons.bookmark_border,
                                            color: Color(0xffA44AFF),
                                            size: 30,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              AyahTile(
                                index: index,
                                widget: widget,
                              ),
                              const Divider()
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ])));
  }
}

class VersePlayButton extends StatelessWidget {
  const VersePlayButton({
    super.key,
    required this.onTap,
    required this.isPlaying,
    required this.id,
    required this.selectedId,
  });
  final VoidCallback onTap;
  final bool isPlaying;
  final int id;
  final int selectedId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        id == selectedId && isPlaying
            ? Icons.pause
            : Icons.play_circle_outline_rounded,
        color: const Color(0xffA44AFF),
        size: 30,
      ),
    );
  }
}
