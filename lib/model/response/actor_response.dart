import 'package:app_movie/model/entity/actor_entity.dart';

class ActorResponse {
  ActorResponse({
      this.id, 
      this.cast, 
      this.crew,});

  ActorResponse.fromJson(dynamic json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(Crew.fromJson(v));
      });
    }
  }
  int? id;
  List<Cast>? cast;
  List<Crew>? crew;
ActorResponse copyWith({  int? id,
  List<Cast>? cast,
  List<Crew>? crew,
}) => ActorResponse(  id: id ?? this.id,
  cast: cast ?? this.cast,
  crew: crew ?? this.crew,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      map['crew'] = crew?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Crew {
  Crew({
      this.adult, 
      this.gender, 
      this.id, 
      this.knownForDepartment, 
      this.name, 
      this.originalName, 
      this.popularity, 
      this.profilePath, 
      this.creditId, 
      this.department, 
      this.job,});

  Crew.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }
  bool? adult;
  num? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;
Crew copyWith({  bool? adult,
  num? gender,
  int? id,
  String? knownForDepartment,
  String? name,
  String? originalName,
  num? popularity,
  String? profilePath,
  String? creditId,
  String? department,
  String? job,
}) => Crew(  adult: adult ?? this.adult,
  gender: gender ?? this.gender,
  id: id ?? this.id,
  knownForDepartment: knownForDepartment ?? this.knownForDepartment,
  name: name ?? this.name,
  originalName: originalName ?? this.originalName,
  popularity: popularity ?? this.popularity,
  profilePath: profilePath ?? this.profilePath,
  creditId: creditId ?? this.creditId,
  department: department ?? this.department,
  job: job ?? this.job,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    map['credit_id'] = creditId;
    map['department'] = department;
    map['job'] = job;
    return map;
  }

}

