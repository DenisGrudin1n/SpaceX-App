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

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                  color: Clrs.cWhite,
                  fontSize: 24,
                  fontWeight: FontWeights.mediumFW),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: screenHeight * 0.26,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.17,
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
                            width: screenWidth * 0.78,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Obx(
                  () {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.images.asMap().entries.map(
                        (entry) {
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
                                color:
                                    controller.currentIndex.value == entry.key
                                        ? Clrs.cWhite
                                        : Clrs.cBlack,
                                border: Border.all(
                                  color: Clrs.cWhite,
                                  width: 1,
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Missions",
              style: TextStyle(
                color: Clrs.cWhite,
                fontWeight: FontWeights.mediumFW,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ...controller.missions.map((mission) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: screenHeight * 0.144,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Clrs.cDarkGrey,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    16,
                    21,
                    16,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mission['date']!,
                            style: const TextStyle(
                              color: Clrs.cLightGreen,
                              fontWeight: FontWeights.mediumFW,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            mission['time']!,
                            style: const TextStyle(
                              color: Clrs.cLightGrey,
                              fontWeight: FontWeights.lightFW,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 21,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mission['name']!,
                              style: const TextStyle(
                                color: Clrs.cWhite,
                                fontWeight: FontWeights.mediumFW,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              mission['location']!,
                              style: const TextStyle(
                                color: Clrs.cLightGrey,
                                fontWeight: FontWeights.lightFW,
                                fontSize: 16,
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
