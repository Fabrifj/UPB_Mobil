import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../../components/iconPanel/icon_view.dart';
import '../../components/iconPanel/logos_model.dart';
import '../../components/upb_scafold.dart';


class AboutUsPage extends StatelessWidget {
  late Future<String> future;
  final String title;

  String listPaths = "assets/routes/route_logos_list.json";
  late  Map<String, List<String>> routList ;


  AboutUsPage(this.title) {}

  Future<String> readJsonFile(String listPaths) async {
    return await rootBundle.loadString(listPaths);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final accreditationsView = FutureBuilder(
        future: readJsonFile(listPaths),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done)
          {
            Map<String, dynamic> routeLists = jsonDecode(snapshot.data!);
            List<dynamic> titleAgreements = routeLists['titleAgreements'] as List<dynamic>;
            List<LogoModel> agreementsList = titleAgreements.map((agreement) => LogoModel(
              title: agreement['title'] as String,
              logo: agreement['logo'] as String,
              link: agreement['link'] as String,
            )).toList();
            List<dynamic> exchangeAgreements = routeLists['exchangeAgreements'] as List<dynamic>;
            List<LogoModel> exchangeList = exchangeAgreements.map((agreement) => LogoModel(
              title: agreement['title'] as String,
              logo: agreement['logo'] as String,
              link: agreement['link'] as String,
            )).toList();
            List<dynamic> memberships = routeLists['memberships'] as List<dynamic>;
            List<LogoModel> membershipsList = memberships.map((agreement) => LogoModel(
              title: agreement['title'] as String,
              logo: agreement['logo'] as String,
              link: agreement['link'] as String,
            )).toList();
            return Column(
              children: [
                IconView(
                  titleView: "titleAgreements",
                  routList: agreementsList,
                ),
                IconView(
                  titleView: "exchangeAgreements",
                  routList: exchangeList,
                ),
                IconView(
                  titleView: "Membresías",
                  routList: membershipsList,
                ),
              ],
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
       }});
    return UpbScaffold(
      title: title,
      body: Container(
        child: Center(
          child: SingleChildScrollView(child: accreditationsView),
        ),
      ),
    );
  }
}