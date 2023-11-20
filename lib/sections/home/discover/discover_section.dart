import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/cubits/app_cubit_states.dart';
import 'package:travellapp/cubits/app_cubits.dart';
import 'package:travellapp/models/emotions_model.dart';
import 'package:travellapp/models/inspirations_model.dart';
import 'package:travellapp/sections/home/discover/elements/emotions_items_list.dart';
import 'package:travellapp/sections/home/discover/elements/inspiration_items_list.dart';
import 'package:travellapp/sections/home/discover/elements/places_items_list.dart';
import 'package:travellapp/theme/colors.dart';
import 'package:travellapp/widgets/app_text.dart';

List<InspirationsModel> inspirations = [];
List<EmotionsModel> emotions = [];

void _getInitialData() {
  inspirations = InspirationsModel.getInspirations();
  emotions = EmotionsModel.getEmotions();
}

Column discoverSection(TabController tabController) {
    _getInitialData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: "Discover"),
        const SizedBox(height: 16),
        SizedBox(
          width: double.maxFinite,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              dividerHeight: 0,
              controller: tabController,
              labelColor: Colors.black,
              labelPadding: const EdgeInsets.only(right: 16, left: 0),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.transparent,
              // isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: const [
                Tab(text: "Places",),
                Tab(text: "Inspirations",),
                Tab(text: "Emotions",),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 300,
          width: double.maxFinite,
          child: TabBarView(
            controller: tabController,  
            children: [
              BlocBuilder<AppCubits, CubitStates>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    return placesItemsList(state.places);
                  }
                  return Container();
                },
              ),
              inspirationsItemsList(inspirations),
              emotionsItemsList(emotions),
            ],
          ),
        ),
      ]
    );
  }


  // ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  double radius;
  final Color color;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  double radius;
  final Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = offset + Offset(configuration.size!.width / 2 - radius / 2, configuration.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, paint);
  }
}