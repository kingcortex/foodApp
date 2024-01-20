import 'package:app_cooking/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/search_Text_field.dart';

class SearchRecipesPages extends StatefulWidget {
  const SearchRecipesPages({super.key});

  @override
  State<SearchRecipesPages> createState() => _SearchRecipesPagesState();
}

class _SearchRecipesPagesState extends State<SearchRecipesPages> {
  final listRecipes = List.generate(1000, (index) => {'id': index, 'name': 'Card $index'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Search recipes',
          style: AppTheme.normalBold(),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFF292D32)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              children: [
                SearchTextField(),
                const SizedBox(width: 20,),
                MaterialButton(
                    height: 55,
                    minWidth: 55,
                    color: AppTheme.primary100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    onPressed: (){},
                    child: Center(
                      child: SvgPicture.asset("assets/icons/search-normal.svg"),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Search",
                  style: AppTheme.normalBold(),
                ),
                Text(
                  '255 results',
                  style: AppTheme.smallRegular(color: AppTheme.gray2),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15
                ),
                itemCount: listRecipes.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      // color: AppTheme.primary100,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/util/image.png'),
                        fit: BoxFit.cover
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Traditional spare ribs baked',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.smallerBold(color: Colors.white),
                                ),
                                const SizedBox(height: 3,),
                                Text(
                                  'By Chef John',
                                  style: AppTheme.smallerRegular(color: AppTheme.gray3),
                                )
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          top: 10,
                          right: 10,
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
                                  '4',
                                  style: AppTheme.smallerRegular(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}