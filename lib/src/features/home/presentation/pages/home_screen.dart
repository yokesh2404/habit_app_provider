import 'package:flutter/material.dart';
import 'package:habit_tracker/src/core/utils/app_extensions.dart';
import 'package:habit_tracker/src/core/utils/app_images.dart';
import 'package:habit_tracker/src/features/home/presentation/controller/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Image.asset(AppImages.calender, height: 22, width: 22),
                SizedBox(width: 10),
                Text("Today", style: TextStyle(color: Color(0xFF005ECE))),
                Spacer(),
                Image.asset(AppImages.more, height: 22, width: 22),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF005ECE),
            onPressed: () {},
            child: Icon(Icons.add, color: Colors.white),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    width: context.screenWidth,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color:
                                value.isCurrentDate(value.state.dateList[index])
                                ? Color(0xFF005ECE)
                                : Color(0xFFEEF5FF),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    value.state.dateList[index].toFormatDate(
                                      "E",
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          value.isCurrentDate(
                                            value.state.dateList[index],
                                          )
                                          ? Colors.white
                                          : Color(0xFF005ECE),
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(height: 12),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color:
                                        value.isCurrentDate(
                                          value.state.dateList[index],
                                        )
                                        ? Color(0xFF318FFF)
                                        : Color(0xFFDDECFF),
                                  ),
                                  // height: 45,
                                  width: 60,
                                  // padding: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  child: Text(
                                    value.state.dateList[index].day.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          value.isCurrentDate(
                                            value.state.dateList[index],
                                          )
                                          ? Colors.white
                                          : Color(0xFF005ECE),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: value.state.dateList.length,
                    ),
                  ),
                  if ([].isEmpty)
                    SizedBox(
                      height: context.screenHeight - 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.noTask, height: 80),
                          Text(
                            "No Task Available !",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF005ECE),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Text("data"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
