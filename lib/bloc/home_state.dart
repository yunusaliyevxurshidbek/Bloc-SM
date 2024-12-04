

import 'package:bloC/models/random_user_list_res.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {

}

class HomeInitialState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState{

  final String errorMessage;
  HomeErrorState(this.errorMessage);
  @override
  List<Object?> get props => [];
}

class HomeRandomUserListState extends HomeState{

  final List<RandomUser> userList;
  HomeRandomUserListState(this.userList);
  @override
  List<Object?> get props => [];
}