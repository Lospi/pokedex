import 'package:bloc/bloc.dart';

class SearchCubit extends Cubit<String> {
  SearchCubit() : super("");

  void setSearchText(String text) => emit(text);
}
