class GetEmployeesResponse {
  GetEmployeesResponse({
    this.message,
    this.count,
    this.data,
  });

  GetEmployeesResponse.fromJson(dynamic json) {
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  String? message;
  int? count;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.firstname,
    this.lastName,
    this.role,
    this.salary,
    this.requiredWorkingDaysInMonth,
    this.actualWorkingDaysInMonth,
    this.actualSalary,
    this.overLimit,
    this.extraLeadershipBonus,
    this.extraPersonalBonus,
    this.extraExperienceBonus,
    this.travelExpences,
    this.monthlyNutrition,
    this.totalSalary,
    this.tax,
    this.salaryAfterTaxes,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    firstname = json['firstname'];
    lastName = json['lastName'];
    role = json['role'];
    salary = json['salary'];
    requiredWorkingDaysInMonth = json['requiredWorkingDaysInMonth'];
    actualWorkingDaysInMonth = json['actualWorkingDaysInMonth'];
    actualSalary = json['actualSalary'];
    overLimit = json['overLimit'];
    extraLeadershipBonus = json['extraLeadershipBonus'];
    extraPersonalBonus = json['extraPersonalBonus'];
    extraExperienceBonus = json['extraExperienceBonus'];
    travelExpences = json['travelExpences'];
    monthlyNutrition = json['monthlyNutrition'];
    totalSalary = json['totalSalary'];
    tax = json['tax'];
    salaryAfterTaxes = json['salaryAfterTaxes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? firstname;
  String? lastName;
  String? role;
  int? salary;
  int? requiredWorkingDaysInMonth;
  int? actualWorkingDaysInMonth;
  double? actualSalary;
  double? overLimit;
  double? extraLeadershipBonus;
  double? extraPersonalBonus;
  double? extraExperienceBonus;
  double? travelExpences;
  double? monthlyNutrition;
  double? totalSalary;
  double? tax;
  double? salaryAfterTaxes;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['firstname'] = firstname;
    map['lastName'] = lastName;
    map['role'] = role;
    map['salary'] = salary;
    map['requiredWorkingDaysInMonth'] = requiredWorkingDaysInMonth;
    map['actualWorkingDaysInMonth'] = actualWorkingDaysInMonth;
    map['actualSalary'] = actualSalary;
    map['overLimit'] = overLimit;
    map['extraLeadershipBonus'] = extraLeadershipBonus;
    map['extraPersonalBonus'] = extraPersonalBonus;
    map['extraExperienceBonus'] = extraExperienceBonus;
    map['travelExpences'] = travelExpences;
    map['monthlyNutrition'] = monthlyNutrition;
    map['totalSalary'] = totalSalary;
    map['tax'] = tax;
    map['salaryAfterTaxes'] = salaryAfterTaxes;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
