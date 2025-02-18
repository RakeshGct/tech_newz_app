import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_newz/components/bottomsheet.dart';
import 'package:tech_newz/utils/colors.dart';
import 'package:tech_newz/utils/text.dart';

class NewsBox extends StatelessWidget {
  final String imageurl, title, time, description, url;

  const NewsBox({super.key,
    required this.imageurl,
    required this.title,
    required this.time,
    required this.description,
    required this.url});


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColor.black,
            child: Row(
              children: [
                //it is used to saved the images into the cached memory once it is loaded
                CachedNetworkImage(imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow
                    ),
                  ),
                  placeholder: (context, url) =>
                  CircularProgressIndicator(color: AppColor.primary,),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(width: 8,),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    modifiedText(
                        text: title,
                        size: 16,
                        color: AppColor.white),
                    SizedBox(height: 5,),
                    modifiedText(
                        text: time,
                        size: 12,
                        color: AppColor.lightWhite)
                  ],
                ))
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}