class SalaryCreateRequestModel {
  SalaryCreateRequestModel({
      this.firstname, 
      this.lastName, 
      this.role, 
      this.salary, 
      this.requiredWorkingDaysInMonth, 
      this.actualWorkingDaysInMonth, 
      this.extraLeadershipBonus, 
      this.extraPersonalBonus, 
      this.extraExperienceBonus, 
      this.travelExpences, 
      this.monthlyNutrition,});

  SalaryCreateRequestModel.fromJson(dynamic json) {
    firstname = json['firstname'];
    lastName = json['lastName'];
    role = json['role'];
    salary = json['salary'];
    requiredWorkingDaysInMonth = json['requiredWorkingDaysInMonth'];
    actualWorkingDaysInMonth = json['actualWorkingDaysInMonth'];
    extraLeadershipBonus = json['extraLeadershipBonus'];
    extraPersonalBonus = json['extraPersonalBonus'];
    extraExperienceBonus = json['extraExperienceBonus'];
    travelExpences = json['travelExpences'];
    monthlyNutrition = json['monthlyNutrition'];
  }
  String? firstname;
  String? lastName;
  String? role;
  int? salary;
  int? requiredWorkingDaysInMonth;
  int? actualWorkingDaysInMonth;
  int? extraLeadershipBonus;
  int? extraPersonalBonus;
  int? extraExperienceBonus;
  int? travelExpences;
  int? monthlyNutrition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = firstname;
    map['lastName'] = lastName;
    map['role'] = role;
    map['salary'] = salary;
    map['requiredWorkingDaysInMonth'] = requiredWorkingDaysInMonth;
    map['actualWorkingDaysInMonth'] = actualWorkingDaysInMonth;
    map['extraLeadershipBonus'] = extraLeadershipBonus;
    map['extraPersonalBonus'] = extraPersonalBonus;
    map['extraExperienceBonus'] = extraExperienceBonus;
    map['travelExpences'] = travelExpences;
    map['monthlyNutrition'] = monthlyNutrition;
    return map;
  }

}