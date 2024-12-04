

import 'package:bloC/bloc/home_event.dart';
import 'package:bloC/bloc/home_state.dart';
import 'package:bloC/models/random_user_list_res.dart';
import 'package:bloC/services/http_service.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  List<RandomUser> userList = [];
  int currentPage = 0;

  HomeBloc(): super(HomeInitialState()){
    on<LoadRandomUserListEvent>(_onLoadRandomUserListEvent);
  }

  Future<void> _onLoadRandomUserListEvent (LoadRandomUserListEvent event,Emitter<HomeState> emit) async{

    emit(HomeLoadingState());
    var response = await Network.GET(Network.API_RANDOM_USER_LIST, Network.paramsRandomUserList(currentPage));

    if (response != null){

      var results = Network.parseRandomUserList(response).results;
      userList.addAll(results);
      currentPage++;
      emit(HomeRandomUserListState(userList));
    }else{
      emit(HomeErrorState("Could not fetch random users"));
    }
  }

}