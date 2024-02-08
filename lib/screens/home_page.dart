import 'package:app_cooking/model/data.dart';
import 'package:app_cooking/provider/home_filter_provider.dart';
import 'package:app_cooking/router/app_router.dart';
import 'package:app_cooking/theme/app_theme.dart';
import 'package:app_cooking/widget/main_food_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../services/authentication.dart';
import '../widget/filter_item.dart';
import '../widget/home_post.dart';
import '../widget/search_Text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * .1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello ${Authentication.userFromFirebase(FirebaseAuth.instance.currentUser)!.displayName}",
                      style: AppTheme.largeBold(color: Colors.black),
                    ),
                    const SizedBox(),
                    Text(
                      "What are you cooking today?",
                      style: AppTheme.smallerRegular(color: AppTheme.gray3),
                    )
                  ],
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: AppTheme.secondary40,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("assets/util/profile.png"),
                          fit: BoxFit.cover)),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SEARCHSECTION
                SearchTextField(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.search);
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: 50,
                  color: AppTheme.primary100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: Center(
                    child: SvgPicture.asset("assets/icons/setting.svg"),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 25),
          // FILTERITEM
          SizedBox(
            height: 31,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 30,
                ),
                for (String element in Data.listFilter1)
                  Consumer<HomeFilterState>(
                      builder: (context, homeFilterStae, widget) {
                    String currentTitle = homeFilterStae.currentTitle;
                    return CustomContainer(
                      onTap: () {
                        Provider.of<HomeFilterState>(context, listen: false)
                            .changeTitle(element);
                      },
                      title: element,
                      isSelected: currentTitle == element,
                    );
                  }),
                // FilterItem(title: element),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // FODCARD SECTION
          SizedBox(
            height: 231,
            child: FutureBuilder(
                future: Data.getListFoodHome(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primary100,
                      ),
                    );
                  if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      for (Map<String, dynamic> item in snapshot.data!)
                        MainFoodCard(
                          title: item['title'],
                          image: item['image'],
                          time: item['time'],
                          rating: item['rating'].toDouble(),
                        ),
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  );
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20, bottom: 5),
            child: Text(
              "New Recipe",
              style: AppTheme.normalBold(color: Colors.black),
            ),
          ),

          SizedBox(
            height: 127,
            child: FutureBuilder(
                future: Data.getListHomePost(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primary100,
                      ),
                    );
                  if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  return ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        for (Map<String, dynamic> item in snapshot.data!)
                          HomePost(
                            title: item['title'],
                            postImage: item['postImage'],
                            author: item['author'],
                            profileImage: item['profileImage'],
                            time: item['time'],
                            rating: item['rating'],
                          )
                      ]);
                }),
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
