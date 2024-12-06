import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_newz/backend/function.dart';
import 'package:tech_newz/utils/colors.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});
  static TextEditingController searchController = TextEditingController(text: "");

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                controller: Searchbar.searchController,
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
    );
  }
}
