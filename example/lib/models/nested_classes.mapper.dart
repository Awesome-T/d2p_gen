import 'dart:convert';
import 'package:exap/src/generated/messages.pb.dart';
import 'package:exap/models/nested_classes.dart';
  /// Mapper that converts a DTO [DTOFirstLevel] object 
  /// into a Model [FirstLevel] and back.
  abstract class $MapperFirstLevel {
    
  /// Converts the model [FirstLevel]
  /// to the DTO [DTOFirstLevel].
  static FirstLevel fromDTO (DTOFirstLevel model) {
    try {
      return FirstLevel(
                             DateTime.parse(model.dt),
                             model.ninew,
                             model.pwqwq,
                             (model.nesyed.isNotEmpty??false)?
          List<SecondLevel>.from(model.nesyed!.map<SecondLevel>((model)=>SecondLevel (count : model.count,arr : (model.arr.isNotEmpty??false)?
          List<TherdLevel>.from(model.arr!.map<TherdLevel>((model)=>TherdLevel (count : model.count,),),):
          [],),),):
          [],
                            mapa: jsonDecode(model.mapa) as Map<String,dynamic>,
                            one: model.one,
                            three: model.three,
                            seven: model.seven,
                            nine: (model.nine.isNotEmpty??false)?List<DateTime>.from(model.nine!.map((e)=>DateTime.parse(e),)):[],
                            ten: DateTime.parse(model.ten),
                            zerro: model.zerro,
                            float: model.float,
                            two: model.two,
                            eight: model.eight,
        );
} on FormatException catch (e, trace) {
    throw FormatException(
      '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the model [FirstLevel] 
  /// to the DTO [DTOFirstLevel]
  static DTOFirstLevel toDTO (FirstLevel model){
    try {
      return DTOFirstLevel(
          dt : model.dt?.toIso8601String(),
          ninew : model.ninew,
          pwqwq : model.pwqwq,
          nesyed : (model.nesyed.isNotEmpty??false)?
          List<DTOSecondLevel>.from(model.nesyed!.map<DTOSecondLevel>((model)=>DTOSecondLevel (count  : model.count,arr  : (model.arr.isNotEmpty??false)?
          List<DTOTherdLevel>.from(model.arr!.map<DTOTherdLevel>((model)=>DTOTherdLevel (count  : model.count,),),):
          [],),),):
          [],
          mapa : jsonEncode(model.mapa),
          one : model.one,
          three : model.three,
          seven : model.seven,
          nine : (model.nine.isNotEmpty??false)?List<String>.from(model.nine!.map((e)=>e?.toIso8601String(),)):[],
          ten : model.ten?.toIso8601String(),
          zerro : model.zerro,
          float : model.float,
          two : model.two,
          eight : model.eight,
        );
} on FormatException catch (e, trace) {
    throw FormatException(
      '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  }
          
  /// Mapper that converts a DTO [DTOSecondLevel] object 
  /// into a Model [SecondLevel] and back.
  abstract class $MapperSecondLevel {
    
  /// Converts the model [SecondLevel]
  /// to the DTO [DTOSecondLevel].
  static SecondLevel fromDTO (DTOSecondLevel model) {
    try {
      return SecondLevel(
                            count: model.count,
                            arr: (model.arr.isNotEmpty??false)?
          List<TherdLevel>.from(model.arr!.map<TherdLevel>((model)=>TherdLevel (count : model.count,),),):
          [],
        );
} on FormatException catch (e, trace) {
    throw FormatException(
      '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the model [SecondLevel] 
  /// to the DTO [DTOSecondLevel]
  static DTOSecondLevel toDTO (SecondLevel model){
    try {
      return DTOSecondLevel(
          count : model.count,
          arr : (model.arr.isNotEmpty??false)?
          List<DTOTherdLevel>.from(model.arr!.map<DTOTherdLevel>((model)=>DTOTherdLevel (count  : model.count,),),):
          [],
        );
} on FormatException catch (e, trace) {
    throw FormatException(
      '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  }
          
  /// Mapper that converts a DTO [DTOTherdLevel] object 
  /// into a Model [TherdLevel] and back.
  abstract class $MapperTherdLevel {
    
  /// Converts the model [TherdLevel]
  /// to the DTO [DTOTherdLevel].
  static TherdLevel fromDTO (DTOTherdLevel model) {
    try {
      return TherdLevel(
                            count: model.count,
        );
} on FormatException catch (e, trace) {
    throw FormatException(
      '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the model [TherdLevel] 
  /// to the DTO [DTOTherdLevel]
  static DTOTherdLevel toDTO (TherdLevel model){
    try {
      return DTOTherdLevel(
          count : model.count,
        );
} on FormatException catch (e, trace) {
    throw FormatException(
      '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  }
          


