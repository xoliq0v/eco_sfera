// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/entity/drug_search.dart';
import 'src/entity/favorite_detactor.dart';
import 'src/entity/user_location.dart';
import 'src/entity/user_profile.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 7056624815736663072),
      name: 'UserLocationEntity',
      lastPropertyId: const obx_int.IdUid(4, 7718839471312882773),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8090760288968298661),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5011887811136801214),
            name: 'latitude',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 3015585855553175792),
            name: 'longitude',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 7718839471312882773),
            name: 'address',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 7660169785711106312),
      name: 'UserProfileEntity',
      lastPropertyId: const obx_int.IdUid(22, 3263433173223413176),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4602585128847109869),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(11, 1627340263017365609),
            name: 'vehicle',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(13, 285691341126716429),
            name: 'earnings',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(14, 8802556399451145160),
            name: 'outlay',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(15, 7844316547805418831),
            name: 'login',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(16, 1473454065051819177),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(17, 1341816038147709184),
            name: 'surname',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(18, 8035152386456721052),
            name: 'phone',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(19, 5489300185416120194),
            name: 'walletId',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(20, 8246463277541073127),
            name: 'walletBalance',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(21, 7900608354373858174),
            name: 'workOrder',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(22, 3263433173223413176),
            name: 'vehicleNumber',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 4105980060314521774),
      name: 'DrugSearchEntity',
      lastPropertyId: const obx_int.IdUid(2, 3738995709993755234),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8553718315219549938),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3738995709993755234),
            name: 'name',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(1, 1816954817380877621))
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(10, 4401431983671143429),
      name: 'FavoriteDetectorEntity',
      lastPropertyId: const obx_int.IdUid(2, 8506840089046472184),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 5796733341762196566),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8506840089046472184),
            name: 'dateTime',
            type: 6,
            flags: 40,
            indexId: const obx_int.IdUid(2, 5408362179349710280))
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(10, 4401431983671143429),
      lastIndexId: const obx_int.IdUid(2, 5408362179349710280),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [
        75042455611980492,
        6874524676565403421,
        3813689810048774381,
        132648053277693810,
        5355169936687159116,
        3912632930186233379
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        6978661269195667185,
        19510647949054609,
        5434881059833794830,
        2726890182059808038,
        593686858673463898,
        3080294505453800047,
        6454940647372475618,
        8580661146388329354,
        9152224406694826908,
        6128342416140506234,
        5269829927662976120,
        2998829024180323478,
        6713153143291451240,
        2110121796048615794,
        7356992917076708393,
        674042735533067629,
        991187614128801099,
        4914528072785814662,
        2847517446477226139,
        6537685978159505452,
        6760841145460297146,
        3476182928543999288,
        4551982776973858339,
        601532893874548410,
        8710070067355762777,
        7858146687899515509,
        5783281600980369804,
        8487421501686972826,
        4037868912185694576,
        7982889496159397025,
        7039267229098009250,
        977340218100841469,
        7501798048773219818,
        3735462247754945205,
        4728110541390920786,
        7203404374401878238,
        8176464469796457002,
        2847711518280737322,
        31710322854409287,
        4401854897662631362,
        2333836987821698992,
        9202848570399426465,
        8423579992317054344,
        8385587943357634432,
        308109077249199339,
        1599458229937871682,
        2896031385904289680,
        2060513163330851168,
        3565756125708468250
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    UserLocationEntity: obx_int.EntityDefinition<UserLocationEntity>(
        model: _entities[0],
        toOneRelations: (UserLocationEntity object) => [],
        toManyRelations: (UserLocationEntity object) => {},
        getId: (UserLocationEntity object) => object.id,
        setId: (UserLocationEntity object, int id) {
          object.id = id;
        },
        objectToFB: (UserLocationEntity object, fb.Builder fbb) {
          final addressOffset = fbb.writeString(object.address);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addFloat64(1, object.latitude);
          fbb.addFloat64(2, object.longitude);
          fbb.addOffset(3, addressOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final latitudeParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final longitudeParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final addressParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object = UserLocationEntity(
              latitude: latitudeParam,
              longitude: longitudeParam,
              address: addressParam,
              id: idParam);

          return object;
        }),
    UserProfileEntity: obx_int.EntityDefinition<UserProfileEntity>(
        model: _entities[1],
        toOneRelations: (UserProfileEntity object) => [],
        toManyRelations: (UserProfileEntity object) => {},
        getId: (UserProfileEntity object) => object.id,
        setId: (UserProfileEntity object, int id) {
          object.id = id;
        },
        objectToFB: (UserProfileEntity object, fb.Builder fbb) {
          final vehicleOffset =
              object.vehicle == null ? null : fbb.writeString(object.vehicle!);
          final earningsOffset = object.earnings == null
              ? null
              : fbb.writeString(object.earnings!);
          final outlayOffset =
              object.outlay == null ? null : fbb.writeString(object.outlay!);
          final loginOffset =
              object.login == null ? null : fbb.writeString(object.login!);
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final surnameOffset =
              object.surname == null ? null : fbb.writeString(object.surname!);
          final phoneOffset =
              object.phone == null ? null : fbb.writeString(object.phone!);
          final walletIdOffset = object.walletId == null
              ? null
              : fbb.writeString(object.walletId!);
          final walletBalanceOffset = object.walletBalance == null
              ? null
              : fbb.writeString(object.walletBalance!);
          final workOrderOffset = object.workOrder == null
              ? null
              : fbb.writeString(object.workOrder!);
          final vehicleNumberOffset = object.vehicleNumber == null
              ? null
              : fbb.writeString(object.vehicleNumber!);
          fbb.startTable(23);
          fbb.addInt64(0, object.id);
          fbb.addOffset(10, vehicleOffset);
          fbb.addOffset(12, earningsOffset);
          fbb.addOffset(13, outlayOffset);
          fbb.addOffset(14, loginOffset);
          fbb.addOffset(15, nameOffset);
          fbb.addOffset(16, surnameOffset);
          fbb.addOffset(17, phoneOffset);
          fbb.addOffset(18, walletIdOffset);
          fbb.addOffset(19, walletBalanceOffset);
          fbb.addOffset(20, workOrderOffset);
          fbb.addOffset(21, vehicleNumberOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 34);
          final surnameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 36);
          final phoneParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 38);
          final loginParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 32);
          final walletIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 40);
          final walletBalanceParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 42);
          final workOrderParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 44);
          final vehicleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 24);
          final vehicleNumberParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 46);
          final earningsParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 28);
          final outlayParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 30);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object = UserProfileEntity(
              name: nameParam,
              surname: surnameParam,
              phone: phoneParam,
              login: loginParam,
              walletId: walletIdParam,
              walletBalance: walletBalanceParam,
              workOrder: workOrderParam,
              vehicle: vehicleParam,
              vehicleNumber: vehicleNumberParam,
              earnings: earningsParam,
              outlay: outlayParam,
              id: idParam);

          return object;
        }),
    DrugSearchEntity: obx_int.EntityDefinition<DrugSearchEntity>(
        model: _entities[2],
        toOneRelations: (DrugSearchEntity object) => [],
        toManyRelations: (DrugSearchEntity object) => {},
        getId: (DrugSearchEntity object) => object.id,
        setId: (DrugSearchEntity object, int id) {
          object.id = id;
        },
        objectToFB: (DrugSearchEntity object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object = DrugSearchEntity(name: nameParam, id: idParam);

          return object;
        }),
    FavoriteDetectorEntity: obx_int.EntityDefinition<FavoriteDetectorEntity>(
        model: _entities[3],
        toOneRelations: (FavoriteDetectorEntity object) => [],
        toManyRelations: (FavoriteDetectorEntity object) => {},
        getId: (FavoriteDetectorEntity object) => object.id,
        setId: (FavoriteDetectorEntity object, int id) {
          object.id = id;
        },
        objectToFB: (FavoriteDetectorEntity object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.dateTime);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dateTimeParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object =
              FavoriteDetectorEntity(dateTime: dateTimeParam, id: idParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [UserLocationEntity] entity fields to define ObjectBox queries.
class UserLocationEntity_ {
  /// See [UserLocationEntity.id].
  static final id =
      obx.QueryIntegerProperty<UserLocationEntity>(_entities[0].properties[0]);

  /// See [UserLocationEntity.latitude].
  static final latitude =
      obx.QueryDoubleProperty<UserLocationEntity>(_entities[0].properties[1]);

  /// See [UserLocationEntity.longitude].
  static final longitude =
      obx.QueryDoubleProperty<UserLocationEntity>(_entities[0].properties[2]);

  /// See [UserLocationEntity.address].
  static final address =
      obx.QueryStringProperty<UserLocationEntity>(_entities[0].properties[3]);
}

/// [UserProfileEntity] entity fields to define ObjectBox queries.
class UserProfileEntity_ {
  /// See [UserProfileEntity.id].
  static final id =
      obx.QueryIntegerProperty<UserProfileEntity>(_entities[1].properties[0]);

  /// See [UserProfileEntity.vehicle].
  static final vehicle =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[1]);

  /// See [UserProfileEntity.earnings].
  static final earnings =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[2]);

  /// See [UserProfileEntity.outlay].
  static final outlay =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[3]);

  /// See [UserProfileEntity.login].
  static final login =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[4]);

  /// See [UserProfileEntity.name].
  static final name =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[5]);

  /// See [UserProfileEntity.surname].
  static final surname =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[6]);

  /// See [UserProfileEntity.phone].
  static final phone =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[7]);

  /// See [UserProfileEntity.walletId].
  static final walletId =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[8]);

  /// See [UserProfileEntity.walletBalance].
  static final walletBalance =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[9]);

  /// See [UserProfileEntity.workOrder].
  static final workOrder =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[10]);

  /// See [UserProfileEntity.vehicleNumber].
  static final vehicleNumber =
      obx.QueryStringProperty<UserProfileEntity>(_entities[1].properties[11]);
}

/// [DrugSearchEntity] entity fields to define ObjectBox queries.
class DrugSearchEntity_ {
  /// See [DrugSearchEntity.id].
  static final id =
      obx.QueryIntegerProperty<DrugSearchEntity>(_entities[2].properties[0]);

  /// See [DrugSearchEntity.name].
  static final name =
      obx.QueryStringProperty<DrugSearchEntity>(_entities[2].properties[1]);
}

/// [FavoriteDetectorEntity] entity fields to define ObjectBox queries.
class FavoriteDetectorEntity_ {
  /// See [FavoriteDetectorEntity.id].
  static final id = obx.QueryIntegerProperty<FavoriteDetectorEntity>(
      _entities[3].properties[0]);

  /// See [FavoriteDetectorEntity.dateTime].
  static final dateTime = obx.QueryIntegerProperty<FavoriteDetectorEntity>(
      _entities[3].properties[1]);
}
