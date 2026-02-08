import 'package:equatable/equatable.dart';

class ResumeModel extends Equatable {
  final PersonalInfo? personalInfo;
  final Skills? skills;
  final List<ExperienceItem> experience;
  final List<ProjectItem> projects;
  final List<Education> education;
  final List<Certification> certifications;
  final List<LanguageItem> languages;
  final List<String> achievements;
  final Availability? availability;

  const ResumeModel({
    this.personalInfo,
    this.skills,
    this.experience = const [],
    this.projects = const [],
    this.education = const [],
    this.certifications = const [],
    this.languages = const [],
    this.achievements = const [],
    this.availability,
  });

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      personalInfo: json['personal_info'] != null
          ? PersonalInfo.fromJson(json['personal_info'] as Map<String, dynamic>)
          : null,
      skills: json['skills'] != null
          ? Skills.fromJson(json['skills'] as Map<String, dynamic>)
          : null,
      experience: (json['experience'] as List<dynamic>?)
              ?.map((e) => ExperienceItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => ProjectItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      education: (json['education'] as List<dynamic>?)
              ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      certifications: (json['certifications'] as List<dynamic>?)
              ?.map((e) => Certification.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => LanguageItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      achievements: (json['achievements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      availability: json['availability'] != null
          ? Availability.fromJson(
              json['availability'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [
        personalInfo,
        skills,
        experience,
        projects,
        education,
        certifications,
        languages,
        achievements,
        availability,
      ];
}

class PersonalInfo extends Equatable {
  final String? fullName;
  final String? title;
  final String? summary;
  final String? avatar;
  final String? location;
  final String? email;
  final String? phone;
  final String? website;
  final String? github;
  final String? linkedin;

  const PersonalInfo({
    this.fullName,
    this.title,
    this.summary,
    this.avatar,
    this.location,
    this.email,
    this.phone,
    this.website,
    this.github,
    this.linkedin,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      fullName: json['full_name'] as String?,
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      avatar: json['avatar'] as String?,
      location: json['location'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      github: json['github'] as String?,
      linkedin: json['linkedin'] as String?,
    );
  }

  @override
  List<Object?> get props =>
      [fullName, title, summary, avatar, location, email, phone, website, github, linkedin];
}

class Skills extends Equatable {
  final List<String> primary;
  final List<String> secondary;
  final List<String> tools;

  const Skills({
    this.primary = const [],
    this.secondary = const [],
    this.tools = const [],
  });

  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      primary: _parseStringList(json['primary']),
      secondary: _parseStringList(json['secondary']),
      tools: _parseStringList(json['tools']),
    );
  }

  @override
  List<Object?> get props => [primary, secondary, tools];
}

class ExperienceItem extends Equatable {
  final String? company;
  final String? position;
  final String? employmentType;
  final String? startDate;
  final String? endDate;
  final bool isCurrent;
  final List<String> responsibilities;
  final List<String> technologies;

  const ExperienceItem({
    this.company,
    this.position,
    this.employmentType,
    this.startDate,
    this.endDate,
    this.isCurrent = false,
    this.responsibilities = const [],
    this.technologies = const [],
  });

  factory ExperienceItem.fromJson(Map<String, dynamic> json) {
    return ExperienceItem(
      company: json['company'] as String?,
      position: json['position'] as String?,
      employmentType: json['employment_type'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      isCurrent: json['is_current'] as bool? ?? false,
      responsibilities: _parseStringList(json['responsibilities']),
      technologies: _parseStringList(json['technologies']),
    );
  }

  String get dateRange {
    if (startDate == null) return '';
    final end = (endDate == null || endDate!.isEmpty) ? 'Present' : endDate!;
    return '$startDate — $end';
  }

  @override
  List<Object?> get props =>
      [company, position, employmentType, startDate, endDate, isCurrent, responsibilities, technologies];
}

class ProjectItem extends Equatable {
  final String? name;
  final String? description;
  final String? role;
  final String? startDate;
  final String? endDate;
  final List<String> technologies;
  final String? iosAppLink;
  final String? androidAppLink;

  const ProjectItem({
    this.name,
    this.description,
    this.role,
    this.startDate,
    this.endDate,
    this.technologies = const [],
    this.iosAppLink,
    this.androidAppLink,
  });

  factory ProjectItem.fromJson(Map<String, dynamic> json) {
    return ProjectItem(
      name: json['name'] as String?,
      description: json['description'] as String?,
      role: json['role'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      technologies: _parseStringList(json['technologies']),
      iosAppLink: json['ios_app_link'] as String?,
      androidAppLink: json['android_app_link'] as String?,
    );
  }

  String get dateRange {
    if (startDate == null) return '';
    final end = (endDate == null || endDate!.isEmpty) ? 'Present' : endDate!;
    return '$startDate — $end';
  }

  @override
  List<Object?> get props =>
      [name, description, role, startDate, endDate, technologies, iosAppLink, androidAppLink];
}

class Education extends Equatable {
  final String? institution;
  final String? degree;
  final String? fieldOfStudy;
  final String? startYear;
  final String? endYear;

  const Education({
    this.institution,
    this.degree,
    this.fieldOfStudy,
    this.startYear,
    this.endYear,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      institution: json['institution'] as String?,
      degree: json['degree'] as String?,
      fieldOfStudy: json['field_of_study'] as String?,
      startYear: json['start_year'] as String?,
      endYear: json['end_year'] as String?,
    );
  }

  @override
  List<Object?> get props => [institution, degree, fieldOfStudy, startYear, endYear];
}

class Certification extends Equatable {
  final String? name;
  final String? issuer;
  final String? year;

  const Certification({this.name, this.issuer, this.year});

  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      name: json['name'] as String?,
      issuer: json['issuer'] as String?,
      year: json['year'] as String?,
    );
  }

  @override
  List<Object?> get props => [name, issuer, year];
}

class LanguageItem extends Equatable {
  final String? name;
  final String? level;

  const LanguageItem({this.name, this.level});

  factory LanguageItem.fromJson(Map<String, dynamic> json) {
    return LanguageItem(
      name: json['name'] as String?,
      level: json['level'] as String?,
    );
  }

  @override
  List<Object?> get props => [name, level];
}

class Availability extends Equatable {
  final String? employment;
  final bool remote;
  final bool relocation;

  const Availability({
    this.employment,
    this.remote = false,
    this.relocation = false,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      employment: json['employment'] as String?,
      remote: json['remote'] as bool? ?? false,
      relocation: json['relocation'] as bool? ?? false,
    );
  }

  @override
  List<Object?> get props => [employment, remote, relocation];
}

List<String> _parseStringList(dynamic value) {
  if (value is List) return value.map((e) => e.toString()).toList();
  return [];
}
