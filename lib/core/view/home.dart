import 'package:flutter/material.dart';
import 'package:listview/core/provider/provider.dart';
import 'package:provider/provider.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<MemesProvider>().getMemsList();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mProvider = Provider.of<MemesProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: mProvider.memes?.data?.memes?.length ?? 0,
          itemBuilder: (context, index) {
            final mems = mProvider.memes?.data?.memes?[index];
            return Card(
              child: Column(
                children: [
                  Image.network(mems?.url ?? ""),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(mems?.name ?? ""),
                      Text(mems?.id ?? ""),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
