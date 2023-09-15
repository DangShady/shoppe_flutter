import 'dart:io';
import 'package:ai_chat_flutter/constants/app_constant.dart';
import 'package:ai_chat_flutter/constants/image_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/profile/profile_controller.dart';
import 'package:ai_chat_flutter/routes/app_pages.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:ai_chat_flutter/widget/button_with_icon.dart';
import 'package:ai_chat_flutter/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/screen_util.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ProfilePage extends GetView<ProfileController> {
  ProfilePage({super.key});
  File? selectedImage;

  void _onPhoneNumberChanged(PhoneNumber number) {
    // Xử lý số điện thoại sau khi thay đổi
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);

      print('Selected Image: $selectedImage');
    } else {
      print('No Images Select');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: BASE_WIDTH, allowFontScaling: true)
      ..init(context);

    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60.h),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Complete your profile 📋',
                        style: Style().h3Bold,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Please enter your profile. Don’t worry, only you can see your personal data. No one else will be able to see it. Or you can skip it for now.',
                        style: Style().bodyXLargeRegular,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            selectedImage != null
                                ? CircleAvatar(
                                    radius: 64,
                                    backgroundImage: FileImage(selectedImage!),
                                  )
                                : CircleAvatar(
                                    radius: 64,
                                    backgroundImage:
                                        AssetImage(ImageConstant.icProfile),
                                  ),
                            Positioned(
                              // ignore: sort_child_properties_last
                              child: IconButton(
                                onPressed: _pickImage,
                                icon: const Icon(Icons.add_a_photo),
                              ),
                              bottom: -10,
                              left: 80,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text('Full Name', style: Style().bodyLargeBold),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextFormField(
                        style: Style().h5Bold,
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          suffixIcon: const Icon(Icons.check_box),
                          hintStyle:
                              Style().h5Bold.copyWith(color: const Color(0xff9E9E9E)),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Phone Number',
                        style: Style().bodyLargeBold,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      InternationalPhoneNumberInput(
                        onInputChanged:
                            _onPhoneNumberChanged, // Gọi hàm xử lý khi số điện thoại thay đổi
                        initialValue: PhoneNumber(
                            isoCode:
                                'VN'), // Quốc gia mặc định (ví dụ: Việt Nam)
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        inputDecoration: InputDecoration(
                          hintText: 'Phone Number',
                          suffixIcon: const Icon(Icons.phone),
                          hintStyle:
                              Style().h5Bold.copyWith(color: const Color(0xff9E9E9E)),
                        ),

                        keyboardType: TextInputType
                            .phone, // Các thuộc tính và cấu hình khác
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Gender',
                        style: Style().bodyLargeBold,
                      ),
                      DropdownButtonFormField<String>(
                        hint: const Text('Gender'),
                        value: controller.selectedGender.value,
                        onChanged: (newValue) {
                          controller.selectedGender.value = newValue.toString();
                        },
                        items: ['Male', 'Female', 'Other'].map((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          hintText: 'Select Gender',
                          hintStyle:
                              Style().h5Bold.copyWith(color: const Color(0xff9E9E9E)),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Date of Birth',
                        style: Style().bodyLargeBold,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadiusButton(
                      text: 'Skip'.tr,
                      fontSize: 18,
                      isFullWidth: true,
                      textColor: Style.primaryColor,
                      backgroundColor: Style.primary50,
                      outsidePadding: EdgeInsets.only(left: 24.w),
                      radius: 100,
                      innerPadding: EdgeInsets.symmetric(vertical: 22.h),
                      onTap: () {
                        Get.toNamed(AppRoutes.register);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: RadiusButton(
                      text: 'Continue'.tr,
                      fontSize: 18,
                      isFullWidth: true,
                      textColor: Colors.white,
                      backgroundColor: Style.primaryColor,
                      radius: 100,
                      innerPadding: EdgeInsets.symmetric(vertical: 22.h),
                       outsidePadding: EdgeInsets.only(right: 24.w),
                      onTap: () {
                        customDialog(context,
                            isLoading: controller.isLoading.value,
                            icon: Image.asset(ImageConstant.icLogSuccess),
                            textConfirmColor: Colors.red,
                            text: "Sig Up Successful!");
                        Future.delayed(const Duration(seconds: 1), () {
                          controller.isLoading.value = false;
                          if (controller.isLoading.value == false) {
                            Get.back();
                            Get.toNamed(AppRoutes.home);
                          }
                          // Đóng hộp thoại.
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h,),
            ],
          ),
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
