import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../Controller/vistor_detail_controller.dart';

class VistorDetailScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VistorDetailController>(
        init: VistorDetailController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.userdata);
              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  floatingActionButton: IconButton(
                      padding: EdgeInsets.only(top: 85),
                      iconSize: MediaQuery.of(context).size.height * 0.065,
                      icon: SvgPicture.asset('assets/floatingbutton.svg'),
                      onPressed: () {
                        Get.offNamed(addVistorDetailScreen,
                            arguments: controller.userdata);
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Vistors',
                        onTap: () {
                          Get.offNamed(homescreen,
                              arguments: controller.userdata);
                        },
                      ),
                      Expanded(
                        child: FutureBuilder(
                            future: controller.viewVistorsDetailApi(
                                controller.userdata.societyid!,
                                controller.userdata.bearerToken!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.data != null &&
                                    snapshot.data.data!.length != 0) {
                                  return ListView.builder(
                                      itemBuilder: (context, index) {
                                        if (snapshot.data.data[index].status ==
                                            0) {
                                              

                                          return GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                            title: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Center(
                                                                    child: Text(
                                                                  snapshot
                                                                      .data
                                                                      .data[
                                                                          index]
                                                                      .name,
                                                                  style: GoogleFonts.ubuntu(
                                                                      color: HexColor(
                                                                          '#4D4D4D'),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                )),
                                                                SizedBox(
                                                                  height: 37,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    CircleAvatar(
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Description',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              30),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .houseaddress,
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: HexColor(
                                                                            '#4D4D4D'),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    CircleAvatar(
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Date',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 70,
                                                                    ),
                                                                    CircleAvatar(
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Vehicle No',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 11,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              30),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        snapshot
                                                                            .data
                                                                            .data[index]
                                                                            .arrivaldate,
                                                                        style: GoogleFonts.ubuntu(
                                                                            color: HexColor(
                                                                                '#4D4D4D'),
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            70,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          snapshot
                                                                              .data
                                                                              .data[index]
                                                                              .vechileno
                                                                              .toString(),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: GoogleFonts.ubuntu(
                                                                              color: HexColor('#4D4D4D'),
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    CircleAvatar(
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Check-In Time',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 11,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              30),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .arrivaltime,
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: HexColor(
                                                                            '#4D4D4D'),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    CircleAvatar(
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Visitor Type',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 11,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              30),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .visitortype,
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: HexColor(
                                                                            '#4D4D4D'),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 34,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Get.back();
                                                                  },
                                                                  child: Center(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          31,
                                                                      width: 96,
                                                                      decoration: BoxDecoration(
                                                                          color: primaryColor,
                                                                          borderRadius: const BorderRadius.all(
                                                                            Radius.circular(7.0),
                                                                          ),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey.withOpacity(0.8),
                                                                              spreadRadius: 4,
                                                                              blurRadius: 10,
                                                                              offset: Offset(0, 3),
                                                                            )
                                                                          ]),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          'OK',
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                "Netflix",
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                18,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 13, 22, 0),
                                              child: SizedBox(
                                                width: 343,
                                                height: 90,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Container(
                                                            width: 105,
                                                            height: 27,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: HexColor(
                                                                      '#E8E8E8')),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                4,
                                                              ),
                                                              color: HexColor(
                                                                  '#F6F6F6'),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 14),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .calendar_month,
                                                                    size: 15,
                                                                    color: HexColor(
                                                                        '#A7A7A7'),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .arrivaldate
                                                                        .toString(),
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: HexColor(
                                                                            '#A5AAB7'),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  )
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                13, 13, 0, 0),
                                                        child: Text(
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .name
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                              color: HexColor(
                                                                  '#606470'),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                            )),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  13, 34, 0, 0),
                                                          child: Text.rich(
                                                              TextSpan(
                                                                  children: [
                                                                TextSpan(
                                                                  text:
                                                                      'Vehicle No :',
                                                                  style:
                                                                      GoogleFonts
                                                                          .ubuntu(
                                                                    color: HexColor(
                                                                        '#A5AAB7'),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: snapshot
                                                                      .data
                                                                      .data[
                                                                          index]
                                                                      .vechileno,
                                                                  style:
                                                                      GoogleFonts
                                                                          .ubuntu(
                                                                    color: HexColor(
                                                                        '#606470'),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                  ),
                                                                ),
                                                              ]))),
                                                      (snapshot.data.data[index]
                                                                  .status ==
                                                              0)
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      0,
                                                                      44,
                                                                      14,
                                                                      0),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child:
                                                                    MyStatusWidget(
                                                                        onTap:
                                                                            () {
                                                                          controller.currentDate = controller.currentDateTime.year.toString() +
                                                                              "-" +
                                                                              controller.currentDateTime.month.toString() +
                                                                              "-" +
                                                                              controller.currentDateTime.day.toString();

                                                                          controller.currentTime = controller.currentDateTime.hour.toString() +
                                                                              ":" +
                                                                              controller.currentDateTime.minute.toString() +
                                                                              ":" +
                                                                              controller.currentDateTime.second.toString();

                                                                          controller.UpdateVistorDetailApi(
                                                                              token: controller.userdata.bearerToken!,
                                                                              vid: snapshot.data.data[index].id,
                                                                              checkoutdate: controller.currentDate!,
                                                                              checkouttime: controller.currentTime!);
                                                                        },
                                                                        status:
                                                                            'Check-Out',
                                                                        color: HexColor(
                                                                            '#E85C5C')),
                                                              ),
                                                            )
                                                          : Container(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                13, 60, 0, 0),
                                                        child: Text(
                                                          snapshot
                                                              .data
                                                              .data[index]
                                                              .houseaddress,
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#A5AAB7'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          
                                              
                                         return Center(
                                            child: Text('No Vistor'),
                                          );
                                        }
                                      },
                                      itemCount: snapshot.data.data.length);
                                } else {
                                  return Text('No Vistor');
                                }
                              } else if (snapshot.hasError) {
                                return Icon(Icons.error_outline);
                              } else {
                                return Center(
                                    child: CircularProgressIndicator(
                                  color: primaryColor,
                                ));
                              }
                            }),
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  Widget MyStatusWidget(
      {required status,
      required color,
      Color? textcolor,
      double? width,
      double? height,
      void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 64,
        height: height ?? 18,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Text(
            status,
            style: TextStyle(
              fontSize: 10,
              color: textcolor ?? HexColor('#FFFFFF'),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
