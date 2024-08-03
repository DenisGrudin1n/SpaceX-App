import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:spacex_app/constants.dart';
import 'package:spacex_app/controllers/missions_controller.dart';
import 'package:spacex_app/controllers/rockets_controller.dart';
import 'package:spacex_app/controllers/slider_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SliderController sliderController = Get.put(SliderController());
    final RocketsController rocketsController = Get.put(RocketsController());
    final MissionsController missionsController = Get.put(MissionsController());
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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
        ),
        child: ListView(
          children: [
            Obx(
              () {
                if (rocketsController.rockets.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Clrs.cLightGreen,
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CarouselSlider.builder(
                        itemCount: rocketsController.rockets.length,
                        options: CarouselOptions(
                          height: screenHeight * 0.25,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.17,
                          onPageChanged: (index, reason) {
                            sliderController.onPageChanged(index);
                            final rocket = rocketsController.rockets[index];
                            missionsController.fetchMissionsForRocket(
                                rocket.rocketId.toString());
                          },
                        ),
                        itemBuilder: (context, index, realIndex) {
                          final rocket = rocketsController.rockets[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              rocket.flickrImages.isNotEmpty
                                  ? rocket.flickrImages[0]
                                  : 'https://via.placeholder.com/150',
                              fit: BoxFit.cover,
                              width: screenWidth * 0.78,
                            ),
                          );
                        },
                      ),
                      Obx(
                        () {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                rocketsController.rockets.asMap().entries.map(
                              (entry) {
                                return GestureDetector(
                                  onTap: () {
                                    sliderController.onPageChanged(entry.key);
                                  },
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
                                          sliderController.currentIndex.value ==
                                                  entry.key
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
                  );
                }
              },
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
            Obx(
              () {
                if (missionsController.isLoading.value) {
                  return SizedBox(
                    height: screenHeight / 2,
                    child: const Center(
                      child: CircularProgressIndicator(color: Clrs.cLightGreen),
                    ),
                  );
                } else if (missionsController.missions.isEmpty) {
                  return SizedBox(
                    height: screenHeight / 2,
                    child: const Center(
                      child: Text(
                        "No missions available",
                        style: TextStyle(color: Clrs.cWhite, fontSize: 18),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: missionsController.missions.map((mission) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: Container(
                          height: screenHeight * 0.15,
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
                                      mission.date,
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
                                      mission.time,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mission.name,
                                        style: const TextStyle(
                                          color: Clrs.cWhite,
                                          fontWeight: FontWeights.mediumFW,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Flexible(
                                        child: Text(
                                          mission.location,
                                          style: const TextStyle(
                                            color: Clrs.cLightGrey,
                                            fontWeight: FontWeights.lightFW,
                                            fontSize: 16,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
