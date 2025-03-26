import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pit01gp04/src/features/dream/controller/cubit/dream/dream_cubit.dart';
import 'package:pit01gp04/src/features/dream/model/dream_model.dart';
import 'package:pit01gp04/src/features/dream/widget/custom_list_item.dart';
import 'package:pit01gp04/src/theme/app_colors.dart';

class DreamsPage extends StatelessWidget {
  static const String routeName = '/dreams';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const DreamsPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const DreamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DreamCubit, DreamState>(
        builder: (context, state) {
          if (state is DreamLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DreamError) {
            return Text(state.failure.message);
          } else if (state is DreamLoaded) {
            final dreamList = state.dreamList;
            return dreamList.isEmpty
                ? const Center(child: Text('Sem sonhos Cadastrados'))
                : ListView.builder(
                    itemCount: dreamList.length,
                    itemBuilder: (context, index) {
                      final Dream singleDream = dreamList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            child: CustomListItem(
                                checkbox: Checkbox(
                                  value: singleDream.completed,
                                  onChanged: (bool? value) {},
                                ),
                                title: singleDream.title,
                                date:
                                    '${singleDream.dueDate.day.toString()}/${singleDream.dueDate.month.toString()}/${singleDream.dueDate.year.toString()}',
                                price: singleDream.price)),
                      );
                    },
                  );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors().primarySwatch.shade500,
        child: Icon(
          Icons.add,
          color: AppColors().primarySwatch.shade50,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/dreams/add');
        },
      ),
    );
  }
}
