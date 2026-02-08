import 'package:equatable/equatable.dart';
import 'package:web_devop/common/extension/build_context_extension.dart';
import 'package:web_devop/config/router/app_router.dart';

class HomeModel extends Equatable {
  final AboutMe? aboutMe;
  final Experience? experience;
  final List<Projects>? projects;
  final List<Contact>? contacts;

  const HomeModel({
    this.aboutMe,
    this.experience,
    this.projects,
    this.contacts,
  });

  @override
  List<Object?> get props => [aboutMe, experience, projects, contacts];
}

class AboutMe extends Equatable {
  final String? image;
  final UniversalLabel? name;
  final UniversalLabel? title;
  final UniversalLabel? description;

  const AboutMe({
    this.image,
    this.name,
    this.title,
    this.description,
  });

  factory AboutMe.fromJson(Map<String, dynamic> json) {
    return AboutMe(
      image: json['image'] as String?,
      name: json['name'] != null
          ? UniversalLabel.fromJson(json['name'] as Map<String, dynamic>)
          : null,
      title: json['title'] != null
          ? UniversalLabel.fromJson(json['title'] as Map<String, dynamic>)
          : null,
      description: json['description'] != null
          ? UniversalLabel.fromJson(json['description'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [image, title, description];
}

class Experience extends Equatable {
  final String? companyName;
  final String? companyImage;
  final UniversalLabel? title;
  final UniversalLabel? description;
  final String? date;

  const Experience({
    this.companyName,
    this.companyImage,
    this.title,
    this.description,
    this.date,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      companyName: json['company_name'] as String?,
      companyImage: json['company_image'] as String?,
      title: json['title'] != null
          ? UniversalLabel.fromJson(json['title'] as Map<String, dynamic>)
          : null,
      description: json['description'] != null
          ? UniversalLabel.fromJson(json['description'] as Map<String, dynamic>)
          : null,
      date: json['date'] as String?,
    );
  }

  @override
  List<Object?> get props =>
      [companyName, companyImage, title, description, date];
}

class Projects extends Equatable {
  final String? image;
  final UniversalLabel? title;
  final UniversalLabel? description;
  final String? duration;
  final String? iosLink;
  final String? androidLink;

  const Projects({
    this.image,
    this.title,
    this.description,
    this.duration,
    this.iosLink,
    this.androidLink,
  });

  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
      image: json['image'] as String?,
      title: json['title'] != null
          ? UniversalLabel.fromJson(json['title'] as Map<String, dynamic>)
          : null,
      description: json['description'] != null
          ? UniversalLabel.fromJson(json['description'] as Map<String, dynamic>)
          : null,
      duration: json['duration'] as String?,
      iosLink: json['ios_link'] as String?,
      androidLink: json['android_link'] as String?,
    );
  }

  @override
  List<Object?> get props =>
      [image, title, description, duration, iosLink, androidLink];
}

class Contact extends Equatable {
  final String? link;
  final String? icon;
  final String? title;

  const Contact({
    this.link,
    this.icon,
    this.title,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      link: json['link'] as String?,
      icon: json['icon'] as String?,
      title: json['title'] as String?,
    );
  }

  @override
  List<Object?> get props => [link, icon, title];
}

class UniversalLabel extends Equatable {
  final String? uz;
  final String? ru;
  final String? en;

  const UniversalLabel({
    this.uz,
    this.ru,
    this.en,
  });

  factory UniversalLabel.fromJson(Map<String, dynamic> json) {
    return UniversalLabel(
      uz: json['uz'] as String?,
      ru: json['ru'] as String?,
      en: json['en'] as String?,
    );
  }

  @override
  List<Object?> get props => [uz, ru, en];
}

extension UniversalLabelExtension on UniversalLabel {
  String get text {
    switch (rootKey.currentContext?.kLocale.languageCode) {
      case 'en':
        return en ?? '';
      case 'ru':
        return ru ?? '';
      case 'uz':
        return uz ?? '';
      default:
        return en ?? '';
    }
  }
}
