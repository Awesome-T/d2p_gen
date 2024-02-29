import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:d2p_annotation/d2p_annotation.dart';
import 'package:source_gen/source_gen.dart';

//
const String _postfixUnion = 'Union';
//
const String _prefixMapper = r'$Mapper';
//
const String prefixMsg = 'DTO';

/// Provides methods for reading annotation values from elements.
extension ExtensionNme on LibraryReader {
  /// The TypeChecker for checking annotations.
  static const TypeChecker _typeChecker = TypeChecker.fromRuntime(ProtoGen);

  /// Returns annotated elements that are either [ClassElement] or [EnumElement].
  /// This method filters annotated elements and returns only those that are classes or enums.
  Iterable<AnnotatedElement> selectClassesAndEnums() =>
      List<AnnotatedElement>.from(
        annotatedWith(_typeChecker).where(
            (e) => e.element is ClassElement || e.element is EnumElement),
      );

  /// Returns annotated elements that are neither classes nor enums.
  /// This method filters annotated elements and returns only those
  /// that are not classes or enums.
  Iterable<AnnotatedElement> getNotApplyebles() =>
      List<AnnotatedElement>.from(annotatedWith(_typeChecker).where(
          (e) => e.element is! ClassElement || e.element is! EnumElement));
}

///
extension ExtensionConstructorElement on ConstructorElement {
  String get showNsmeOfCurrentClass =>
      (this.nameOfRdrConstr ?? this.displayName).trim();

  ///
  String get nameOfMapper =>
      '$_prefixMapper${this.nameOfInheritedClass}'.trim();

  ///
  String get dtoMsgName => (this.nameOfInheritedClass == this.displayName)
      ? 'DTO${this.displayName}'.trim()
      : 'DTO${this.nameOfInheritedClass}_Union '.trim();

  /// Name of inherited class  or super class
  String get nameOfInheritedClass =>
      (declaration.superConstructor?.displayName == 'Object'
          ? null
          : declaration.superConstructor?.displayName) ??
      enclosingElement.name.trim();

  ///
  String get namedConstr => this.displayName;

  ///
  ///
  String get enclosingElementDisplayName => this.enclosingElement.displayName;

  ///
  ///
  String? get nameOfRdrConstr => this.redirectedConstructor?.displayName;

  ///
  ///
  bool get stertFrom_ =>
      nameOfRdrConstr != null ? (nameOfRdrConstr!.startsWith('_')) : false;

  ///
  ///
  String get fomDtoRD => (stertFrom_
      ? enclosingElementDisplayName
      : nameOfRdrConstr ?? namedConstr);

  ///
  ///
  String get nameOfField =>
      (this.declaration.name == '' ? fomDtoRD : this.declaration.name)
          .toLowerCase();

  ///
  ///
  String get protoMessageCl {
    final buf = StringBuffer();
    final String msgMane =
        '$prefixMsg${this.fomDtoRD.replaceAll(RegExp(r'\.'), '_')}';
    buf.writeln('''
/*
  class: ${this.displayName}
  Source: 'package:${this.source}';
*/
  message $msgMane {''');
    for (int i = 0; i < this.parameters.length; i++) {
      final ParameterElement param = this.parameters[i];
      buf.writeln('''
    // ${param.type} ${this.fomDtoRD}.${param.name}
    ${param.toProtoType} ${param.name} = ${i + 1};''');
      if (i == this.parameters.length - 1) {
        buf.writeln('''
  }''');
      }
    }
    final result = buf.toString();
    buf.clear();
    return result;
  }

  /// Generates a message string for an enum type.
  String get protoMessageEn {
    final StringBuffer buf = StringBuffer();
    final String name = this.displayName;
    buf.writeln('''
/**
    Enum $name
    Source: 'package:${this.source}';
*/
enum $prefixMsg$name {''');
    for (var i = 0; i < this.enclosingElement.thisType.accessors.length; i++) {
      if ('VALUES' !=
          this.enclosingElement.thisType.accessors[i].name.toUpperCase()) {
        buf.writeln(
          '   ${this.enclosingElement.thisType.accessors[i].name.toUpperCase()} = $i;',
        );
      }
    }
    buf.writeln('}');
    final msg = buf.toString();
    buf.clear();
    return msg;
  }
}

///
extension ExInString on String? {
  /// is this name start with `_`
  bool checkName_() => this != null ? (this!.startsWith('_')) : false;
}

///
extension ExtensionParameterElement on ParameterElement {
  /// Converts Dart type [type] to Proto type.
  String get toProtoType {
    /// Checks if the type is nullable and
    /// returns the appropriate label.
    String _isNullLbl(String source) => source.endsWith('?') ? 'optional ' : '';

    /// Converts Dart type [type] to Proto type.
    String _potoTypes(String type) => switch (type) {
          'String' || 'String?' || 'DateTime?' || 'DateTime' => 'string',
          'int' || 'int?' => 'int32',
          'bool' || 'bool?' => 'bool',
          'num' || 'num?' || 'double' || 'double?' => 'double',
          'Uint8List' || 'Uint8List?' => 'bytes',
          _ => '$prefixMsg$type',
        };

    /// Converts Dart type [type] to Proto type.
    String _toProtoType(String type) {
      if (type.startsWith('Map')) {
        return type.endsWith('?') ? 'optional string' : 'string';
      } else if (type.startsWith('List') ||
          type.startsWith('Iterable') ||
          type.startsWith('Set')) {
        final genericArgument = RegExp(r'<(\w+)>').firstMatch(type)?.group(1);
        final typeArgs = _potoTypes(genericArgument!);
        return 'repeated $typeArgs';
      } else {
        return '${_isNullLbl(type)}${_potoTypes(type)}';
      }
    }

    return _toProtoType('${this.type}'.trim());
    // _toProtoType('${this.type}'.trim());
  }

  ///
  Iterable<DartType> get generics => this.type.getGenericTypes();

  ///
  String get optional =>
      this.isOptional || this.type.toString().endsWith('?') == true ? '?' : '';

  ///
  String get mapTypeWithGenerics =>
      'Map<${generics.first},${generics.last}>${this.optional}'.trim();
}

/// Extension providing methods for Dart types.
extension ERxtensionDartType on DartType {
  String get toProtoType => switch ("$this") {
        'String' || 'String?' || 'DateTime?' || 'DateTime' => 'string',
        'int' || 'int?' => 'int32',
        'bool' || 'bool?' => 'bool',
        'num' || 'num?' || 'double' || 'double?' => 'double',
        'Uint8List' || 'Uint8List?' => 'bytes',
        _ => '$prefixMsg$this',
      };

  ///
  /// Returns the generic types of the given [type].
  ///
  Iterable<DartType> getGenericTypes() => this is ParameterizedType
      ? (this as ParameterizedType).typeArguments
      : const [];

  ///
  /// Checks if the Dart type is an iterable value.
  ///
  /// This method determines whether the Dart type represents an iterable value, such as List, Set, or Iterable.
  /// It returns true if the Dart type is one of the following: Set, List, or Iterable.
  ///
  /// Returns:
  /// - `true` if the Dart type is an iterable value.
  /// - `false` otherwise.
  ///
  bool isIterableValue() => <bool>[
        isDartCoreSet,
        isDartCoreList,
        isDartCoreIterable,
      ].contains(true);
}

///
extension ExtensionMapEntry on MapEntry<String, List<ConstructorElement>> {
  ///
  String get dtoUnionMsgName {
    return '$prefixMsg${this.key.replaceAll(RegExp(r'\.'), '_')}_$_postfixUnion';
  }

  ///
  String get oneOfField => this.key.toLowerCase();
}

/// Extension providing methods for [ClassElement].
extension ExtensionClassElenemt on ClassElement {
  ///
  /// Gets the name of the parent class for the current class element.
  ///
  /// This method retrieves the name of the parent class of the current class element by
  /// accessing the nameOfInheritedClass property of the first constructor in the constructors list.
  ///
  /// Returns:
  /// - The name of the parent class as a [String].
  ///
  String get nameOfParentClass =>
      constructors.map((ConstructorElement e) => e.nameOfInheritedClass).first;

  ///
  /// Groups constructor elements by a specified key function.
  ///
  /// This method takes an iterable of constructor elements [arr] and groups them based on the
  /// key function [key]. It returns a map where keys are generated by the key function and values
  /// are lists of constructor elements associated with each key.
  ///
  /// Parameters:
  /// - [arr]: Iterable of constructor elements to be grouped.
  /// - [key]: Function to generate keys for grouping.
  ///
  /// Returns:
  /// - A map where keys are generated by the key function and values are lists of constructor elements.
  ///
  Map<String, List<ConstructorElement>>
      groupClassElementByName<ConstructorElement, String>(
    Iterable<ConstructorElement> arr,
    String Function(ConstructorElement constructor) key,
  ) {
    final Map<String, List<ConstructorElement>> map =
        <String, List<ConstructorElement>>{};
    for (final ConstructorElement element in arr)
      (map[key(element)] ??= []).add(element);
    return map;
  }
}

///
extension Iterables<E> on Iterable<E> {
  ///
  Map<K, List<E>> groupBy<K>(K Function(E) fn) => fold(
        <K, List<E>>{},
        (Map<K, List<E>> map, E e) =>
            map..putIfAbsent(fn(e), () => <E>[]).add(e),
      );
}

///
mixin ValueReader {
  // This mixin provides methods for reading annotation values from elements.

  ///
  /// Retrieves constructors grouped by superclass name.
  ///
  /// Parameters:
  /// - [d]: An iterable of annotated elements.
  ///
  /// Returns:
  /// - A map where keys are superclass names and values are lists of constructors.
  ///
  Map<String, List<ConstructorElement>> cls(Iterable<Element> d) =>
      Map.fromEntries(
          // Filtering elements to keep only instances of
          // ClassElement and excluding private or synthetic classes
          d
              .whereType<ClassElement>()
              .where((classElement) =>
                  !classElement.isPrivate && !classElement.isSynthetic)
              // Exploding each ClassElement into its constructors and filtering out unwanted ones
              .expand<ConstructorElement>((classElement) =>
                  classElement.constructors.where((constructor) {
                    final bool _startWithUnderscore =
                        !(constructor.nameOfRdrConstr.checkName_());
                    final bool? s = classElement.constructors
                        .map((e) => (e.redirectedConstructor?.isAbstract))
                        .firstWhere((element) => true);
                    final bool abstractWoRedirects =
                        !(classElement.isAbstract &&
                            (classElement.constructors.length == 1) &&
                            (s != null || s != true));
                    return abstractWoRedirects &&
                        _startWithUnderscore &&
                        constructor.parameters.isNotEmpty &&
                        !constructor.isPrivate &&
                        !constructor.isSynthetic;
                  }))
              // Grouping constructors by superclass name
              // Transforming the map entries to keep only constructors with non-empty parameters
              .groupBy((constructor) => constructor.nameOfInheritedClass)
              .entries
              .map<MapEntry<String, List<ConstructorElement>>>((entry) =>
                  MapEntry<String, List<ConstructorElement>>(
                      entry.key,
                      entry.value
                          .where((constructor) =>
                              constructor.parameters.isNotEmpty)
                          .toList())));

  ///
  /// Retrieves enum constructors.
  ///
  /// Parameters:
  /// - [d]: An iterable of `Element`.
  ///
  /// Returns:
  /// - A list of enum constructors.
  ///
  List<ConstructorElement> enms(Iterable<Element> d) =>
      List<ConstructorElement>.from(
          d.whereType<EnumElement>().map((e) => e.constructors.first));

  ///
  /// Retrieves constructors grouped by superclass name.
  ///
  /// Parameters:
  /// - [d]: An iterable of annotated elements.
  ///
  /// Returns:
  /// - A map where keys are superclass names and values are lists of constructors.
  ///
  Map<String, List<ConstructorElement>> classes(Iterable<AnnotatedElement> d) =>
      Map.fromEntries(
          // Transforming each annotated element into a map entry
          d
              .map<Element>((annotatedElement) => annotatedElement.element)
              // Filtering elements to keep only instances of ClassElement and excluding private or synthetic classes
              .whereType<ClassElement>()
              .where((ClassElement classElement) =>
                  !classElement.isPrivate && !classElement.isSynthetic)
              // Exploding each ClassElement into its constructors and filtering out unwanted ones
              .expand<ConstructorElement>((classElement) =>
                  classElement.constructors.where((constructor) {
                    final bool _startWithUnderscore =
                        !(constructor.nameOfRdrConstr.checkName_());
                    final bool? s = classElement.constructors
                        .map((e) => (e.redirectedConstructor?.isAbstract))
                        .firstWhere((element) => true);
                    final bool abstractWoRedirects =
                        !(classElement.isAbstract &&
                            (classElement.constructors.length == 1) &&
                            (s != null || s != true));
                    return abstractWoRedirects &&
                        _startWithUnderscore &&
                        constructor.parameters.isNotEmpty &&
                        !constructor.isPrivate &&
                        !constructor.isSynthetic;
                  }))
              // Grouping constructors by superclass name
              .groupBy((ConstructorElement constructor) =>
                  constructor.nameOfInheritedClass)
              .entries
              // Transforming the map entries to keep only constructors with non-empty parameters
              .map<MapEntry<String, List<ConstructorElement>>>(
                  (MapEntry<String, List<ConstructorElement>> entry) =>
                      MapEntry<String, List<ConstructorElement>>(
                          entry.key,
                          entry.value
                              .where((constructor) =>
                                  constructor.parameters.isNotEmpty)
                              .toList())));

  ///
  /// Retrieves enum constructors.
  ///
  /// Parameters:
  /// - [d]: An iterable of annotated elements.
  ///
  /// Returns:
  /// - A list of enum constructors.
  ///
  List<ConstructorElement> enums(Iterable<AnnotatedElement> d) =>
      List<ConstructorElement>.from(
        d
            // Transforming each annotated element into an element and filtering to keep only EnumElement instances
            .map<Element>((AnnotatedElement a) => a.element)
            // Transforming each EnumElement into its first constructor
            .whereType<EnumElement>()
            .map((EnumElement e) => e.constructors.first),
      );
}
