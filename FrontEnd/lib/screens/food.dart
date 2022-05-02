import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:food_recpie_app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        controller: controller,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
                child: Container(
                  color: formText,
                  height: 10,
                ),
                preferredSize: const Size.fromHeight(10.0)),
            collapsedHeight: 90,
            flexibleSpace: const _MyAppSpace(),
            pinned: true,
            expandedHeight: 39.h,
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.white,
                // child: const FoodItemCard(),
              );
            }, childCount: 6),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.6),
          )
        ],
      ),
    );
  }
}

class _MyAppSpace extends StatelessWidget {
  const _MyAppSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        final deltaExtent = settings!.maxExtent - settings.minExtent;
        final t =
            (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
                .clamp(0.0, 1.0);
        final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
        const fadeEnd = 1.0;
        final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);

        return Stack(
          children: [
            Center(
              child: Opacity(
                opacity: 1 - opacity,
                child: Container(
                  padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 0.h),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      const ImageIcon(
                        AssetImage('assets/icons/back.png'),
                        color: mainText,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(2.w, 1.h, 1.w, 1.h),
                        height: 7.h,
                        width: 7.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/f3.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Food',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'InterBold',
                          fontSize: 13.sp,
                          color: mainText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: opacity,
              child: FlexibleSpaceBar(
                background: Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(5.5.w, 7.h, 3.w, 0),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const ImageIcon(
                                  AssetImage('assets/icons/back.png'),
                                  color: mainText,
                                ),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(right: 7.w),
                                  child: Text(
                                    'Food',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'InterBold',
                                      fontSize: 17.sp,
                                      color: mainText,
                                    ),
                                  ),
                                )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3.h),
                              width: 23.h,
                              height: 23.h,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/f3.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
