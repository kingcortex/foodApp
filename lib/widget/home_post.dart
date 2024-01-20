import 'package:app_cooking/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePost extends StatelessWidget {
  final String title;
  final int rating;
  final int time;
  final String author;
  final String profileImage;
  final String postImage;
  const HomePost({
    required this.title,
    required this.rating,
    required this.time,
    required this.author,
    required this.profileImage,
    required this.postImage,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          Container(
            height: 127,
            width: 251,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 9.3),
              height: 95,
              width: 251,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      width: 139.444444,
                      child: Text(
                        title,
                        style: AppTheme.smallBold(color: AppTheme.gray1),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for(int i = 0; i < rating; i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(right: 1.86),
                          alignment: Alignment.center,
                          child: SvgPicture.asset('assets/food_cards_icons_and_image/star.svg'),
                        )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right:  8),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/post_home/$profileImage.png')
                              )
                            ),
                          ),
                          Text(
                            'By $author',
                            style: AppTheme.smallerRegular(color: AppTheme.gray3),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.timer, color: AppTheme.gray3, size: 17,),
                          const SizedBox(width:5 ,),
                          Text(
                            '$time mins',
                            style: AppTheme.smallRegular(color: AppTheme.gray3),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 35,
            right: 3.72,
            child: Container(
              height: 93,
              width: 93,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 235, 181, 177),
                image: DecorationImage(
                  image: AssetImage('assets/post_home/$postImage.png'),
                  fit: BoxFit.contain
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}