import 'package:chefkart/screens/bloc/dishes_bloc.dart';
import 'package:chefkart/screens/ingredients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularDishes extends StatelessWidget {
  const PopularDishes({
    super.key,
    required this.width,
    required this.height,
    required this.popularDishes,
  });

  final double width;
  final double height;
  final List popularDishes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          popularDishes.length,
          (index) {
            return Container(
              margin: EdgeInsets.symmetric(
                  vertical: height * 0.01, horizontal: width * 0.01),
              width: height * 0.12,
              height: height * 0.12,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.25), // border color
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(popularDishes[index].image ?? ""),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.orange.shade800,
                  ),
                  child: Center(
                      child: Text(
                    popularDishes[index].name ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.013,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AvaliableDishes extends StatelessWidget {
  const AvaliableDishes({
    super.key,
    required this.width,
    required this.height,
    required this.avaliableDishes,
  });

  final double width;
  final double height;
  final List avaliableDishes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          avaliableDishes.length,
          (index) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: height * 0.03,
                horizontal: width * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              avaliableDishes[index].name ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.022,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.01),
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.01,
                                  vertical: height * 0.005),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(width * 0.01),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  avaliableDishes[index].rating.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.013,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Row(
                          children: [
                            Row(
                              children: List.generate(
                                  avaliableDishes[index].equipments!.length,
                                  (i) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.01),
                                  child: Text(
                                    avaliableDishes[index]
                                        .equipments![i]
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: height * 0.012,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: height * 0.022,
                              child: VerticalDivider(
                                color: Colors.grey.withOpacity(0.5),
                                thickness: 1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => DishesBloc(),
                                      child: DishDetails(
                                        imageUrl:
                                            avaliableDishes[index].image ?? "",
                                        description: avaliableDishes[index]
                                                .description ??
                                            "",
                                        rating: avaliableDishes[index]
                                            .rating
                                            .toString(),
                                        index: index + 1,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.01,
                                    vertical: height * 0.005),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        "Ingredients",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: height * 0.013,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "View list",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: height * 0.011,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          avaliableDishes[index].description ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.013,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(clipBehavior: Clip.none, children: [
                      Container(
                        height: height * 0.1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                avaliableDishes[index].image ?? ""),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.orange.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.orange.withOpacity(0.6),
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(width * 0.02),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.07,
                        left: width * 0.04,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: width * 0.02, horizontal: width * 0.02),
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.06,
                            vertical: width * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.orange.withOpacity(0.6),
                              width: 1.2,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(width * 0.02)),
                          ),
                          child: Text(
                            "ADD",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.015,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
