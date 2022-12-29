import 'package:flutter/material.dart';

enum  AppColor {
 grayscaleBlack('grayscaleBlack', Color(0xff040000)),
 grayscaleBlackLight('grayscaleBlackLight', Color(0xff272d34)),
 grayscaleGrayDark('grayscaleGrayDark', Color(0xff505361)),
 grayscaleGrayDefault('grayscaleGrayDefault', Color(0xff7f8392)),
 grayscaleGrayLight('grayscaleGrayLight', Color(0xffa3a7b5)),
 grayscaleGrayLighter('grayscaleGrayLighter', Color(0xffdadfe8)),

 grayscaleBackgroundDark('grayscaleBackgroundDark', Color(0xffeaeaea)),
 grayscaleBackgroundLight('grayscaleBackgroundLight', Color(0xfff6f6f6)),

 white100('white100', Color(0xFFFFFFFF)),
 white70('white70', Color(0xB3FFFFFF)),
 white50('white50', Color(0x80FFFFFF)),
 white30('white30', Color(0x4DFFFFFF)),
 white10('white10', Color(0x1AFFFFFF)),

 primaryDefault('primaryDefault', Color(0xff8976bf)),
 primaryDark('primaryDark', Color(0xff604b9c)),
 primaryLight('primaryLight', Color(0xffc0b2d8)),
 primaryLighter('primaryLighter', Color(0xfff8f6ff)),

 accentDefault('accentDefault', Color(0xfff0a156)),
 accentDark('accentDark', Color(0xffb45e10)),
 accentLight('accentLight', Color(0xffffe5ce)),
 accentLighter('ccentLighter', Color(0xfffffaf2)),

 successDefault('successDefault', Color(0xff4aaa7c)),
 successDark('successDark', Color(0xff0e6a3e)),
 successLight('successLight', Color(0xffddfbed)),

 warningDefault('warningDefault', Color(0xfff4cd3f)),
 warningDark('warningDark', Color(0xffd3a019)),
 warningLight('warningLigh', Color(0xfffff2d0)),

 dangerDefault('dangerDefault', Color(0xfff49f9f)),
 dangerDark('dangerDark', Color(0xffc65151)),
 dangerLight('dangerLight', Color(0xffffeaea)),

 etcToast('etcToast', Color(0xcc32363a)),
 etcDim('etcDim', Color(0x99222628)),

  undefined('default',Colors.white);
  const AppColor(
      this.code,
      this.color
      );
  final String code;
  final Color color;
  factory AppColor.getByCode(String code) {
    return AppColor.values.firstWhere((element) => element.code == code ,
    orElse: () => AppColor.undefined);
  }
}