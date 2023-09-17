import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        if (state.createSalaryStatus.isSuccess) {
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
        if (state.deleteSalaryStatus.isSuccess) {
          context.read<HomeBloc>().add(GetEmployeesEvent(token: widget.token));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Salary deleted successfully',
              ),
            ),
          );
        } else if (state.deleteSalaryStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Salary not deleted try again',
              ),
            ),
          );
        }
        if (state.drawerStatus.isClose) {
          scaffoldKey.currentState?.closeDrawer();
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
                    padding: AppUtils.kPaddingHorizontal16,
                    child: (state.getEmployeesResponse?.data ?? []).isEmpty
                        ? const Center(
                            child: Text('Salary not found'),
                          )
                        : CustomScrollView(
                            slivers: [
                              const SliverToBoxAdapter(
                                child: AppUtils.kGap16,
                              ),
                              const SliverToBoxAdapter(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Colors.grey),
                                      right: BorderSide(color: Colors.grey),
                                      top: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Text(
                                            'Ф.И.О.',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            'Должность',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            'Зарплата',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            'Рабочие дни',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            'Реалные рабочие дни',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            'Бонус за руководство',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            'Персональный Бонус',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            'Выслуги лет',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            'Проездные',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            'Питание',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount: state
                                          .getEmployeesResponse?.data?.length ??
                                      0,
                                  (_, index) => GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text(
                                            '${state.getEmployeesResponse?.data?[index].firstname ?? ''} ${state.getEmployeesResponse?.data?[index].lastName ?? ''}',
                                            textAlign: TextAlign.center,
                                          ),
                                          titleTextStyle:
                                              const TextStyle(fontSize: 18),
                                          content: Ink(
                                            height: 300,
                                            width: 500,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Ф.И.О.',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ), //
                                                    Expanded(
                                                      child: Text(
                                                        'Должность',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Зарплата',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        'Рабочие дни',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        'Реалные рабочие дни',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        'Бонус за руководство',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        'Персональный Бонус',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        'Выслуги лет',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        'Проездные',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        'Питание',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        '${state.getEmployeesResponse?.data?[index].firstname ?? ''} ${state.getEmployeesResponse?.data?[index].lastName ?? ''}',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        state
                                                                .getEmployeesResponse
                                                                ?.data?[index]
                                                                .role ??
                                                            '',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        state
                                                                .getEmployeesResponse
                                                                ?.data?[index]
                                                                .salary
                                                                .toString() ??
                                                            '',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        '${state.getEmployeesResponse?.data?[index].requiredWorkingDaysInMonth}',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        '${state.getEmployeesResponse?.data?[index].actualWorkingDaysInMonth}',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        '${state.getEmployeesResponse?.data?[index].extraLeadershipBonus}',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        '${state.getEmployeesResponse?.data?[index].extraPersonalBonus}',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        '${state.getEmployeesResponse?.data?[index].extraExperienceBonus}',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        '${state.getEmployeesResponse?.data?[index].travelExpences}',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    AppUtils.kDivider,
                                                    Expanded(
                                                      child: Text(
                                                        '${state.getEmployeesResponse?.data?[index].monthlyNutrition}',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Cancel',
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                context.read<HomeBloc>().add(
                                                    DeleteSalaryEvent(
                                                        id: state
                                                                .getEmployeesResponse
                                                                ?.data?[index]
                                                                .id ??
                                                            ''));
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Delete',
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: (index ==
                                                  (state.getEmployeesResponse
                                                              ?.data?.length ??
                                                          0) -
                                                      1)
                                              ? const BorderSide(
                                                  color: Colors.grey,
                                                )
                                              : BorderSide.none,
                                          left: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                          right: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                          top: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                '${state.getEmployeesResponse?.data?[index].firstname ?? ''} ${state.getEmployeesResponse?.data?[index].lastName ?? ''}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                state.getEmployeesResponse
                                                        ?.data?[index].role ??
                                                    '',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                state.getEmployeesResponse
                                                        ?.data?[index].salary
                                                        .toString() ??
                                                    '',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                '${state.getEmployeesResponse?.data?[index].requiredWorkingDaysInMonth}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                '${state.getEmployeesResponse?.data?[index].actualWorkingDaysInMonth}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                '${state.getEmployeesResponse?.data?[index].extraLeadershipBonus}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                '${state.getEmployeesResponse?.data?[index].extraPersonalBonus}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                '${state.getEmployeesResponse?.data?[index].extraExperienceBonus}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                '${state.getEmployeesResponse?.data?[index].travelExpences}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const VerticalDivider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                '${state.getEmployeesResponse?.data?[index].monthlyNutrition}',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SliverToBoxAdapter(
                                child: AppUtils.kGap16,
                              ),
                            ],
                          ),
                  ),
                ),
        );
      },
    );
  }
}
