import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/crop.dart';

Widget CropCard({required Crop crop, required BuildContext context}){
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      height: 100,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: white, //Color(0xFF1D1F33),
        image: DecorationImage(
          image: NetworkImage(crop.photo),
          fit: BoxFit.cover
        )
        //boxShadow: [containerShadow]
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 70,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          Text(
            crop.name,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          )
        ],
      ),
      // child: Container(
      //   padding: const EdgeInsets.only(right: 10),
      //   height: 100,
      //   width: MediaQuery.of(context).size.width / 2,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     children: [
      //       Expanded(
      //         flex: 2,
      //         child: Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: CachedNetworkImage(
      //             imageBuilder: (context, imageProvider) => Container(
      //               decoration: BoxDecoration(
      //                 //shape: BoxShape.circle,
      //                 image: DecorationImage(
      //                   image: imageProvider,
      //                   fit: BoxFit.contain,
      //                 ),
      //               ),
      //             ),
      //             imageUrl: crop.photo,
      //             placeholder: (context, url) => Container(),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(width: 4),
      //       Expanded(
      //         flex: 3,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text(
      //               crop.name.toUpperCase(),
      //               style: const TextStyle(
      //                 color: Colors.black,
      //                 // fontFamily: kFont,
      //                 fontWeight: FontWeight.w600,
      //                 fontSize: 25.0,
      //               ),
      //             ),
      //             Text(
      //               crop.price,
      //               style: const TextStyle(
      //                 color: mayGreen,
      //                 fontWeight: FontWeight.w600,
      //                 fontSize: 15.0,
      //               ),
      //             ),
      //             crop.description == "" ? Container() :
      //             Padding(
      //               padding: const EdgeInsets.only(top: 5),
      //               child: AutoSizeText(
      //                 crop.description,
      //                 maxLines: 7,
      //                 minFontSize: 7,
      //                 maxFontSize: 12,
      //                 style: const TextStyle(
      //                   color: green,
      //                   fontWeight: FontWeight.w600,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    ),
  );
}