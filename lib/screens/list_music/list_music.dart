import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/model/music_model.dart';
import 'package:music_app/screens/player_screen/components/button_and_icon.dart';

class ListMusicScreen extends StatefulWidget {
  const ListMusicScreen({super.key, required this.selectedIndex});

  final int selectedIndex;
  @override
  State<ListMusicScreen> createState() => _ListMusicScreenState();
}

class _ListMusicScreenState extends State<ListMusicScreen>
    with SingleTickerProviderStateMixin {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _currentItemPlaying = 0;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
        child: Column(
          children: [
            SizedBox(
              height: _size.height * 0.01,
            ),
            Text(
              "Flume . Kai".toUpperCase(),
              style: const TextStyle(
                  color: AppColor.secondaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: _size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonAndIcon(
                  size: 50,
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColor.bgDark,
                  ),
                  onPressed: () {
                    Navigator.pop(context, _selectedIndex);
                  },
                ),
                ButtonAndIcon(
                  size: 150,
                  imageUrl: musicList[_selectedIndex].imageUrl,
                  distance: 20,
                ),
                ButtonAndIcon(
                  size: 50,
                  child: Icon(
                    Icons.favorite,
                    color: AppColor.bgDark,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: _size.height * 0.05,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: musicList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2,
                              vertical: kDefaultPadding / 4),
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding,
                              vertical: kDefaultPadding / 2),
                          decoration: _selectedIndex == index
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.secondaryTextColor
                                      .withOpacity(0.3))
                              : null,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      musicList[index].name,
                                      style: const TextStyle(
                                          color: AppColor.primaryTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      musicList[_currentItemPlaying].artist,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColor.secondaryTextColor,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                _selectedIndex == index
                                    ? ButtonAndIcon(
                                        size: 50,
                                        colors: [
                                          AppColor.blueTopDark,
                                          AppColor.blue
                                        ],
                                        child: Icon(
                                          Icons.pause,
                                          color: AppColor.bgDark,
                                        ),
                                      )
                                    : ButtonAndIcon(
                                        size: 50,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: AppColor.bgDark,
                                        ),
                                      )
                              ]),
                        ),
                      );
                    }))
          ],
        ),
      )),
    );
  }
}
