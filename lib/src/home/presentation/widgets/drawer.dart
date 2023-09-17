import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/components/custom_text_field.dart';
import 'package:web_devop/components/utils/utils.dart';
import 'package:web_devop/src/home/bloc/home_bloc.dart';
import 'package:web_devop/src/home/presentation/mixin/drawer_mixin.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> with DrawerMixin {
  bool isRequired = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.createSalaryStatus.isSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(),
                child: Text('Gm Motors Ltd'),
              ),
              ListTile(
                title: const Text('Add Item +'),
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (__) {
                      return AlertDialog(
                        titleTextStyle: const TextStyle(fontSize: 18),
                        title: const Text(
                          'Add Employee',
                          textAlign: TextAlign.center,
                        ),
                        content: Ink(
                          width: 500,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Имя',
                                      onChanged: (_) {},
                                      controller: firstname,
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Фамилия',
                                      onChanged: (_) {},
                                      controller: lastName,
                                    ),
                                  ),
                                ],
                              ),
                              AppUtils.kGap12,
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Должность',
                                      onChanged: (_) {},
                                      controller: role,
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Зарплата',
                                      onChanged: (_) {},
                                      controller: salary,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AppUtils.kGap12,
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Рабочие дни',
                                      onChanged: (_) {},
                                      controller: requiredWorkingDaysInMonth,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Реалные рабочие дни',
                                      onChanged: (_) {},
                                      controller: actualWorkingDaysInMonth,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AppUtils.kGap12,
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Бонус за руководство',
                                      onChanged: (_) {},
                                      controller: extraLeadershipBonus,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Персональный Бонус',
                                      onChanged: (_) {},
                                      controller: extraPersonalBonus,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AppUtils.kGap12,
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Выслуги лет',
                                      onChanged: (_) {},
                                      controller: extraExperienceBonus,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Проездные',
                                      onChanged: (_) {},
                                      controller: travelExpenses,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  Expanded(
                                    child: CustomTextField(
                                      titleText: 'Питание',
                                      onChanged: (_) {},
                                      controller: monthlyNutrition,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AppUtils.kGap16,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Visibility(
                                    visible: state.isRequired,
                                    child: const Text(
                                      'Cancel',
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.read<HomeBloc>().add(const DrawerControlEvent(drawerStatus: DrawerStatus.isClose));
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cancel',
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  ElevatedButton(
                                    onPressed: () {
                                      if (validate() == true) {
                                        context.read<HomeBloc>().add(
                                              CreateSalaryEvent(
                                                firstname: firstname.text,
                                                lastname: lastName.text,
                                                role: role.text,
                                                salary:
                                                    int.tryParse(salary.text) ??
                                                        0,
                                                requiredWorkingDaysInMonth:
                                                    int.tryParse(
                                                            requiredWorkingDaysInMonth
                                                                .text) ??
                                                        0,
                                                actualWorkingDaysInMonth:
                                                    int.tryParse(
                                                            actualWorkingDaysInMonth
                                                                .text) ??
                                                        0,
                                                extraLeadershipBonus:
                                                    int.tryParse(
                                                            extraLeadershipBonus
                                                                .text) ??
                                                        0,
                                                extraPersonalBonus:
                                                    int.tryParse(
                                                            extraPersonalBonus
                                                                .text) ??
                                                        0,
                                                extraExperienceBonus:
                                                    int.tryParse(
                                                            extraExperienceBonus
                                                                .text) ??
                                                        0,
                                                travelExpenses: int.tryParse(
                                                        travelExpenses.text) ??
                                                    0,
                                                monthlyNutrition: int.tryParse(
                                                        monthlyNutrition
                                                            .text) ??
                                                    0,
                                              ),
                                            );
                                      } else {
                                        context
                                            .read<HomeBloc>()
                                            .add(RequiredDetectEvent());
                                      }
                                    },
                                    child: const Text(
                                      'Add',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              // ListTile(
              //   title: const Text('Item 2'),
              //   onTap: () {},
              // ),
            ],
          ),
        );
      },
    );
  }

  bool validate() {
    if (firstname.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        role.text.isNotEmpty &&
        salary.text.isNotEmpty &&
        requiredWorkingDaysInMonth.text.isNotEmpty &&
        actualWorkingDaysInMonth.text.isNotEmpty &&
        extraLeadershipBonus.text.isNotEmpty &&
        extraPersonalBonus.text.isNotEmpty &&
        extraExperienceBonus.text.isNotEmpty &&
        travelExpenses.text.isNotEmpty &&
        monthlyNutrition.text.isNotEmpty) {
      return true;
    }
    return false;
  }
}
