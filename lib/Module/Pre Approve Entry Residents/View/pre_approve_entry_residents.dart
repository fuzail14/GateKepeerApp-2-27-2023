import 'package:flutter/material.dart';
import 'package:gatekeeper/Routes/set_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Controller/pre_approve_entry_residents_controller.dart';

class PreApproveEntryResidents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreApproveEntryResdientsController>(
        init: PreApproveEntryResdientsController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
                body: FutureBuilder(
                    future: controller.preApproveEntryResidentApi(
                        controller.userdata.userid!,
                        controller.userdata.bearerToken!),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            MyBackButton(
                              text: 'Residents',
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                           Get.toNamed(preApprovedGuests, arguments: [
                                      snapshot.data.data[index],
                                      controller.userdata.bearerToken!
                                    ]);
                                        },
                                        child: SizedBox(
                                          width: 400,
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Container(
                                                width: 400,
                                                // color: Colors.red,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.2,
                                                        height:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                0.1,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(8),
                                                            image: DecorationImage(
                                                                fit: BoxFit.cover,
                                                                image: AssetImage(
                                                                  'assets/k.webp'
                                                                    // imageBaseUrl +
                                                                    //     snapshot
                                                                    //         .data!
                                                                    //         .data[
                                                                    //             index]
                                                                    //         .image
                                                                    //         .toString()
                                                                            
                                                                            ),
                                                                            )),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.26,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.03,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.03,
                                                              0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .firstname
                                                                    .toString() +
                                                                ' ' +
                                                                snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .lastname
                                                                    .toString(),
                                                            maxLines: 1,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#404345'),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                letterSpacing:
                                                                    0.0015,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.26,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.12,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'CNIC: ',
                                                            maxLines: 2,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#AAAAAA'),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                letterSpacing:
                                                                    0.0015,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),

                                                          Text(
                                                           snapshot.data.data[index].cnic,
                                                            maxLines: 2,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#AAAAAA'),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                letterSpacing:
                                                                    0.0015,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.26,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.17,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0,
                                                              0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Contact No: ",
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#AAAAAA'),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                letterSpacing:
                                                                    0.0015,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Text(
                                                        snapshot.data.data[index].mobileno,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#AAAAAA'),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                letterSpacing:
                                                                    0.0015,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data.data.length),
                            ),
                          ],
                        );
                     
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error_outline);
                      } else {
                        return CircularProgressIndicator();
                      }
                    })),
          );
        });
  }
}
