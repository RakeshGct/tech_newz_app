import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_newz/backend/function.dart';
import 'package:tech_newz/components/newsbox.dart';
import 'package:tech_newz/utils/colors.dart';
import 'package:tech_newz/utils/constants.dart';

class Home extends StatefulWidget {
  static TextEditingController searchController = TextEditingController(text: "");
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchnews();
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        title: Text("Tech News", style: TextStyle(color: Colors.deepPurple),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 25),
              height: 45,
              decoration: BoxDecoration(
                color: AppColor.darkgrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child:
                TextField(
                  controller: Home.searchController,
                  decoration: InputDecoration(
                    hintText: "Search a Keyword or a Phrase",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              fetchnews();
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: AppColor.darkgrey,
                  shape: BoxShape.circle
              ),
              child: Icon(Icons.search, color: AppColor.white,),
            ),
          ),
          SizedBox(width: 10,),
        ],
      ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder(
                  future: news,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                          return NewsBox(
                              url: snapshot.data![index]['url'],
                              imageurl: snapshot.data![index]['urlToImage'] != null
                                          ? snapshot.data![index]['urlToImage']
                                          : Constants.imageurl,
                              title: snapshot.data![index]['title'],
                              time: snapshot.data![index]['publishedAt'],
                              description: snapshot.data![index]['description'].toString(),
                              );
                          });
                    } else if(snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } return Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}