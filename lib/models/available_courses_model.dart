class AvailableCoursesModel {
  String? type;
  List<Courses>? courses;
  String? message;

  AvailableCoursesModel({this.type, this.courses, this.message});

  AvailableCoursesModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
    message = json['message'];
  }

  get data => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Courses {
  CourseDetails? courseDetails;
  PackageDetails? packageDetails;
  int? likesCount;
  int? commentsCount;
  List<LikedUserImages>? likedUserImages;
  double? avgStars;
  bool? subscribed;
  int? batchid;
  List<EnrollmentList>? enrollmentList;

  Courses(
      {this.courseDetails,
      this.packageDetails,
      this.likesCount,
      this.commentsCount,
      this.likedUserImages,
      this.avgStars,
      this.subscribed,
      this.batchid,
      this.enrollmentList});

  Courses.fromJson(Map<String, dynamic> json) {
    courseDetails = json['course_details'] != null
        ? new CourseDetails.fromJson(json['course_details'])
        : null;
    packageDetails = json['package_details'] != null
        ? new PackageDetails.fromJson(json['package_details'])
        : null;
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    if (json['liked_user_images'] != null) {
      likedUserImages = <LikedUserImages>[];
      json['liked_user_images'].forEach((v) {
        likedUserImages!.add(new LikedUserImages.fromJson(v));
      });
    }
    avgStars = json['avg_stars'];
    subscribed = json['subscribed'];
    batchid = json['batchid'];
    if (json['enrollment_list'] != null) {
      enrollmentList = <EnrollmentList>[];
      json['enrollment_list'].forEach((v) {
        enrollmentList!.add(new EnrollmentList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courseDetails != null) {
      data['course_details'] = this.courseDetails!.toJson();
    }
    if (this.packageDetails != null) {
      data['package_details'] = this.packageDetails!.toJson();
    }
    data['likes_count'] = this.likesCount;
    data['comments_count'] = this.commentsCount;
    if (this.likedUserImages != null) {
      data['liked_user_images'] =
          this.likedUserImages!.map((v) => v.toJson()).toList();
    }
    data['avg_stars'] = this.avgStars;
    data['subscribed'] = this.subscribed;
    data['batchid'] = this.batchid;
    if (this.enrollmentList != null) {
      data['enrollment_list'] =
          this.enrollmentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseDetails {
  String? id;
  String? name;
  String? start;
  String? end;
  String? type;
  String? level;
  String? duration;
  String? durationType;
  String? image;
  String? price;
  String? discount;
  String? description;
  String? created;
  String? status;

  CourseDetails(
      {this.id,
      this.name,
      this.start,
      this.end,
      this.type,
      this.level,
      this.duration,
      this.durationType,
      this.image,
      this.price,
      this.discount,
      this.description,
      this.created,
      this.status});

  CourseDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    start = json['start'];
    end = json['end'];
    type = json['type'];
    level = json['level'];
    duration = json['duration'];
    durationType = json['duration_type'];
    image = json['image'];
    price = json['price'];
    discount = json['discount'];
    description = json['description'];
    created = json['created'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start'] = this.start;
    data['end'] = this.end;
    data['type'] = this.type;
    data['level'] = this.level;
    data['duration'] = this.duration;
    data['duration_type'] = this.durationType;
    data['image'] = this.image;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['created'] = this.created;
    data['status'] = this.status;
    return data;
  }
}

class PackageDetails {
  Package? package;
  List<Classes>? classes;
  List<Subjects>? subjects;
  List<Chapters>? chapters;

  PackageDetails({this.package, this.classes, this.subjects, this.chapters});

  PackageDetails.fromJson(Map<String, dynamic> json) {
    package =
        json['package'] != null ? new Package.fromJson(json['package']) : null;
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(new Chapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    if (this.chapters != null) {
      data['chapters'] = this.chapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Package {
  String? id;
  String? name;
  String? description;
  String? created;
  String? status;

  Package({this.id, this.name, this.description, this.created, this.status});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    created = json['created'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created'] = this.created;
    data['status'] = this.status;
    return data;
  }
}

class Classes {
  String? packageClassId;
  String? className;

  Classes({this.packageClassId, this.className});

  Classes.fromJson(Map<String, dynamic> json) {
    packageClassId = json['package_class_id'];
    className = json['class_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_class_id'] = this.packageClassId;
    data['class_name'] = this.className;
    return data;
  }
}

class Subjects {
  String? packageSubjectId;
  String? subjectName;

  Subjects({this.packageSubjectId, this.subjectName});

  Subjects.fromJson(Map<String, dynamic> json) {
    packageSubjectId = json['package_subject_id'];
    subjectName = json['subject_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_subject_id'] = this.packageSubjectId;
    data['subject_name'] = this.subjectName;
    return data;
  }
}

class Chapters {
  String? packageChapterId;
  String? chapterName;
  String? chapterId;

  Chapters({this.packageChapterId, this.chapterName, this.chapterId});

  Chapters.fromJson(Map<String, dynamic> json) {
    packageChapterId = json['package_chapter_id'];
    chapterName = json['chapter_name'];
    chapterId = json['chapter_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_chapter_id'] = this.packageChapterId;
    data['chapter_name'] = this.chapterName;
    data['chapter_id'] = this.chapterId;
    return data;
  }
}

class LikedUserImages {
  String? userimage;
  String? username;

  LikedUserImages({this.userimage, this.username});

  LikedUserImages.fromJson(Map<String, dynamic> json) {
    userimage = json['userimage'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userimage'] = this.userimage;
    data['username'] = this.username;
    return data;
  }
}

class EnrollmentList {
  String? id;
  String? batchid;
  String? userid;
  String? regnNumber;
  String? created;
  String? expiry;
  String? status;
  String? name;
  String? course;
  String? batchType;
  String? start;
  String? end;
  String? type;
  String? level;
  String? duration;
  String? durationType;
  String? image;
  String? price;
  String? discount;
  String? description;

  EnrollmentList(
      {this.id,
      this.batchid,
      this.userid,
      this.regnNumber,
      this.created,
      this.expiry,
      this.status,
      this.name,
      this.course,
      this.batchType,
      this.start,
      this.end,
      this.type,
      this.level,
      this.duration,
      this.durationType,
      this.image,
      this.price,
      this.discount,
      this.description});

  EnrollmentList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    batchid = json['batchid'];
    userid = json['userid'];
    regnNumber = json['regn_number'];
    created = json['created'];
    expiry = json['expiry'];
    status = json['status'];
    name = json['name'];
    course = json['course'];
    batchType = json['batch_type'];
    start = json['start'];
    end = json['end'];
    type = json['type'];
    level = json['level'];
    duration = json['duration'];
    durationType = json['duration_type'];
    image = json['image'];
    price = json['price'];
    discount = json['discount'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['batchid'] = this.batchid;
    data['userid'] = this.userid;
    data['regn_number'] = this.regnNumber;
    data['created'] = this.created;
    data['expiry'] = this.expiry;
    data['status'] = this.status;
    data['name'] = this.name;
    data['course'] = this.course;
    data['batch_type'] = this.batchType;
    data['start'] = this.start;
    data['end'] = this.end;
    data['type'] = this.type;
    data['level'] = this.level;
    data['duration'] = this.duration;
    data['duration_type'] = this.durationType;
    data['image'] = this.image;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['description'] = this.description;
    return data;
  }
}
