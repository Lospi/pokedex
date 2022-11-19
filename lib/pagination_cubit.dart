import 'package:bloc/bloc.dart';

class PaginationCubit extends Cubit<int> {
  PaginationCubit() : super(18);

  void increasePagination() => emit(state + 18);

  void resetPagination() => emit(18);
}
