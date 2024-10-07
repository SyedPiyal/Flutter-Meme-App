import 'package:flutter/material.dart';
import 'package:listview/core/provider/memes_provider.dart';
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
        context.read<MemesProvider>().getMemesList();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final memesProvider = Provider.of<MemesProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: memesProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: memesProvider.memes?.data?.memes?.length ?? 0,
              itemBuilder: (context, index) {
                final memes = memesProvider.memes?.data?.memes?[index];
                return Card(
                  child: Column(
                    children: [
                      Image.network(memes?.url ?? ""),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(memes?.name ?? ""),
                          Text(memes?.id ?? ""),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
