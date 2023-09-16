import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/components/custom_text_field.dart';
import 'package:web_devop/components/utils/utils.dart';
import 'package:web_devop/src/home/bloc/home_bloc.dart';
import 'package:web_devop/src/home/presentation/mixin/home_mixin.dart';
import 'package:web_devop/src/home/presentation/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.token,
  }) : super(key: key);

  final String token;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state.createSalaryStatus.isSuccess) {
          scaffoldKey.currentState?.closeDrawer();
          context.read<HomeBloc>().add(GetEmployeesEvent(token: widget.token));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Salary created successfully',
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Salary table"),
            elevation: 2,
            leading: IconButton(
              onPressed: () async {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          ),
          drawer: HomeDrawer(
            onTap: () {
              context
                  .read<HomeBloc>()
                  .add(GetEmployeesEvent(token: widget.token));
            },
          ),
          body: state.getEmployeesStatus.isLoading
              ? const Center(child: CupertinoActivityIndicator())
              : RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<HomeBloc>()
                        .add(GetEmployeesEvent(token: widget.token));
                  },
                  child: Padding(
                    padding: AppUtils.kPaddingAll16,
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount:
                                state.getEmployeesResponse?.data?.length ?? 0,
                            (_, index) => Text(state.getEmployeesResponse
                                    ?.data?[index].firstname ??
                                ''),
                          ),
                        ),
                        // SliverToBoxAdapter(
                        //   child: Ink(
                        //     child: ListView.separated(
                        //       itemCount: state.getEmployeesResponse?.data?.length ?? 0,
                        //       itemBuilder: (_, index) => Row(
                        //         children: [
                        //           Expanded(
                        //             child: Text(
                        //               'Item $index',
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       separatorBuilder: (_, index) =>
                        //           const VerticalDivider(),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
