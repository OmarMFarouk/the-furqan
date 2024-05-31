import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thefurqan/models/tafseer_english_model.dart';
import 'package:thefurqan/models/tafseer_model.dart';

import '../../models/quran_english_model.dart';
import '../../models/quran_model.dart';
import '../../services/quran_api.dart';
import 'quran_states.dart';

class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranInitialState());
  static QuranCubit get(context) => BlocProvider.of(context);
  bool? onboardingFinished = false;
  QuranModel? quranModel;
  QuranEnglishModel? quranEnglishModel;
  TafseerModel? tafseerModel;
  TafseerEnglishModel? tafseerEnglishModel;
  fetchQuran() {
    emit(QuranLoadingState());
    QuranApi().fetchQuran().then((value) {
      emit(QuranSuccessState());
      return quranModel = QuranModel.fromJson(value);
    }).catchError((err) {
      print(err);
      emit(QuranErrorState());
    });
  }

  fetchEnglishQuran() {
    emit(QuranLoadingState());
    QuranApi().fetchEnglishQuran().then((value) {
      emit(QuranSuccessState());
      return quranEnglishModel = QuranEnglishModel.fromJson(value);
    }).catchError((err) {
      print(err);
      emit(QuranErrorState());
    });
  }

  fetchTafseer() {
    emit(QuranLoadingState());
    QuranApi().fetchTafseer().then((value) {
      emit(QuranSuccessState());
      return tafseerModel = TafseerModel.fromJson(value);
    }).catchError((err) {
      print(err);
      emit(QuranErrorState());
    });
  }

  fetchEnglishTafseer() {
    emit(QuranLoadingState());
    QuranApi().fetchEnglishTafseer().then((value) {
      emit(QuranSuccessState());
      return tafseerEnglishModel = TafseerEnglishModel.fromJson(value);
    }).catchError((err) {
      print(err);
      emit(QuranErrorState());
    });
  }

  List<String> lastRead = [''];
}
