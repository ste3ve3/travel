import 'package:bloc/bloc.dart';
import 'package:travellapp/cubits/app_cubit_states.dart';
import 'package:travellapp/models/data_model.dart';
import 'package:travellapp/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices data;
  late final dynamic places;

  AppCubits({ required this.data }): super(InitialState()) {
    emit(WelcomeState());
  } 

  void getData() async {
    emit(LoadingState());
    places = await data.getPlaces();
    emit(LoadedState(places));
  }

  void getDetails(DataModel place) {
    emit(DetailsState(place));
  }

  void backToHome() {
    emit(LoadedState(places));
  }
}