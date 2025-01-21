import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/size_constants.dart';

class AppUtils {
  static const BorderRadius border10 =  BorderRadius.all(
    Radius.circular(SizesCons.size_10),
  );
  static const border12 = BorderRadius.all(
    Radius.circular(SizesCons.size_12),
  );
  static const borderTr30Tl30 = BorderRadius.only(
    topRight: Radius.circular(
      SizesCons.size_30,
    ),
    topLeft: Radius.circular(
      SizesCons.size_30,
    ),
  );
}
