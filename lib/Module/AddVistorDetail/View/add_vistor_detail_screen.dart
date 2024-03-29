import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:searchfield/searchfield.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/add_vistor_detail_controller.dart';
import '../Model/Resident.dart';

class AddVistorDetailScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<AddVistorDetailController>(
            init: AddVistorDetailController(),
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyBackButton(text: 'Add Vistor Detail'),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Visiting Type",
                            style: GoogleFonts.ubuntu(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: HexColor('#4D4D4D')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(38, 0, 45, 0),
                        child: DropdownButton(
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Colors.black),
                          value: controller.visitingTypeDropDownValue,
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: primaryColor,
                          ),
                          items: controller.visitingTypesList.map((items) {
                            return DropdownMenuItem(
                              value: items..toString(),
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [Text(items.toString())],
                                  )),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.setVisitingType(newValue);
                          },
                        ),
                      ),
                      (controller.visitingTypeDropDownValue == 'Society Visit')
                          ? Column(
                              children: [
                                MyTextFormField(
                                  controller: controller.nameController,
                                  validator: emptyStringValidator,
                                  labelText: 'Enter Name',
                                  hintText: 'Name', 
                                ),
                                MyTextFormField(
                                  controller: controller.cnicController,
                                  // validator: emptyStringValidator,
                                  labelText: 'Cnic',
                                  hintText: 'Cnic',
                                  textInputType: TextInputType.number,
                                ),
                                MyTextFormField(
                                  controller: controller.mobileNoController,
                                  validator: emptyStringValidator,
                                  labelText: 'Mobile Number',
                                  hintText: 'Mobile Number',
                                  textInputType: TextInputType.number,
                                ),
                                MyTextFormField(
                                  controller: controller.vehicleNoController,
                                  validator: emptyStringValidator,
                                  labelText: 'Vehicle Number',
                                  hintText: 'Vehicle Number',
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Visitor Type",
                                      style: GoogleFonts.ubuntu(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: HexColor('#4D4D4D')),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(38, 0, 45, 0),
                                  child: DropdownButton(
                                    style: GoogleFonts.ubuntu(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: Colors.black),
                                    value: controller.visitorTypeDropDownValue,
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: primaryColor,
                                    ),
                                    items: controller.visitorTypesList
                                        .map((items) {
                                      return DropdownMenuItem(
                                        value: items..toString(),
                                        child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                Text(items.toString())
                                              ],
                                            )),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      controller.setVisitorType(newValue);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Search Resident",
                                    style: GoogleFonts.ubuntu(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: HexColor('#4D4D4D')),
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  decoration: new BoxDecoration(
                                    color: HexColor('#EEEEEE'),
                                  ),
                                  child: SearchField(
                                    autoCorrect: true,
                                    validator: (x) {
                                      if (controller.li.contains(x) ||
                                          x!.isEmpty) {
                                        return 'Please Enter a valid Address';
                                      }
                                      return null;
                                    },
                                    onSearchTextChanged: (query) {
                                      final filter = controller.li
                                          .where((element) => element
                                              .houseaddress
                                              .toLowerCase()
                                              .contains(query.toLowerCase()))
                                          .toList();
                                      return filter
                                          .map((e) =>
                                              SearchFieldListItem<String>(
                                                  e.houseaddress))
                                          .toList();
                                    },
                                    key: const Key('searchfield'),
                                    hint: 'Search by House Address',
                                    suggestions: controller.li
                                        .map((e) => SearchFieldListItem<String>(
                                            e.houseaddress))
                                        .toList(),
                                    focusNode: controller.focus,
                                    suggestionState: Suggestion.expand,
                                    onSuggestionTap:
                                        (SearchFieldListItem<String> x) {
                                      controller.focus.unfocus();
                                    },
                                    controller:
                                        controller.searchAddressController,
                                  ),
                                ),
                                MyTextFormField(
                                  controller: controller.nameController,
                                  validator: emptyStringValidator,
                                  labelText: 'Enter Name',
                                  hintText: 'Name',
                                ),
                                
                                MyTextFormField(
                                  controller: controller.cnicController,
                                  // validator: emptyStringValidator,
                                  labelText: 'Cnic',
                                  hintText: 'Cnic',
                                  textInputType: TextInputType.number,
                                ),
                                MyTextFormField(
                                  controller: controller.mobileNoController,
                                  validator: emptyStringValidator,
                                  labelText: 'Mobile Number',
                                  hintText: 'Mobile Number',
                                  textInputType: TextInputType.number,
                                ),
                                MyTextFormField(
                                  controller: controller.vehicleNoController,
                                  validator: emptyStringValidator,
                                  labelText: 'Vehicle Number',
                                  hintText: 'Vehicle Number',
                                ),
                              ],
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      MyButton(
                          name: 'Check-In',
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.visitingTypeDropDownValue ==
                                  'Society Visit') {
                                controller.currentDate = controller
                                        .currentDateTime.year
                                        .toString() +
                                    "-" +
                                    controller.currentDateTime.month
                                        .toString() +
                                    "-" +
                                    controller.currentDateTime.day.toString();

                                controller.currentTime =
                                    controller.currentDateTime.hour.toString() +
                                        ":" +
                                        controller.currentDateTime.minute
                                            .toString() +
                                        ":" +
                                        controller.currentDateTime.second
                                            .toString();
                                            

                                controller.addVistorDetailApi(
                                    societyid: controller.userdata.societyid!,
                                    subadminid: controller.userdata.subadminid!,
                                    token: controller.userdata.bearerToken!,
                                    cnic: controller.cnicController.text,
                                    name: controller.nameController.text,
                                    mobileno:
                                        controller.mobileNoController.text,
                                    houseaddress: 'Society Vistor',
                                    arrivaldate: controller.currentDate!,
                                    arrivaltime: controller.currentTime!,
                                    vechileno:
                                        controller.vehicleNoController.text,
                                    visitortype:
                                        'Society Vistor',
                                    gatekeeperid: controller.userdata.userid!);
                              } else {
                                controller.currentDate = controller
                                        .currentDateTime.year
                                        .toString() +
                                    "-" +
                                    controller.currentDateTime.month
                                        .toString() +
                                    "-" +
                                    controller.currentDateTime.day.toString();

                                controller.currentTime =
                                    controller.currentDateTime.hour.toString() +
                                        ":" +
                                        controller.currentDateTime.minute
                                            .toString() +
                                        ":" +
                                        controller.currentDateTime.second
                                            .toString();

                               
                                controller.addVistorDetailApi(
                                    societyid: controller.userdata.societyid!,
                                    subadminid: controller.userdata.subadminid!,
                                    token: controller.userdata.bearerToken!,
                                    cnic: controller.cnicController.text,
                                    name: controller.nameController.text,
                                    mobileno:
                                        controller.mobileNoController.text,
                                    houseaddress: controller.searchAddressController.text,
                                    arrivaldate: controller.currentDate!,
                                    arrivaltime: controller.currentTime!,
                                    vechileno:
                                        controller.vehicleNoController.text,
                                    visitortype:
                                        controller.visitorTypeDropDownValue!,
                                    gatekeeperid: controller.userdata.userid!);
                              }
                            }
                          }),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
