


import 'package:flutter/material.dart';
import 'package:smart_lifters/src/core/constants/numbers.dart';

class ScreenAccount extends StatefulWidget {
  const ScreenAccount({super.key});

  @override
  State<ScreenAccount> createState() => _ScreenAccountState();
}

class _ScreenAccountState extends State<ScreenAccount> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          child: Column(
            children: [
              topPart(context),
              infoPart(context),
            ],
          ),
        ),
          bottomPart(context)
      ],),
    );
  }

  Padding bottomPart(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: Container(
          transform: Matrix4.translationValues(0, -50, 0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.secondary
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      const Column(children: [Text("75 KG", style: TextStyle(fontWeight: FontWeight.bold)), Text("Weight")]),
                      VerticalDivider(color: Colors.white),
                      Flexible(flex: 3, child: const Column(children: [Text("28", style: TextStyle(fontWeight: FontWeight.bold)), Text("Years Old")])),
                      VerticalDivider(color: Colors.white),
                      const Column(children: [Text("1.63 CM", style: TextStyle(fontWeight: FontWeight.bold)), Text("Height")]),
                      ],  
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              optionButton(context, "Profile", "account_black"),
              optionButton(context, "Favorites", "star_black"),
              optionButton(context, "Privacy Policy", "lock_black"),
              optionButton(context, "Settings", "settings_black"),
              optionButton(context, "Help", "support_black"),
              optionButton(context, "Logout", "logout_black"),
            ],
          ),
        ),
      );
  }

  Padding optionButton(BuildContext context, String content, String icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).colorScheme.secondary),
                        child: Image.asset('assets/icons/$icon.png', scale: 2,),
                      ),
                      const SizedBox(width: 20,),
                      Text(content, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20
                      ))
                    ],
                  ),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right, color: Theme.of(context).colorScheme.secondary,), )
        ],
      ),
    );
  }

  Padding infoPart(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(
                  right: Constants.padding, left: Constants.padding, bottom: Constants.padding),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset('assets/images/account_image.png', alignment: Alignment.center, width: 150, height: 150, fit: BoxFit.cover,)),
                  Text("The Reel Galunga", style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700
                  ),),
                  const Text("Reeling.one@gmail.com"),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(text: 'Birthday: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'June 16th')
                      ]
                    ),
                  )
              ],
            ),
          );
  }

  Padding topPart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_left_outlined)),
                  Text("My Profile",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )),
                ],
              ),
    );
  }
}