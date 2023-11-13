import 'package:chat/utils/constvalues.dart';
import 'package:chat/utils/images.dart';
import 'package:chat/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLogoLoadingIndicator extends StatelessWidget {
  final double padding;
  const CustomLogoLoadingIndicator({Key? key, this.padding = ySpaceMid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: SpinKitPumpingHeart(
        size: 200,
        itemBuilder: (context, index) =>  ImageWidget(
          asset: loadingIcon,
          width: 50.w,
          height: 50.w,
        ),
      ),
    ));
  }
}
