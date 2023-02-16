import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganisationModel {
  String? organisationName;
  String? organisationDesciprtion;

  OrganisationModel(this.organisationName, this.organisationDesciprtion);
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<OrganisationModel> main_organisation_list = [
    OrganisationModel('ASME',
        'It promotes the art, science and practice of multidisciplinary engineering and allied sciences around the globe.'),
    OrganisationModel('Silicon Institute of Technology',
        'A NAAC Grade A grade engineering institution located in Bhubaneswar'),
    OrganisationModel('SWITCH Club',
        'The official coding club of SiliconTech, Silicon Wing of Technical and Coding Hub (SWITCH), develops a love for coding and advanced coding skills among students, and keeps them informed of the latest trends.'),
    OrganisationModel('NSS',
        'The sole aim of the NSS is to provide hands on experience to young students in delivering community service.'),
    OrganisationModel('GDSC Leads',
        'The club is passionate about helping their peers learn technology and connect')
  ];

  List<OrganisationModel> display_list = List.from(main_organisation_list);

  void updateList(String value) {
    setState(() {
      display_list = main_organisation_list
          .where((element) => element.organisationName!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Gcolors.neutralColor1000,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Gcolors.primaryColor100,
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 48,
                    width: 244,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white)),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.search,
                          size: 20,
                          color: Gcolors.neutralColor400,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Container(
                            height: 100,
                            width: 170,
                            child: TextField(
                              controller: _controller,
                              onChanged: (value) => updateList(value),
                              style: TextStyle(
                                  fontSize: 14, color: Gcolors.neutralColor400),
                              decoration: InputDecoration(
                                hintText: 'Search for Clubs...',
                                hintStyle:
                                    TextStyle(color: Gcolors.neutralColor400),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                      onPressed: () {
                        onChanged:
                        (value) => updateList(value);
                        setState(() {
                          display_list = main_organisation_list.toList();
                        });
                        _controller.clear();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Gcolors.primaryColor100,
                      ))
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Gcolors.neutralColor900,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Want to join '${display_list[index].organisationName}' ?",
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            color: Gcolors.primaryColor050)),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                color: Gcolors.primaryColor050,
                                                width: 1),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "No",
                                            style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Gcolors
                                                        .primaryColor050)),
                                          )),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      OutlinedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Gcolors.primaryColor400),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "Yes",
                                            style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Gcolors
                                                        .neutralColor900)),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              titleTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                              actionsOverflowButtonSpacing: 20,
                              actions: [],
                            );
                          });
                    },
                    title: Text(
                      display_list[index].organisationName!,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          textStyle: TextStyle(color: Gcolors.primaryColor400)),
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${display_list[index].organisationDesciprtion}',
                          style: GoogleFonts.inter(
                              textStyle:
                                  TextStyle(color: Gcolors.primaryColor050)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Divider(
                          thickness: 1,
                          color: Gcolors.neutralColor400,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
