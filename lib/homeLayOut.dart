import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';
import 'package:news/searchScreen/search.dart';

import 'cubit/cubit.dart';

class NewsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit=NewsCubit.get(context);

          return Scaffold(

          appBar: AppBar(
          title: Text('NewsApp'),
              actions: [
             IconButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(
                    builder: (context)=>searchScreen())
                );
              },
                icon: Icon(Icons.search
           )
             ),
             IconButton(
              onPressed: (){
                NewsCubit.get(context).changeAppMode();
              },
                icon: Icon(Icons.brightness_4
           )
             ),
           ],
             ),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeNavBar(index);
            },
              items: cubit.BottomItems,
         ),
      );

           },
      // ),
    );
  }
}
