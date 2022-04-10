
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modueles/webView.dart';

Widget BuildArticleItem(articles,context)=>InkWell(
  onTap: (){
NavTo(context, WebviewScreen(articles['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child:   Row(

      children: [

        Container(

          height: 120,

          width: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),

            image: DecorationImage(

              image: NetworkImage('${articles['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        //

        // https://i.pinimg.com/736x/a1/ad/ac/a1adacda5202af8068689d890bbb9da8.jpg

        SizedBox(

          width: 20,

        ),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              mainAxisSize: MainAxisSize.min,

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${articles['title']}',

                    style: Theme.of(context).textTheme.bodyText1,



                    overflow: TextOverflow.ellipsis,

                    maxLines: 4,

                  ),

                ),

                Text('${articles['publishedAt']}',

                  style: TextStyle(

                      fontSize: 18,

                      color: Colors.grey

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
void NavTo(context,Widget)=>  Navigator.push(context,MaterialPageRoute(
builder: (context)=>Widget));