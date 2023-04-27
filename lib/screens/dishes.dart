import 'package:chefkart/screens/bloc/dishes_bloc.dart';
import 'package:chefkart/screens/ingredients.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/dishes_screen_components.dart';

class AllDishes extends StatefulWidget {
  const AllDishes({super.key});

  @override
  State<AllDishes> createState() => _AllDishesState();
}

class _AllDishesState extends State<AllDishes> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<DishesBloc>(context).add(FetchDishesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Select Dishes",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: height * 0.022,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(width * 0.03),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.orange,
                            size: height * 0.02,
                          ),
                          Text(
                            "  21 May 2021",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: height * 0.018,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                  child: VerticalDivider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 2,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock_clock,
                          color: Colors.orange,
                          size: height * 0.02,
                        ),
                        Text(
                          "  10:30 pm to 12:30 pm",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: height * 0.018,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.01),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.symmetric(
                        vertical: width * 0.02, horizontal: width * 0.02),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.1,
                      vertical: width * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.orange.withOpacity(0.6),
                        width: 1.2,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.1)),
                    ),
                    child: Text(
                      "Italian",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.015,
                        color: Colors.orange,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          BlocBuilder<DishesBloc, DishesState>(
            builder: (context, state) {
              if (state is DishesLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.01),
                      child: Text(
                        "Popular Dishes",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: height * 0.02,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    PopularDishes(
                      width: width,
                      height: height,
                      popularDishes: state.dishesList.popularDishes ?? [],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.01),
                      child: Divider(
                        color: Colors.grey.withOpacity(0.2),
                        thickness: 1,
                      ),
                    ),
                    AvaliableDishes(
                      width: width,
                      height: height,
                      avaliableDishes: state.dishesList.dishes ?? [],
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
