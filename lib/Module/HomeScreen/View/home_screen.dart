import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gatekeeper/Constants/constants.dart';
import 'package:gatekeeper/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../Login/Model/User.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          //  drawer: Drawer(
          //   child: ListView(
          //     padding: EdgeInsets.zero,
          //     children: [
          //       const DrawerHeader(
          //         child: Text('Society User'),
          //       ),
          //       ListTile(
          //         leading: Icon(
          //           Icons.event,
          //         ),
          //         title: const Text('Society Events'),
          //         onTap: () {
          //           Get.toNamed(societyEvents);
          //         },
          //       ),
          //       ListTile(
          //         leading: Icon(
          //           Icons.how_to_reg,
          //         ),
          //         title: const Text('Pre Approved Guests'),
          //         onTap: () {
          //           Get.toNamed(preApprovedGuests);
          //         },
          //       ),
          //       ListTile(
          //         leading: Icon(
          //           Icons.logout,
          //         ),
          //         title: const Text('Logout'),
          //         onTap: () {
          //           MySharedPreferences.deleteUserData();
          //           Get.offAllNamed(loginscreen);
          //         },

          //       ),

          //     ],
          //   ),
          // ),

          // appBar: AppBar(
          //   title: Text('Home'),
          //   backgroundColor: primaryColor,
          //   actions: [
          //     Padding(
          //       padding: EdgeInsets.fromLTRB(0, 10, 15, 0),
          //       child: Badge(
          //         badgeContent: Text(
          //           '10',
          //           style: TextStyle(color: Colors.white),
          //         ),
          //         child: GestureDetector(
          //             onTap: () {
          //               Get.toNamed(guestArrivalNotificationScreen);
          //             },
          //             child: Icon(Icons.notifications)),
          //       ),
          //     )
          //   ],
          // ),

          body: Stack(
            children: [
              Container(
                height: Get.height * 0.563,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/home.jpeg'),
                        fit: BoxFit.cover)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 38, top: 78),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 20,
                                child: SvgPicture.asset('assets/drawer.svg'),
                              ),
                            ),
                            Text(
                              'Home',
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(preApproveEntryNotificationonScreen,
                                    arguments: controller.user);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 26.69),
                                child: Container(
                                  width: 20,
                                  child: SvgPicture.asset(
                                      'assets/notification.svg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Search Your Services',
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Please enter services you want',
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: HexColor('#FFD2D2')),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: SizedBox(
                          height: 48,
                          width: 325,
                          child: TextField(
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    child: SvgPicture.asset(
                                      'assets/arrow.svg',
                                    ),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      BorderSide(color: Color(0xffF4F4F4)),
                                ),
                                filled: true,
                                fillColor: Color(0xffFFFFFF),
                                labelText: 'Search',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Center(
                        child: Container(
                          child: SvgPicture.asset('assets/building.svg'),
                        ),
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 440),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: HexColor('#FFFFFF'),
                  ),
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 30),
                        child: Row(
                          children: [
                            Text(
                              'Our Services',
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: HexColor('#666592')),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 154),
                              child: Text(
                                'View All',
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: HexColor('#8584A5')),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            SvgPicture.asset('assets/arrow.svg'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(preApproveEntryResidents,
                              arguments: controller.user);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 64,
                            width: 324,
                            child: Container(
                              decoration:
                                  BoxDecoration(color: HexColor('#FAFAFA')),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            maxRadius: 20,
                                            backgroundColor: Color.fromRGBO(
                                                255, 153, 0, 0.35),
                                            child:
                                                Image.asset('assets/team.png')),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Pre Approve Entries',
                                              style: GoogleFonts.ubuntu(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                  color: HexColor('#666592')),
                                            ),
                                            Text(
                                              'You Can Pre Approve Your Vistor',
                                              style: GoogleFonts.ubuntu(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                  color: HexColor('#AAA9C9')),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 59.65),
                                          child: SvgPicture.asset(
                                              'assets/greaterthan.svg'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(eventsscreen, arguments: controller.user);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 64,
                            width: 324,
                            child: Container(
                              decoration:
                                  BoxDecoration(color: HexColor('#FAFAFA')),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            maxRadius: 20,
                                            backgroundColor: Color.fromRGBO(
                                                255, 153, 0, 0.35),
                                            child: Image.asset(
                                                'assets/event.png')),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Events',
                                              style: GoogleFonts.ubuntu(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                  color: HexColor('#666592')),
                                            ),
                                            Text(
                                              'You Can View Events',
                                              style: GoogleFonts.ubuntu(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                  color: HexColor('#AAA9C9')),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 115.65),
                                          child: SvgPicture.asset(
                                              'assets/greaterthan.svg'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(noticeboardscreen,
                              arguments: controller.user);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 64,
                            width: 324,
                            child: Container(
                              decoration:
                                  BoxDecoration(color: HexColor('#FAFAFA')),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            maxRadius: 20,
                                            backgroundColor: Color.fromRGBO(
                                                255, 153, 0, 0.35),
                                            child: Image.asset(
                                                'assets/noticeboard.png')),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Notice Board',
                                              style: GoogleFonts.ubuntu(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                  color: HexColor('#666592')),
                                            ),
                                            Text(
                                              'Announcements From Admin',
                                              style: GoogleFonts.ubuntu(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                  color: HexColor('#AAA9C9')),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 75.65),
                                          child: SvgPicture.asset(
                                              'assets/greaterthan.svg'),
                                        )
                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.fromLTRB(
                                  //       35, 23, 286, 8),
                                  //   child: Text(
                                  //     "Coversations",
                                  //     style: GoogleFonts.ubuntu(
                                  //         fontStyle: FontStyle.normal,
                                  //         fontWeight: FontWeight.w600,
                                  //         fontSize: 14,
                                  //         color: HexColor('#585353')),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding:
                                  //       const EdgeInsets.fromLTRB(35, 8, 21, 0),
                                  //   child: Row(
                                  //     children: [
                                  //       SizedBox(
                                  //         width: 140,
                                  //         height: 65,
                                  //         child: GestureDetector(
                                  //           onTap: () {
                                  //             // Get.toNamed(chatavailbilityscreen,
                                  //             //     arguments: [
                                  //             //         _homeScreenController.user,
                                  //             //           snapshot.data[0]]);
                                  //           },
                                  //           child: Card(
                                  //             child: Column(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               children: [
                                  //                 Padding(
                                  //                   padding: const EdgeInsets
                                  //                       .fromLTRB(13, 1, 0, 0),
                                  //                   child: SvgPicture.asset(
                                  //                       'assets/undraw_share_opinion_re_4qk7.svg',
                                  //                       height: 25,
                                  //                       width: 25),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding: const EdgeInsets
                                  //                       .fromLTRB(13, 4, 0, 4),
                                  //                   child: Text(
                                  //                     'Chats',
                                  //                     style: GoogleFonts.ubuntu(
                                  //                         fontStyle:
                                  //                             FontStyle.normal,
                                  //                         fontWeight:
                                  //                             FontWeight.w400,
                                  //                         fontSize: 10,
                                  //                         color: HexColor(
                                  //                             '#585353')),
                                  //                   ),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding: const EdgeInsets
                                  //                       .fromLTRB(13, 0, 0, 0),
                                  //                   child: Text(
                                  //                     'Chat with Neighbours/Gatekeepers',
                                  //                     style: GoogleFonts.ubuntu(
                                  //                         fontStyle:
                                  //                             FontStyle.normal,
                                  //                         fontWeight:
                                  //                             FontWeight.w400,
                                  //                         fontSize: 7,
                                  //                         color: HexColor(
                                  //                             '#8A8A8A')),
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //             elevation: 1.6,
                                  //             shape: RoundedRectangleBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         12)),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(chatavailbilityscreen,
                              arguments: controller.user);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 64,
                            width: 324,
                            child: Container(
                              decoration:
                                  BoxDecoration(color: HexColor('#FAFAFA')),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            maxRadius: 20,
                                            backgroundColor: Color.fromRGBO(
                                                255, 153, 0, 0.35),
                                            child: Image.asset(
                                                'assets/noticeboard.png')),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Chat',
                                              style: GoogleFonts.ubuntu(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                  color: HexColor('#666592')),
                                            ),
                                            Text(
                                              'Chat with Residents/Guards',
                                              style: GoogleFonts.ubuntu(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                  color: HexColor('#AAA9C9')),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 75.65),
                                          child: SvgPicture.asset(
                                              'assets/greaterthan.svg'),
                                        )
                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.fromLTRB(
                                  //       35, 23, 286, 8),
                                  //   child: Text(
                                  //     "Coversations",
                                  //     style: GoogleFonts.ubuntu(
                                  //         fontStyle: FontStyle.normal,
                                  //         fontWeight: FontWeight.w600,
                                  //         fontSize: 14,
                                  //         color: HexColor('#585353')),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding:
                                  //       const EdgeInsets.fromLTRB(35, 8, 21, 0),
                                  //   child: Row(
                                  //     children: [
                                  //       SizedBox(
                                  //         width: 140,
                                  //         height: 65,
                                  //         child: GestureDetector(
                                  //           onTap: () {
                                  //             // Get.toNamed(chatavailbilityscreen,
                                  //             //     arguments: [
                                  //             //         _homeScreenController.user,
                                  //             //           snapshot.data[0]]);
                                  //           },
                                  //           child: Card(
                                  //             child: Column(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               children: [
                                  //                 Padding(
                                  //                   padding: const EdgeInsets
                                  //                       .fromLTRB(13, 1, 0, 0),
                                  //                   child: SvgPicture.asset(
                                  //                       'assets/undraw_share_opinion_re_4qk7.svg',
                                  //                       height: 25,
                                  //                       width: 25),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding: const EdgeInsets
                                  //                       .fromLTRB(13, 4, 0, 4),
                                  //                   child: Text(
                                  //                     'Chats',
                                  //                     style: GoogleFonts.ubuntu(
                                  //                         fontStyle:
                                  //                             FontStyle.normal,
                                  //                         fontWeight:
                                  //                             FontWeight.w400,
                                  //                         fontSize: 10,
                                  //                         color: HexColor(
                                  //                             '#585353')),
                                  //                   ),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding: const EdgeInsets
                                  //                       .fromLTRB(13, 0, 0, 0),
                                  //                   child: Text(
                                  //                     'Chat with Neighbours/Gatekeepers',
                                  //                     style: GoogleFonts.ubuntu(
                                  //                         fontStyle:
                                  //                             FontStyle.normal,
                                  //                         fontWeight:
                                  //                             FontWeight.w400,
                                  //                         fontSize: 7,
                                  //                         color: HexColor(
                                  //                             '#8A8A8A')),
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //             elevation: 1.6,
                                  //             shape: RoundedRectangleBorder(
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(
                                  //                         12)),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
