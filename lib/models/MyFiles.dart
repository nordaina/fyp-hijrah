import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Applications",
    numOfFiles: 1,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "",
    color: primaryColor,
    percentage: 1,
  ),
  // CloudStorageInfo(
  //   title: "Cash In",
  //   numOfFiles: 1328,
  //   svgSrc: "",
  //   totalStorage: "2.9GB",
  //   color: Color(0xFFFFA113),
  //   percentage: 35,
  // ),
  // CloudStorageInfo(
  //   title: "Cash Out",
  //   numOfFiles: 1328,
  //   svgSrc: "",
  //   totalStorage: "1GB",
  //   color: Color(0xFFA4CDFF),
  //   percentage: 10,
  // ),
  // CloudStorageInfo(
  //   title: "Documents",
  //   numOfFiles: 5328,
  //   svgSrc: "assets/icons/drop_box.svg",
  //   totalStorage: "7.3GB",
  //   color: Color(0xFF007EE5),
  //   percentage: 78,
  // ),
];
