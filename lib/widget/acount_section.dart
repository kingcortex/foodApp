import 'package:app_cooking/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AcountSection extends StatelessWidget {
  const AcountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final listInfos = [
      {
        'libelle' : 'Recipe',
        'value': '12',
      },
      {
        'libelle' : 'Followers',
        'value': '2.5M',
      },
      {
        'libelle' : 'Following',
        'value': '259',
      }
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Container(
              height: 99,
              width: 99,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primary40
              ),
            ),
            const SizedBox(width: 3,),
            for(var element in listInfos)
              Column(
                children: [
                  Text(
                    (element['libelle'] as String),
                    style: AppTheme.smallRegular(color: AppTheme.gray3),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    (element['value'] as String),
                    style: AppTheme.largeBold(),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
          ],
        ),
        const SizedBox(height: 15,),
        Text(
          'Afuwape Abiodun',
          style: AppTheme.normalBold(),
        ),
        Text(
          'Chef',
          style: AppTheme.smallerRegular(color: AppTheme.gray3),
        ),
        const SizedBox(height: 10,),
        Text(
          '''Private Chef
Passionate about food and life 🥘🍲🍝🍱''',
          style: AppTheme.smallRegular(color: AppTheme.gray3),
        ),
        Text(
          'More...',
          style: AppTheme.smallRegular(color: AppTheme.primary100)
        )
      ],
    );
  }
}