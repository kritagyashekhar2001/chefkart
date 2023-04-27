import 'package:chefkart/screens/bloc/dishes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishDetails extends StatefulWidget {
  final String rating;
  final String description;
  final String imageUrl;
  final int index;
  const DishDetails(
      {super.key,
      required this.rating,
      required this.description,
      required this.imageUrl,
      required this.index});

  @override
  State<DishDetails> createState() => _DishDetailsState();
}

class _DishDetailsState extends State<DishDetails> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<DishesBloc>(context).add(FetchDisheDetail(widget.index));
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Ingredients",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: BlocBuilder<DishesBloc, DishesState>(
        builder: (context, state) {
          if (state is DishDetailsLoaded) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: height * 0.02,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.dishDetails.name ?? "",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: height * 0.03,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: width * 0.01),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.015,
                                              vertical: height * 0.005),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(width * 0.01),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              widget.rating,
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
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      widget.description,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.015,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Text(
                                      "Time to prepare: ${state.dishDetails.timeToPrepare}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: height * 0.015,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    height: height * 0.15,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(widget.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                      border: Border.all(
                                        color: Colors.orange.withOpacity(0.6),
                                        width: 1.2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(width * 0.05),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.3),
                          thickness: 2,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Ingredients",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.025,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "For 2 people",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.015,
                            height: 2,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          child: Divider(
                            color: Colors.grey.withOpacity(0.2),
                            thickness: 1,
                          ),
                        ),
                        Text(
                          "Vegetables (${state.dishDetails.ingredients?.vegetables?.length ?? 0})",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.02,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          children: List.generate(
                              state.dishDetails.ingredients?.vegetables
                                      ?.length ??
                                  0, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.dishDetails.ingredients
                                          ?.vegetables?[index].name ??
                                      "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: height * 0.015,
                                      color: Colors.black54,
                                      height: 1.8),
                                ),
                                Text(
                                  state.dishDetails.ingredients
                                          ?.vegetables?[index].quantity ??
                                      "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.015,
                                    height: 1.8,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Spices (${state.dishDetails.ingredients?.spices?.length ?? 0})",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.02,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          children: List.generate(
                              state.dishDetails.ingredients?.spices?.length ??
                                  0, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.dishDetails.ingredients?.spices?[index]
                                          .name ??
                                      "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: height * 0.015,
                                      color: Colors.black54,
                                      height: 1.8),
                                ),
                                Text(
                                  state.dishDetails.ingredients?.spices?[index]
                                          .quantity ??
                                      "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.015,
                                    height: 1.8,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Appliances",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.02,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        state.dishDetails.ingredients?.appliances?.length ?? 0,
                        (index) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.symmetric(
                            vertical: width * 0.02, horizontal: width * 0.02),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.1,
                          vertical: width * 0.05,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                            width: 1.2,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(width * 0.02)),
                        ),
                        child: Text(
                          state.dishDetails.ingredients?.appliances?[index]
                                  .name ??
                              "",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.015,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }),
                  ),
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
    );
  }
}
