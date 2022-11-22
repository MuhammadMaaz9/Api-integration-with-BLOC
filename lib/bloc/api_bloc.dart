import 'dart:convert';
import 'package:bloc/bloc.dart';

import 'package:apibloc/models/models.dart';
import 'package:apibloc/sevices/services.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final apiclass = ApiService();

  ApiBloc() : super(ApiInitial()) {
    on<GetApi>((event, emit) async {
      emit(ApiLoading());
      final response = await apiclass.getdata();
      // if (response == null) {
      //   emit(ApiError('Error'));
      // } else {
      //   print('Response from Bloc : ${response}');
      emit(ApiLoaded(response));
      if (response != null) {
        emit(ApiError(response));
      }
    });
  }
}
