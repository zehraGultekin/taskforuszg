import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskforuszehra/core/widgets/appbar.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Görev Talebi Oluştur",
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                final city = await showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                  builder: (context) {
                    List<String> city = ["Adana", "Hatay", "Mersin"];

                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(city[index][0]),
                            backgroundColor: Colors.black,
                          ),
                          title: Text(city[index]),
                          onTap: () {
                            context.pop(city[index]);
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(thickness: 1),
                      itemCount: city.length,
                    );
                  },
                );
                if (city != null) {
                  setState(() {
                    selectedCity = city;
                  });
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    selectedCity ?? "Şehir Seçiniz",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
