import 'package:app_cooking/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainFoodCard extends StatelessWidget {
  final String title;
  final String image;
  final int time;
  final double rating;
  const MainFoodCard({
    required this.title,
    required this.image,
    required this.time,
    required this.rating,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          Container(
            height: 231,
            width: 150,
            alignment: Alignment.bottomCenter,
            child:Container(
              height: 176,
              width: 150,
              decoration: BoxDecoration(
                color: AppTheme.gray4,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 66,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 42,
                        width: 130,
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: AppTheme.smallBold(color: AppTheme.gray1),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 19,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Times",
                              style: AppTheme.smallerRegular(color: AppTheme.gray3),
                            ),
                            Text(
                              "$time Mins",
                              style: AppTheme.smallerBold(color: AppTheme.gray1),
                            )
                          ],
                        ),
                        Container(
                          height: 24,
                          width: 24,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: SvgPicture.asset("assets/food_cards_icons_and_image/Inactive.svg" ,),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),

          Stack(
            children: <Widget>[
              Container(
                  height: 110,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/food_cards_icons_and_image/$image.png"),
                      fit: BoxFit.scaleDown
                    )
                  ),
                ),
              
          Positioned(
                top: 30,
                right: 2,
                child: Container(
                  height: 23,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppTheme.secondary20,
                    borderRadius: BorderRadiusDirectional.circular(20 )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                        width: 10,
                        child: Center(
                          child: SvgPicture.asset('assets/food_cards_icons_and_image/star.svg'),
                        ),
                      ),
                      const SizedBox(width: 5,),

                      Text(
                        rating.toString(),
                        style: AppTheme.smallerRegular(color: Colors.black),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}