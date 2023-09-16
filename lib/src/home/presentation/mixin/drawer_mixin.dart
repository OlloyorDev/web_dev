import 'package:flutter/material.dart';
import 'package:web_devop/src/home/presentation/widgets/drawer.dart';

mixin DrawerMixin on State<HomeDrawer> {
  late TextEditingController firstname  = TextEditingController();
  late TextEditingController lastName = TextEditingController();
  late TextEditingController role = TextEditingController();
  late TextEditingController salary = TextEditingController();
  late TextEditingController requiredWorkingDaysInMonth = TextEditingController();
  late TextEditingController actualWorkingDaysInMonth = TextEditingController();
  late TextEditingController extraLeadershipBonus = TextEditingController();
  late TextEditingController extraPersonalBonus = TextEditingController();
  late TextEditingController extraExperienceBonus = TextEditingController();
  late TextEditingController travelExpenses = TextEditingController();
  late TextEditingController monthlyNutrition = TextEditingController();

  @override
  void initState() {
    firstname = TextEditingController();
    lastName = TextEditingController();
    role = TextEditingController();
    salary = TextEditingController();
    requiredWorkingDaysInMonth = TextEditingController();
    actualWorkingDaysInMonth = TextEditingController();
    extraLeadershipBonus = TextEditingController();
    extraPersonalBonus = TextEditingController();
    extraExperienceBonus = TextEditingController();
    travelExpenses = TextEditingController();
    monthlyNutrition = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastName.dispose();
    role.dispose();
    salary.dispose();
    requiredWorkingDaysInMonth.dispose();
    actualWorkingDaysInMonth.dispose();
    extraLeadershipBonus.dispose();
    extraPersonalBonus.dispose();
    extraExperienceBonus.dispose();
    travelExpenses.dispose();
    monthlyNutrition.dispose();
    super.dispose();
  }
}
