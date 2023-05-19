import 'package:blood_bank/core/api_services.dart';
import 'package:flutter/material.dart';

import '../../core/color.dart';

class DonorListView extends StatefulWidget {
  const DonorListView({super.key});

  @override
  State<DonorListView> createState() => _DonorListViewState();
}

class _DonorListViewState extends State<DonorListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Donor List',
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: fetchDonor(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return CardItem(
                    category: data.category ?? '',
                    name: data.name ?? '',
                    date: data.date!.substring(0, 10),
                    gender: data.gender ?? '',
                  );
                },
                itemCount: snapshot.data!.length,
              );
            }
          },
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.name,
    required this.category,
    required this.date,
    required this.gender,
  });
  final String name;
  final String category;
  final String date;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(date,
                style: const TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.w600,
                    fontSize: 12)),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          height: 100,
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
          child: Column(
            children: [
              Row(children: [
                Text(name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(category.toString(),
                      style: const TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w600,
                          fontSize: 18)),
                ),
              ]),
              Row(children: [
                Text(gender,
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 13)),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
