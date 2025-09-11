import 'dart:ui';
import 'package:FoodCrew/View/Widgegts/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Global/controller/food_review_controller.dart';
import '../../../Utils/AppColors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Gradient background using AppColors.lightBlue and AppColors.skyBlue
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.lightBlue, AppColors.skyBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
                    child: CustomImage(
                      imageSrc: 'assets/logo/app_logo.png',
                      size: 120,
                      imageType: ImageType.png,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                    child: FoodReviewForm(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodReviewForm extends StatelessWidget {
  const FoodReviewForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FoodReviewController>();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white200.withOpacity(0.25),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.navy900.withOpacity(0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
              border: Border.all(color: AppColors.white400.withOpacity(0.3)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionHeader(
                    icon: Icons.health_and_safety,
                    color: AppColors.navy500,
                    label: 'Health Info',
                  ),
                  const Divider(height: 32, thickness: 1.2, color: AppColors.navy100),
                  _buildRadioField(
                    label: 'High Blood Pressure?',
                    value: controller.highBloodPressure,
                    onChanged: (val) => controller.highBloodPressure.value = val ?? '',
                    helper: 'Do you have high blood pressure?',
                  ),
                  const SizedBox(height: 16),
                  _buildRadioField(
                    label: 'Loose Weight?',
                    value: controller.looseWeight,
                    onChanged: (val) => controller.looseWeight.value = val ?? '',
                    helper: 'Are you trying to lose weight?',
                  ),
                  const SizedBox(height: 16),
                  _buildRadioField(
                    label: 'Pregnant or Nursing?',
                    value: controller.pregnantOrNursing,
                    onChanged: (val) => controller.pregnantOrNursing.value = val ?? '',
                    helper: 'Are you currently pregnant or nursing?',
                  ),
                  const SizedBox(height: 16),
                  _buildRadioField(
                    label: 'Child under 12?',
                    value: controller.childUnder12,
                    onChanged: (val) => controller.childUnder12.value = val ?? '',
                    helper: 'Is this review for a child under 12?',
                  ),
                  const SizedBox(height: 24),
                  _sectionHeader(
                    icon: Icons.restaurant_menu,
                    color: AppColors.golden400,
                    label: 'Diet Preferences',
                  ),
                  const Divider(height: 32, thickness: 1.2, color: AppColors.golden100),
                  const Text('Diet?', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy500)),
                  Obx(() => DropdownButtonFormField<String>(
                    value: controller.diet.value.isEmpty ? null : controller.diet.value,
                    items: const [
                      DropdownMenuItem(value: 'Omnivore', child: Text('Omnivore')),
                      DropdownMenuItem(value: 'Vegetarian', child: Text('Vegetarian')),
                    ],
                    onChanged: (val) => controller.diet.value = val ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: AppColors.white100,
                      helperText: 'Select your diet type',
                    ),
                    validator: (val) => val == null ? 'Please select diet' : null,
                  )),
                  const SizedBox(height: 24),
                  _sectionHeader(
                    icon: Icons.flag,
                    color: AppColors.navy400,
                    label: 'Main Goal',
                  ),
                  const Divider(height: 32, thickness: 1.2, color: AppColors.navy100),
                  const Text('Main Goal? (Optional)', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy500)),
                  Obx(() => DropdownButtonFormField<String>(
                    value: controller.mainGoal.value.isEmpty ? null : controller.mainGoal.value,
                    items: const [
                      DropdownMenuItem(value: 'Boost immunity', child: Text('Boost immunity')),
                      DropdownMenuItem(value: 'Heart+Kidney', child: Text('Heart+Kidney')),
                      DropdownMenuItem(value: 'Plant-based', child: Text('Plant-based')),
                      DropdownMenuItem(value: 'Metabolic', child: Text('Metabolic')),
                    ],
                    onChanged: (val) => controller.mainGoal.value = val ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: AppColors.white100,
                      helperText: 'Select your main health goal',
                    ),
                  )),
                  const SizedBox(height: 32),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.send, color: AppColors.white500),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          backgroundColor: AppColors.navy500,
                          elevation: 6,
                          shadowColor: AppColors.navy700,
                        ),
                        onPressed: () {
                          if (controller.validate()) {
                            controller.submit();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Review submitted!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please select diet')),
                            );
                          }
                        },
                        label: const Text('Submit', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppColors.white500, letterSpacing: 1.2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader({required IconData icon, required Color color, required String label}) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color, size: 28),
          radius: 22,
        ),
        const SizedBox(width: 12),
        Text(label, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 1.1, color: color)),
      ],
    );
  }

  Widget _buildRadioField({
    required String label,
    required RxString value,
    required Function(String?) onChanged,
    String? helper,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.navy500)),
        if (helper != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(helper, style: const TextStyle(fontSize: 13, color: AppColors.black200)),
          ),
        Obx(() => Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Yes', style: TextStyle(color: AppColors.navy500)),
                value: 'Yes',
                groupValue: value.value.isEmpty ? null : value.value,
                onChanged: onChanged,
                activeColor: AppColors.golden400,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('No', style: TextStyle(color: AppColors.navy500)),
                value: 'No',
                groupValue: value.value.isEmpty ? null : value.value,
                onChanged: onChanged,
                activeColor: AppColors.golden400,
              ),
            ),
          ],
        )),
      ],
    );
  }
}
