import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:spacex_app/constants.dart';
import 'package:spacex_app/controllers/slider_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SliderController controller = Get.put(SliderController());

    return Scaffold(
      backgroundColor: Clrs.cBlack,
      appBar: AppBar(
        backgroundColor: Clrs.cBlack,
        title: const Padding(
          padding: EdgeInsets.only(
            top: 24,
          ),
          child: Center(
            child: Text(
              "SpaceX Launches",
              style: TextStyle(
                  color: Clrs.cWhite, fontSize: 24, fontWeight: Fonts.mediumFW),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 194,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                onPageChanged: (index, reason) {
                  controller.onPageChanged(index);
                },
              ),
              items: controller.images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.78,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => CarouselSlider(
                      options: CarouselOptions(
                        initialPage: entry.key,
                      ),
                      items: controller.images.map((item) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(item),
                        );
                      }).toList(),
                    ),
                    child: Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentIndex.value == entry.key
                            ? Clrs.cWhite
                            : Clrs.cBlack,
                        border: Border.all(
                          color: Clrs.cWhite,
                          width: 1,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
