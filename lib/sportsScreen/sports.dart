import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/shared/components.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context ,state){},
      builder: (context ,state){
        var list=  NewsCubit.get(context).sports;

        if (state is GetSportsDataloadingState){
          return Center(child: CircularProgressIndicator());
        }else{
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>BuildArticleItem(list[index],context),
              separatorBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20
                ),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              itemCount: list.length
          );


      }
      }
    );
  }
}
