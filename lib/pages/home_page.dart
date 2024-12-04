import 'package:bloC/bloc/home_bloc.dart';
import 'package:bloC/bloc/home_event.dart';
import 'package:bloC/bloc/home_state.dart';
import 'package:bloC/services/log_service.dart';
import 'package:bloC/views/item_of_random_user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/random_user_list_res.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late HomeBloc homeBloc;
  ScrollController scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(LoadRandomUserListEvent());

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <= scrollController.offset) {
        LogService.i(homeBloc.currentPage.toString());
        homeBloc.add(LoadRandomUserListEvent());


      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(232, 232, 232, 1),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Random User - Bloc"),
        ),
        body:BlocBuilder<HomeBloc,HomeState>(
    builder: (context,state){
      if (state is HomeErrorState){
        return viewOfError(state.errorMessage);
      }

      if (state is HomeRandomUserListState){
        var userList = state.userList;
        return viewOfRandomUserList(userList.cast<RandomUser>());
      }

      return viewOfLoading;

    }
        ),
    );
  }

  Widget viewOfLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget viewOfError(String err){
    return Center(
      child: Text(err),
    );
  }

  Widget viewOfRandomUserList(List<RandomUser> userList){
    return ListView.builder(
      controller: scrollController,
      itemCount: userList.length,
      itemBuilder: (ctx,index){
        return itemOfRandomUser(userList[index],index);
      }
    );
  }

}