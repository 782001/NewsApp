import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../shared/components.dart';

class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context ,state){},
        builder: (context ,state) {
          var list = NewsCubit.get(context).search;
          var searchController=TextEditingController();

          return
            Scaffold(
              appBar: AppBar(),
                body: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            keyboardType:TextInputType.text ,
                            controller: searchController,
                            onChanged: ( value) {
                               NewsCubit.get(context).GetSearchData(value);
                              print("$value");
                            },

                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                labelText: 'search from her',
                                prefixIcon: Icon(Icons.search),
                                iconColor: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              BuildArticleItem(list[index], context),
                          separatorBuilder: (context, index) =>
                              Padding(
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
                      ),
                    ),
                  ],
                ),
            );


        });
    }
  }

