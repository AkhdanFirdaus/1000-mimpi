import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/core/themes/app_color.dart';
import 'package:seribu_mimpi/features/creator/controllers/creator_controller.dart';
import 'package:seribu_mimpi/features/event/index.dart';
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

class HomeEventCreatorWidget extends HookConsumerWidget {
  const HomeEventCreatorWidget({
    Key? key,
    required this.heightContainer,
    required this.widthItems,
  }) : super(key: key);

  final double heightContainer;
  final double widthItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creators = ref.watch(creatorFutureProvider);
    AutoRouter.of(context);
    return Container(
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
            child: creators.when(
              data: (data) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(24),
                  itemCount: data.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 24),
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return SizedBox(
                      width: widthItems,
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            getIt<AppRouter>().pushNamed('creator/${item.id}');
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: AppColor.pink,
                                ),
                              ),
                              ListTile(
                                title: Text(item.name),
                                subtitle: Text(item.email),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, s) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeEventWidget extends HookConsumerWidget {
  const HomeEventWidget({
    Key? key,
    required this.heightContainer,
    required this.widthItems,
  }) : super(key: key);

  final double heightContainer;
  final double widthItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventFutureProvider);
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
            child: events.when(
              data: (data) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 24),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: widthItems,
                      child: HomeEventCardWidget(
                        event: data[index],
                      ),
                    );
                  },
                );
              },
              error: (error, s) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
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
