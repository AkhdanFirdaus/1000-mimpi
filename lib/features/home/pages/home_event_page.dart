import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/core/themes/app_color.dart';
import 'package:seribu_mimpi/features/home/widgets/home_event_card_widget.dart';

class HomeEventPage extends StatelessWidget {
  const HomeEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return RelativeBuilder(
      builder: (context, width, height, sy, sx) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: ListView(
              children: [
                HomeEventHeaderWidget(
                  height: sy(200),
                ),
                HomeEventWidget(
                  heightContainer: sy(260),
                  widthItems: sx(320),
                ),
                HomeEventCreatorWidget(
                  heightContainer: sy(200),
                  widthItems: sx(360),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomeEventCreatorWidget extends StatelessWidget {
  const HomeEventCreatorWidget({
    Key? key,
    required this.heightContainer,
    required this.widthItems,
  }) : super(key: key);

  final double heightContainer;
  final double widthItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: double.infinity,
      height: heightContainer,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Creator",
                  style: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                  onPressed: () {
                    getIt<AppRouter>().pushNamed('creator');
                  },
                  icon: const Icon(Icons.arrow_right_alt_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(24),
              itemCount: 4,
              separatorBuilder: (_, __) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  width: widthItems,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: AppColor.pink,
                        ),
                      ),
                      ListTile(
                        title: Text("Title $index"),
                        subtitle: Text("Subtitle $index"),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeEventWidget extends StatelessWidget {
  const HomeEventWidget({
    Key? key,
    required this.heightContainer,
    required this.widthItems,
  }) : super(key: key);

  final double heightContainer;
  final double widthItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: heightContainer,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imgs/2.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Event",
                  style: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                  onPressed: () {
                    getIt<AppRouter>().pushNamed('event');
                  },
                  icon: const Icon(Icons.arrow_right_alt_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (_, __) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: widthItems,
                  child: HomeEventCardWidget(
                    id: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeEventHeaderWidget extends StatelessWidget {
  const HomeEventHeaderWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            "Lokasi Asal",
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    color: AppColor.pink,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Text("24"),
                          ),
                          SizedBox(height: 10),
                          Text("Webinar"),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("30"),
                          const SizedBox(height: 10),
                          Text(
                            "Pembicara",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
