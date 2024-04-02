import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:d2p_annotation/d2p_annotation.dart';
import 'package:source_gen/source_gen.dart';

///
const String postfixUnion = '_Union';

///
const String _prefixMapper = r'$Mapper';

///
const String prefixMsg = 'DTO';

/// Provides methods for reading annotation values from elements.
extension ExtensionNme on LibraryReader {
  /// The TypeChecker for checking annotations.
  static const TypeChecker _typeChecker = TypeChecker.fromRuntime(ProtoGen);

  /// Returns annotated elements that are either [ClassElement] or [EnumElement].
  /// This method filters annotated elements and returns only those that are classes or enums.
  Iterable<AnnotatedElement> selectClassesAndEnums() =>
      List<AnnotatedElement>.from(annotatedWith(_typeChecker).where(
          (AnnotatedElement e) =>
              e.element is ClassElement || e.element is EnumElement));

  /// Returns annotated elements that are neither classes nor enums.
  /// This method filters annotated elements and returns only those
  /// that are not classes or enums.
  Iterable<AnnotatedElement> getNotApplyebles() =>
      List<AnnotatedElement>.from(annotatedWith(_typeChecker).where((final e) =>
          e.element is! ClassElement || e.element is! EnumElement));
}

///
extension ExtensionConstructorElement on ConstructorElement {
  /// Returns the name of the current class, considering redirected constructors.
  String get showNsmeOfCurrentClass =>
      (redirectedConstructor?.displayName ?? displayName).trim();

  /// Returns the name of the mapper class.
  String get nameOfMapper => '$_prefixMapper$nameOfInheritedClass'.trim();

  /// Returns the name of the proto message based on the constructor class.
  /// * If there is only one constructor without redirects, it will return "DTOFoo".
  /// * Otherwise, it will return 'DTOFoo_Union'.
  String get dtoMsgName => (nameOfInheritedClass == displayName)
      ? '$prefixMsg$displayName'.trim()
      : '$prefixMsg$nameOfInheritedClass$postfixUnion '.trim();

  /// Returns the name of the Dart class.
  /// If the class has not been sealed or is a union (which are created
  /// from the `freezed` package) or if it has not been redirected
  /// in the factory constructor, then it will return the name of
  /// its parent constructor.
  /// * class Foo{}  => "Foo"
  /// * sealed foo{}  => "Foo"
  /// * base class A extend Foo{} => "Foo"
  /// * abstract class Foo {const factory Foo.A() = A;} => "Foo"
  String get nameOfInheritedClass =>
      (declaration.superConstructor?.displayName == 'Object'
          ? null
          : declaration.superConstructor?.displayName) ??
      enclosingElement.name.trim();

  ///
  String? get fdf {
    return (superConstructor != null &&
            superConstructor!.displayName != 'Object')
        ? superConstructor!.displayName
        : enclosingElement.interfaces
            .where(
                (e) => e.getDisplayString(withNullability: false) != 'Object')
            .singleOrNull
            ?.getDisplayString(withNullability: false);
  }

  ///
  DartType? get su {
    return (superConstructor != null &&
            superConstructor!.displayName != 'Object')
        ? superConstructor!.enclosingElement.thisType
        : enclosingElement.interfaces
            .where(
                (e) => e.getDisplayString(withNullability: false) != 'Object')
            .singleOrNull!
            .extensionTypeErasure;
    // ?.getDisplayString(withNullability: false);
  }

  ///
  ///
  String get dtoNameByChild {
    late final ds = fdf;
    return ds == null ? dtoMsgName : 'DTO${ds}_Union';
  }

  ///
  String get fomDtoRD => ((redirectedConstructor?.displayName != null
          ? ((redirectedConstructor?.displayName)!.startsWith('_'))
          : false)
      ? enclosingElement.displayName
      : redirectedConstructor?.displayName ?? displayName);

  ///
  String get nameOfField =>
      (declaration.name == '' ? fomDtoRD : declaration.name).toLowerCase();

  ///
  String get protoMessageCl {
    final buf = StringBuffer();
    final msgMane = '$prefixMsg${fomDtoRD.replaceAll(RegExp(r'\.'), '_')}';
    buf.writeln('''
/*
  class: $displayName
  Source: 'package:$source';
*/
  message $msgMane {''');
    for (var i = 0; i < parameters.length; i++) {
      final param = parameters[i];
      buf.writeln('''
    // ${param.type} $fomDtoRD.${param.name}
    ${param.toProtoType} ${param.name} = ${i + 1};''');
      if (i == parameters.length - 1) {
        buf.writeln('''
  }''');
      }
    }
    final result = buf.toString();
    buf.clear();
    return result;
  }

  /// Generates a message string for an enum `type`.
  String get protoMessageEn {
    final buf = StringBuffer();
    buf.writeln('''
/**
    Enum $displayName
    Source: 'package:$source';
*/
enum $prefixMsg$displayName {''');
    for (var i = 0; i < enclosingElement.thisType.accessors.length; i++) {
      if ('VALUES' !=
          enclosingElement.thisType.accessors[i].name.toUpperCase()) {
        buf.writeln(
            '   ${enclosingElement.thisType.accessors[i].name.toUpperCase()} = $i;');
      }
    }
    buf.writeln('}');
    final msg = buf.toString();
    buf.clear();
    return msg;
  }

  ///
  ///
  ///
  ConstructorElement? get notEmptyPuclicRedirect {
    if (redirectedConstructor != null) {
      if (!redirectedConstructor!.displayName.startsWith('_') &&
          redirectedConstructor!.parameters.isNotEmpty) {
        return redirectedConstructor!;
      }
    }
    return null;
  }
}

extension _ExInString on String? {
  /// is this name start with `_`
  bool checkName_() => this != null ? (this!.startsWith('_')) : false;
}

extension ExtensionParameterElement on ParameterElement {
  /// Converts Dart type [type] to Proto type.
  String get toProtoType {
    // checking whether the type is sealed based on its element.
    final _isSealed = '${type.element}'.startsWith('sealed');
    //  checks if this string starts with the substring 'sealed'.
    //  If it does, concatenation _Union, otherwise nothing.
    final _uPostfix = '${_isSealed ? postfixUnion : ''}';

    /// Determines the protocol buffer type
    /// corresponding to the given [DartType] type.
    String _typeMatching(final DartType type) =>
        switch (type.getDisplayString(withNullability: false)) {
          'String' || 'DateTime' => 'string',
          'int' => 'int32',
          'bool' => 'bool',
          'num' || 'double' => 'double',
          'Uint8List' => 'bytes',
          _ =>
            '$prefixMsg${type.getDisplayString(withNullability: false)}$_uPostfix',
        };

    /// Converts Dart type [type] to Proto type.
    String _toProtoType(final DartType type) {
      if (type.isDartCoreMap) {
        return 'string';
      } else if (type.isIterableValue) {
        final generics = type.allGenericTypes;

        if (generics.isNotEmpty && generics.first.element is ClassElement) {
          final _cl = generics.first.element as ClassElement;
          final _isUnion = '$_cl'.startsWith('sealed') ||
              (_cl.isAbstract && _cl.library.source.fullName != 'dart:core');
          return 'repeated ${_typeMatching(generics.first)}${_isUnion ? postfixUnion : ''}';
        }
        return 'repeated ${_typeMatching(generics.first)}';
      } else {
        return '${type.protoOptional} ${_typeMatching(type)}';
      }
    }

    return _toProtoType(type).trim();
  }

  /// `<K,V>`
  String get mapGenerics =>
      '<${type.allGenericTypes.first},${type.allGenericTypes.last}>${type.protoOptional}'
          .trim();

  ///
  String get mapTypeWithGenerics =>
      'Map<${type.allGenericTypes.first},${type.allGenericTypes.last}>${type.protoOptional}'
          .trim();
}

/// Extension providing methods for Dart types.
extension ERxtensionDartType on DartType {
  /// if type is nullable
  bool get isNullable => nullabilitySuffix == NullabilitySuffix.question;

  /// `?` or ``
  String get dartNullableSign => isNullable ? '?' : '';

  ///
  String get existOnNullable => isNullable ? '!' : '';

  /// if dart is nullable `optional`
  String get protoOptional => isNullable ? 'optional' : '';

  /// Returns the generic types of the given `DartType`.
  Iterable<DartType> get allGenericTypes => this is ParameterizedType
      ? (this as ParameterizedType).typeArguments
      : const [];

  ///
  String get questionMark {
    final generic = allGenericTypes;
    return generic.isNotEmpty
        ? ('${generic.first}'.contains(RegExp(r'(\?)')))
            ? '?'
            : ''
        : '$this'.contains(RegExp(r'(\?)'))
            ? '?'
            : '';
  }

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
  bool get isIterableValue =>
      <bool>[isDartCoreSet, isDartCoreList, isDartCoreIterable].contains(true);

  ///
  /// *  `String` `int`, `double`, `bool`, `num`, `DateTime`
  ///
  bool get isContainBaseType => <bool>[
        isDartCoreString,
        isDartCoreInt,
        isDartCoreDouble,
        isDartCoreBool,
        isDartCoreNum,
        isDartCoreEnum,
        getDisplayString(withNullability: false) == 'DateTime'
      ].contains(true);
}

///
extension ExtensionMapEntry on MapEntry<String, List<ConstructorElement>> {
  ///
  String get dtoUnionMsgName =>
      '$prefixMsg${key.replaceAll(RegExp(r'\.'), '_')}$postfixUnion';

  ///
  String get oneOfField => key.toLowerCase();
}

extension ConstructorElementListExtensions on List<ConstructorElement> {
  /// Checks if any of the constructor elements in the list
  /// contain illegal types. It iterates through the list of
  /// constructor elements, extracting the parameter types and
  /// checking if any of them are from forbidden types such as
  /// Object, Symbol, Future, FutureOr, Stream, or their nullability
  /// variants. It also checks if any parameter type is dynamic.
  /// If any illegal type is found, the property returns true,
  /// otherwise false. This extension provides a convenient way t
  /// o check for illegal types within a list of constructor elements.
  bool get hasIllegalType {
    return any((constructor) {
      final parameterTypes = <DartType>[
        ...constructor.parameters.map((param) => param.type)
      ];
      if (constructor.redirectedConstructor != null) {
        parameterTypes.addAll(constructor.redirectedConstructor!.parameters
            .map((param) => param.type));
      }
      return parameterTypes.any((type) =>
          type.isDartCoreObject ||
          type.isDartCoreSymbol ||
          type.isDartCoreRecord ||
          type.isDartAsyncFuture ||
          type.isDartAsyncFutureOr ||
          type.isDartAsyncStream ||
          type.getDisplayString(withNullability: false) == '$dynamic' ||
          type.getDisplayString(withNullability: false) == '$Object');
    });
  }
}

/// Extension providing methods for [ClassElement].
extension ExtensionClassElenemt on ClassElement {
  ///
  /// Returns a collection of all the subclasses of a given class, as represented by
  /// the `ClassElement` element.
  /// * The returned collection must contain only those subclasses that have a
  /// * superclass that matches the given class and whose name does not start
  /// * with an underscore character `_`.
  /// * Additionally, the returned collection must not contain any abstract classes,
  /// * and the first constructor of each subclass must have at least one parameter
  /// * with a non-empty value.
  Iterable<ClassElement> get sealedSub => library
      .definingCompilationUnit.classes
      .where((cl) =>
          cl.allSupertypes.any((InterfaceType intf) => intf.element == this))
      .where((c) =>
          !c.displayName.startsWith(RegExp('_')) &&
          !c.isAbstract &&
          c.constructors.first.parameters.isNotEmpty);

  /// Retrieves an iterable of constructors from sealed subclasses.
  /// It iterates through each sealed subclass and collects its constructors
  /// that are not private and have non-empty parameters.
  Iterable<ConstructorElement> get sealedConstructors =>
      sealedSub.expand((e) => e.constructors.where(
          (e) => !e.displayName.startsWith('_') && e.parameters.isNotEmpty));

  /// Retrieves a list of non-empty constructors from the class.
  /// It checks each constructor and adds it to the list if it's not abstract,
  /// has non-empty parameters, and is not a private constructor.
  List<ConstructorElement> get notEmptyConstructors {
    final _a = <ConstructorElement>[];
    for (final contructor in constructors) {
      final _rConstructor = contructor.notEmptyPuclicRedirect;
      _rConstructor != null
          ? _a.add(_rConstructor)
          : (!contructor.isAbstract &&
                  contructor.parameters.isNotEmpty &&
                  !contructor.displayName.startsWith('_'))
              ? _a.add(contructor)
              : null;
    }
    return _a;
  }

  /// This code checks whether a class has been redirected to use
  /// a different constructor than its default constructor.
  ///
  /// If it has, it checks whether this redirected constructor is
  /// an abstract one and returns a Boolean value to indicate whether
  /// the condition is true for an abstract class that has only
  /// a single constructor.
  ///
  /// Checks if the class has a redirected constructor and if that constructor is abstract.
  /// Returns true if the class is abstract and has only one constructor, and that constructor is not abstract,
  /// or if the class has been redirected to use a different constructor that is not abstract,
  /// otherwise returns false.

  bool get hasRedirectConstructor {
    // Find the first redirected constructor and check if it's abstract.
    final s = constructors
        .map<bool?>((e) => e.redirectedConstructor?.isAbstract)
        .firstWhere((bool? e) => true);
    // Return true if the class is abstract and has only one constructor, and that constructor is not abstract,
    // or if the class has been redirected to use a different constructor that is not abstract,
    // otherwise return false.
    return !(isAbstract &&
        (constructors.length == 1) &&
        (s != null || s != true));
  }

  /// Gets the name of the parent class for the current class element.
  ///
  /// This method retrieves the name of the parent class of the current class element by
  /// accessing the nameOfInheritedClass property of the first constructor in the constructors list.
  ///
  /// Returns:
  /// - The name of the parent class as a [String].
  ///
  String get nameOfParentClass =>
      constructors.map((e) => e.nameOfInheritedClass).first;

  /// Checks if the class is a simple single class.
  /// Returns true if the class has exactly one constructor
  /// and that constructor has non-empty parameters, otherwise returns false.
  bool get isSimpleSingleClass {
    // Check if the class has exactly one constructor and
    // if the first constructor's parameters list is not empty.
    return constructors.length == 1 && constructors.first.parameters.isNotEmpty;
  }

  /// Gets the parent element of the current element.
  /// Returns null if no parent element is found.
  Element? get parentElement =>
      // Iterate over all supertypes of the current element
      // to find the first one that matches certain conditions.
      // Conditions include:
      // - The supertype is not 'Object'.
      // - The URI path of the library source of the current element
      //   matches the URI path of the library source of the supertype.
      allSupertypes
          .where((r) =>
              r.getDisplayString(withNullability: false) != 'Object' &&
              librarySource.uri.pathSegments.first ==
                  r.extensionTypeErasure.element?.librarySource?.uri
                      .pathSegments.first)
          .firstOrNull // Retrieve the first matching supertype or null if none found.
          ?.extensionTypeErasure // Access the extension type erasure of the supertype.
          .element; // Get the element associated with the extension type erasure.
}

///
extension Iterables<E> on Iterable<E> {
  /// Groups the elements of the iterable by keys derived from applying the function [fn] to each element.
  /// Returns a map where the keys are derived from the elements using [fn],
  /// and the values are lists of elements associated with each key.
  Map<K, List<E>> groupBy<K>(final K Function(E) fn)
      // Initialize an empty map to store the grouped elements
      =>
      fold(
          <K, List<E>>{},
          (final map, final e) =>
              // For each element 'e', modify the 'map'
              // Calculate the key for the current element using the provided function 'fn'
              // Add the current element 'e' to the list associated with the key in the 'map'
              // If the key doesn't exist yet, create a new list and associate it with the key
              map..putIfAbsent(fn(e), () => <E>[]).add(e));
}

///
mixin ValueReader {
  /// Returns the package name of the given library
  /// if it is from a package source, otherwise returns null.
  String? getPackageName(final LibraryElement library) {
    final sourceUri = library.librarySource.uri;
    if (sourceUri.isScheme('package')) {
      return sourceUri.pathSegments.first;
    }
    return null;
  }

  /// Extracts constructors of non-private and non-synthetic classes from the given iterable of elements,
  /// optionally filtered by package name, groups them by superclass name, and returns a map.

  /// This mixin provides methods for reading annotation values from elements.
  /// Retrieves constructors grouped by superclass name.
  /// Parameters:
  /// - [d]: An iterable of annotated elements.
  /// Returns:
  /// - A map where keys are superclass names and values are lists of constructors.
  Map<String, List<ConstructorElement>> extractClassConstructorsFiltered(
          Iterable<Element> d,
          [String? pack]) =>
      Map.fromEntries(
          // Filtering elements to keep only instances of
          // ClassElement and excluding private or synthetic classes
          d
              .whereType<ClassElement>()
              .where((clE) =>
                  !clE.isPrivate &&
                  !clE.isSynthetic &&
                  //
                  (pack != null ? getPackageName(clE.library) == pack : true))
              // Exploding each ClassElement into its constructors and filtering out unwanted ones
              .expand<ConstructorElement>(
                  (clE) => clE.constructors.where((constructor) {
                        final _startWithUnderscore =
                            !(constructor.redirectedConstructor?.displayName)
                                .checkName_();
                        return clE.hasRedirectConstructor &&
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

  /// Retrieves enum constructors.
  /// Parameters:
  /// - [d]: An iterable of `Element`.
  /// Returns:
  /// - A list of enum constructors.
  List<ConstructorElement> enms(final Iterable<Element> d) =>
      List<ConstructorElement>.from(
          d.whereType<EnumElement>().map((final e) => e.constructors.first));

  ///
  Map<String, List<ConstructorElement>> ces(Iterable<Element> d) =>
      Map.fromEntries(
          // Transforming each annotated element into a map entry
          d
              .whereType<ClassElement>()
              .where((ClassElement classElement) {
                return !classElement.isPrivate && !classElement.isSynthetic;
              })
              // Exploding each ClassElement into its constructors and filtering out unwanted ones
              .expand<ConstructorElement>((final classElement) =>
                  classElement.constructors.where((final constructor) {
                    final _startWithUnderscore =
                        !(constructor.redirectedConstructor?.displayName)
                            .checkName_();
                    return classElement.hasRedirectConstructor &&
                        _startWithUnderscore &&
                        constructor.parameters.isNotEmpty &&
                        !constructor.isPrivate &&
                        !constructor.isSynthetic;
                  }))
              // Grouping constructors by superclass name
              .groupBy((final constructor) => constructor.nameOfInheritedClass)
              .entries
              // Transforming the map entries to keep only constructors with non-empty parameters
              .map<MapEntry<String, List<ConstructorElement>>>((entry) =>
                  MapEntry<String, List<ConstructorElement>>(
                      entry.key,
                      entry.value
                          .where((constructor) =>
                              constructor.parameters.isNotEmpty)
                          .toList())));

  /// Retrieves constructors grouped by superclass name.
  /// Parameters:
  /// - [d]: An iterable of annotated elements.
  /// Returns:
  /// - A map where keys are superclass names and values are lists of constructors.
  Map<String, List<ConstructorElement>> extractClassConstructors(
          Iterable<AnnotatedElement> d) =>
      Map.fromEntries(
          // Transforming each annotated element into a map entry
          d
              .map<Element>((AnnotatedElement annotatedElement) =>
                  annotatedElement.element)
              // Filtering elements to keep only instances of ClassElement and excluding private or synthetic classes
              .whereType<ClassElement>()
              .where((ClassElement classElement) {
                return !classElement.isPrivate && !classElement.isSynthetic;
              })
              // Exploding each ClassElement into its constructors and filtering out unwanted ones
              .expand<ConstructorElement>((final classElement) =>
                  classElement.constructors.where((final constructor) {
                    final _startWithUnderscore =
                        !(constructor.redirectedConstructor?.displayName)
                            .checkName_();
                    return classElement.hasRedirectConstructor &&
                        _startWithUnderscore &&
                        constructor.parameters.isNotEmpty &&
                        !constructor.isPrivate &&
                        !constructor.isSynthetic;
                  }))
              // Grouping constructors by superclass name
              .groupBy((final constructor) => constructor.nameOfInheritedClass)
              .entries
              // Transforming the map entries to keep only constructors with non-empty parameters
              .map<MapEntry<String, List<ConstructorElement>>>((entry) =>
                  MapEntry<String, List<ConstructorElement>>(
                      entry.key,
                      entry.value
                          .where((constructor) =>
                              constructor.parameters.isNotEmpty)
                          .toList())));

  /// Retrieves enum constructors.
  /// Parameters:
  /// - [d]: An iterable of annotated elements.
  /// Returns:
  /// - A list of enum constructors.
  List<ConstructorElement> extractEnumConstructors(
          final Iterable<AnnotatedElement> d) =>
      List<ConstructorElement>.from(
        d
            // Transforming each annotated element into an element and filtering to keep only EnumElement instances
            .map<Element>((final a) => a.element)
            // Transforming each EnumElement into its first constructor
            .whereType<EnumElement>()
            .map((final e) => e.constructors.first),
      );
}
