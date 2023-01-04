import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g62_find_home/app/data/models/response/response_house_model.dart';
import 'package:g62_find_home/app/ui/components/buttons/btn_prymary.dart';
import 'package:g62_find_home/app/ui/components/textfields/input_text.dart';
import 'package:g62_find_home/app/ui/views/detail/detail_controller.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';
import 'package:g62_find_home/core/utils/constant.dart';
import 'package:get/get.dart';

class Footer extends StatefulWidget {
  @override
  FooterState createState() => FooterState();

  Footer({
    required this.house,
  });
  final House house;
}

class FooterState extends State<Footer> {
  final _dateController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _dateController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 95.h,
        padding: EdgeInsets.symmetric(horizontal: kMarginLargeApp.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${widget.house.price}",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.blueDark, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () => _settingModalBottomSheet(context),
              child: Container(
                width: 170.w,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.cyan,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  "Reserved Now!",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      //isDismissible: false,
      //enableDrag: false,
      builder: (_) => GetBuilder<DetailController>(
        builder: (controller) => Container(
          height: 400.h,
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 30.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reserved",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColors.blueDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 30.h),
              InputText(
                controller: controller.crtTextDate,
                iconPrefix: Icons.date_range,
                iconColor: AppColors.light,
                border: InputBorder.none,
                keyboardType: TextInputType.datetime,
                labelText: "Date",
                filled: false,
                enabledBorderColor: Colors.black26,
                focusedBorderColor: AppColors.cyan,
                fontSize: 14.0,
                fontColor: Colors.black45,
                //onChanged: controller.onChangeDate,
              ),
              SizedBox(height: 20.h),
              InputText(
                initialValue: "\$ ${controller.house.price}",
                iconPrefix: Icons.monetization_on,
                iconColor: AppColors.light,
                border: InputBorder.none,
                keyboardType: TextInputType.number,
                labelText: "Price",
                filled: false,
                enabledBorderColor: Colors.black26,
                focusedBorderColor: AppColors.cyan,
                readOnly: true,
                fontSize: 14.0,
                fontColor: Colors.black45,
              ),
              SizedBox(height: 50.h),
              BtnPrimary(
                text: "Save",
                onPressed: controller.reservation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
