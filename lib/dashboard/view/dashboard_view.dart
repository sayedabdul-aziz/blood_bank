import 'package:blood_bank/core/api_services.dart';
import 'package:blood_bank/core/color.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
  }

  bool gridfilter = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'lib/core/icon.png',
          width: 100,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text(
                  'Hello, Sayed',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 2,
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'All Blood',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        gridfilter = !gridfilter;
                      });
                    },
                    child: const Icon(Icons.grid_view_rounded))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: fetchDashboard(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return gridfilter
                      ? Expanded(
                          child: GridView.count(
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.5,
                            children: [
                              GridCardItem(
                                  categoryName: 'A+',
                                  categoryCount: data!.aPLus ?? 0),
                              GridCardItem(
                                  categoryName: 'A-',
                                  categoryCount: data.aMinus ?? 0),
                              GridCardItem(
                                  categoryName: 'B+',
                                  categoryCount: data.bPLus ?? 0),
                              GridCardItem(
                                  categoryName: 'B-',
                                  categoryCount: data.bMinus ?? 0),
                              GridCardItem(
                                  categoryName: 'AB+',
                                  categoryCount: data.abPLus ?? 0),
                              GridCardItem(
                                  categoryName: 'AB-',
                                  categoryCount: data.abMinus ?? 0),
                              GridCardItem(
                                  categoryName: 'O+',
                                  categoryCount: data.oPLus ?? 0),
                              GridCardItem(
                                  categoryName: 'O-',
                                  categoryCount: data.oMinus ?? 0),
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              CardItem(
                                  categoryName: 'A+',
                                  categoryCount: data!.aPLus ?? 0),
                              const SizedBox(
                                height: 10,
                              ),
                              CardItem(
                                  categoryName: 'A-',
                                  categoryCount: data.aMinus ?? 0),
                              const SizedBox(
                                height: 10,
                              ),
                              CardItem(
                                  categoryName: 'B+',
                                  categoryCount: data.bPLus ?? 0),
                              const SizedBox(
                                height: 10,
                              ),
                              CardItem(
                                  categoryName: 'B-',
                                  categoryCount: data.bMinus ?? 0),
                              const SizedBox(
                                height: 10,
                              ),
                              CardItem(
                                  categoryName: 'AB+',
                                  categoryCount: data.abPLus ?? 0),
                              const SizedBox(
                                height: 10,
                              ),
                              CardItem(
                                  categoryName: 'AB-',
                                  categoryCount: data.abMinus ?? 0),
                              const SizedBox(
                                height: 10,
                              ),
                              CardItem(
                                  categoryName: 'O+',
                                  categoryCount: data.oPLus ?? 0),
                              const SizedBox(
                                height: 10,
                              ),
                              CardItem(
                                  categoryName: 'O-',
                                  categoryCount: data.oMinus ?? 0),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.categoryName,
    required this.categoryCount,
  });
  final String categoryName;
  final int categoryCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
              colors: [
                ColorManager.primary.withOpacity(.5),
                Colors.redAccent.withOpacity(.6)
              ])),
      child: Row(children: [
        Text(categoryName,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18)),
        const Spacer(),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(categoryCount.toString(),
              style: const TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
        ),
      ]),
    );
  }
}

class GridCardItem extends StatelessWidget {
  const GridCardItem({
    super.key,
    required this.categoryName,
    required this.categoryCount,
  });
  final String categoryName;
  final int categoryCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
              colors: [
                ColorManager.primary.withOpacity(.5),
                Colors.redAccent
              ])),
      child: Row(children: [
        Text(categoryName,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18)),
        const Spacer(),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(categoryCount.toString(),
              style: const TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
        ),
      ]),
    );
  }
}
