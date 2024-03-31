import 'package:d2p_annotation/d2p_annotation.dart';

@ProtoGen(createMappers: true)
enum Corpus {
  CORPUS_UNSPECIFIED,
  CORPUS_UNIVERSAL,
  CORPUS_WEB,
  CORPUS_IMAGES,
  CORPUS_LOCAL,
  CORPUS_NEWS,
  CORPUS_PRODUCTS,
  CORPUS_VIDEO;
}
