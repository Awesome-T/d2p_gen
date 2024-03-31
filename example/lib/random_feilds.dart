import 'dart:math';

import '../models/auto.dart';
import '../models/auto.mp.dart';
import 'generated/proto/messages.g.pb.dart';

// Создаем только один экземпляр Random
final _random = Random();

///    Generate random `DTOCarModel`
DTOCarModel get randomCarModelDTO {
  final _name = _letters().sublist(_abcLengh).join();
  final country = _letters().sublist(_random.nextInt(6)).join();
  final _color = Colors.values[_random.nextInt(5)];
  final _gear = Gears.values[_random.nextInt(2)];
  final bodys = <BodyStyle>[
    BodyStyle.sUv(_random.nextBool()),
    BodyStyle.coupe(_random.nextBool()),
    BodyStyle.pickup(cargoSpace: _random.nextDouble()),
  ];
  return $MapperCarModel.toDTO(
    CarModel(
      DateTime.now(),
      _random.nextBool() ? null : DateTime.now(),
      'A6',
      Automakers(
        List.generate(
          _random.nextInt(_abcLengh),
          (i) => _letters().sublist(_random.nextInt(6)).join(),
        ),
        name: _name,
        country: country,
      ),
      bodys,
      variants: {
        _letters().sublist(_random.nextInt(6)).join(): _random.nextInt(323),
      },
      avalebleColors: _color,
      engines: [
        GasolineEngine(
          fuelConsumption: 878,
          hp: 333,
        ),
        DiselEngine(
          fuelConsumption: 323,
          hp: 65,
        ),
        ElectricEngine(65),
      ],
      gear: _gear,
    ),
  );
}

///
DTOAnimal_Union get randomAnimalDto {
  final r = Random();
  final i = r.nextInt(2);
  switch (i) {
    case 0:
      return DTOAnimal_Union(
        cow: DTOCow(
          dates: List<String>.generate(_random.nextInt(7),
              (i) => DateTime(DateTime.now().year + i).toIso8601String()),
          bolean: _random.nextBool(),
          weight: _random.nextDouble(),
          height: _random.nextInt(21),
          nullableDateTime: _random.nextBool() == true
              ? DateTime.now().toIso8601String()
              : null,
        ),
      );
    case 1:
      return DTOAnimal_Union(
          sheep:
              DTOSheep(one: _letters().sublist(0, _random.nextInt(15)).join()));
    case 2:
      return DTOAnimal_Union(pig: DTOPig(se: _random.nextDouble()));
    default:
      return DTOAnimal_Union();
  }
}

///
List<String> _letters() =>
    List.generate(_abcLengh, (final i) => (String.fromCharCode(i + 65)))
      ..shuffle();

///
const _abcLengh = 26;
