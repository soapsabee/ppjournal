// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PortTable extends Port with TableInfo<$PortTable, PortData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PortTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _portSizeMeta = const VerificationMeta(
    'portSize',
  );
  @override
  late final GeneratedColumn<double> portSize = GeneratedColumn<double>(
    'port_size',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _riskPerTradeMeta = const VerificationMeta(
    'riskPerTrade',
  );
  @override
  late final GeneratedColumn<double> riskPerTrade = GeneratedColumn<double>(
    'risk_per_trade',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costPerTradeMeta = const VerificationMeta(
    'costPerTrade',
  );
  @override
  late final GeneratedColumn<double> costPerTrade = GeneratedColumn<double>(
    'cost_per_trade',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _journalIdMeta = const VerificationMeta(
    'journalId',
  );
  @override
  late final GeneratedColumn<int> journalId = GeneratedColumn<int>(
    'journal_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    portSize,
    riskPerTrade,
    costPerTrade,
    journalId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'port';
  @override
  VerificationContext validateIntegrity(
    Insertable<PortData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('port_size')) {
      context.handle(
        _portSizeMeta,
        portSize.isAcceptableOrUnknown(data['port_size']!, _portSizeMeta),
      );
    } else if (isInserting) {
      context.missing(_portSizeMeta);
    }
    if (data.containsKey('risk_per_trade')) {
      context.handle(
        _riskPerTradeMeta,
        riskPerTrade.isAcceptableOrUnknown(
          data['risk_per_trade']!,
          _riskPerTradeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_riskPerTradeMeta);
    }
    if (data.containsKey('cost_per_trade')) {
      context.handle(
        _costPerTradeMeta,
        costPerTrade.isAcceptableOrUnknown(
          data['cost_per_trade']!,
          _costPerTradeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_costPerTradeMeta);
    }
    if (data.containsKey('journal_id')) {
      context.handle(
        _journalIdMeta,
        journalId.isAcceptableOrUnknown(data['journal_id']!, _journalIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PortData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PortData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      portSize:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}port_size'],
          )!,
      riskPerTrade:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}risk_per_trade'],
          )!,
      costPerTrade:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}cost_per_trade'],
          )!,
      journalId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}journal_id'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $PortTable createAlias(String alias) {
    return $PortTable(attachedDatabase, alias);
  }
}

class PortData extends DataClass implements Insertable<PortData> {
  final int id;
  final String name;
  final double portSize;
  final double riskPerTrade;
  final double costPerTrade;
  final int? journalId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PortData({
    required this.id,
    required this.name,
    required this.portSize,
    required this.riskPerTrade,
    required this.costPerTrade,
    this.journalId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['port_size'] = Variable<double>(portSize);
    map['risk_per_trade'] = Variable<double>(riskPerTrade);
    map['cost_per_trade'] = Variable<double>(costPerTrade);
    if (!nullToAbsent || journalId != null) {
      map['journal_id'] = Variable<int>(journalId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PortCompanion toCompanion(bool nullToAbsent) {
    return PortCompanion(
      id: Value(id),
      name: Value(name),
      portSize: Value(portSize),
      riskPerTrade: Value(riskPerTrade),
      costPerTrade: Value(costPerTrade),
      journalId:
          journalId == null && nullToAbsent
              ? const Value.absent()
              : Value(journalId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PortData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PortData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      portSize: serializer.fromJson<double>(json['portSize']),
      riskPerTrade: serializer.fromJson<double>(json['riskPerTrade']),
      costPerTrade: serializer.fromJson<double>(json['costPerTrade']),
      journalId: serializer.fromJson<int?>(json['journalId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'portSize': serializer.toJson<double>(portSize),
      'riskPerTrade': serializer.toJson<double>(riskPerTrade),
      'costPerTrade': serializer.toJson<double>(costPerTrade),
      'journalId': serializer.toJson<int?>(journalId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PortData copyWith({
    int? id,
    String? name,
    double? portSize,
    double? riskPerTrade,
    double? costPerTrade,
    Value<int?> journalId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PortData(
    id: id ?? this.id,
    name: name ?? this.name,
    portSize: portSize ?? this.portSize,
    riskPerTrade: riskPerTrade ?? this.riskPerTrade,
    costPerTrade: costPerTrade ?? this.costPerTrade,
    journalId: journalId.present ? journalId.value : this.journalId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PortData copyWithCompanion(PortCompanion data) {
    return PortData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      portSize: data.portSize.present ? data.portSize.value : this.portSize,
      riskPerTrade:
          data.riskPerTrade.present
              ? data.riskPerTrade.value
              : this.riskPerTrade,
      costPerTrade:
          data.costPerTrade.present
              ? data.costPerTrade.value
              : this.costPerTrade,
      journalId: data.journalId.present ? data.journalId.value : this.journalId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PortData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('portSize: $portSize, ')
          ..write('riskPerTrade: $riskPerTrade, ')
          ..write('costPerTrade: $costPerTrade, ')
          ..write('journalId: $journalId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    portSize,
    riskPerTrade,
    costPerTrade,
    journalId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PortData &&
          other.id == this.id &&
          other.name == this.name &&
          other.portSize == this.portSize &&
          other.riskPerTrade == this.riskPerTrade &&
          other.costPerTrade == this.costPerTrade &&
          other.journalId == this.journalId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PortCompanion extends UpdateCompanion<PortData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> portSize;
  final Value<double> riskPerTrade;
  final Value<double> costPerTrade;
  final Value<int?> journalId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PortCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.portSize = const Value.absent(),
    this.riskPerTrade = const Value.absent(),
    this.costPerTrade = const Value.absent(),
    this.journalId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PortCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double portSize,
    required double riskPerTrade,
    required double costPerTrade,
    this.journalId = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       portSize = Value(portSize),
       riskPerTrade = Value(riskPerTrade),
       costPerTrade = Value(costPerTrade),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PortData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? portSize,
    Expression<double>? riskPerTrade,
    Expression<double>? costPerTrade,
    Expression<int>? journalId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (portSize != null) 'port_size': portSize,
      if (riskPerTrade != null) 'risk_per_trade': riskPerTrade,
      if (costPerTrade != null) 'cost_per_trade': costPerTrade,
      if (journalId != null) 'journal_id': journalId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PortCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? portSize,
    Value<double>? riskPerTrade,
    Value<double>? costPerTrade,
    Value<int?>? journalId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return PortCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      portSize: portSize ?? this.portSize,
      riskPerTrade: riskPerTrade ?? this.riskPerTrade,
      costPerTrade: costPerTrade ?? this.costPerTrade,
      journalId: journalId ?? this.journalId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (portSize.present) {
      map['port_size'] = Variable<double>(portSize.value);
    }
    if (riskPerTrade.present) {
      map['risk_per_trade'] = Variable<double>(riskPerTrade.value);
    }
    if (costPerTrade.present) {
      map['cost_per_trade'] = Variable<double>(costPerTrade.value);
    }
    if (journalId.present) {
      map['journal_id'] = Variable<int>(journalId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PortCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('portSize: $portSize, ')
          ..write('riskPerTrade: $riskPerTrade, ')
          ..write('costPerTrade: $costPerTrade, ')
          ..write('journalId: $journalId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TradeSetupTable extends TradeSetup
    with TableInfo<$TradeSetupTable, TradeSetupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TradeSetupTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailMeta = const VerificationMeta('detail');
  @override
  late final GeneratedColumn<String> detail = GeneratedColumn<String>(
    'detail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    detail,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trade_setup';
  @override
  VerificationContext validateIntegrity(
    Insertable<TradeSetupData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('detail')) {
      context.handle(
        _detailMeta,
        detail.isAcceptableOrUnknown(data['detail']!, _detailMeta),
      );
    } else if (isInserting) {
      context.missing(_detailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TradeSetupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TradeSetupData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      detail:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}detail'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $TradeSetupTable createAlias(String alias) {
    return $TradeSetupTable(attachedDatabase, alias);
  }
}

class TradeSetupData extends DataClass implements Insertable<TradeSetupData> {
  final int id;
  final String name;
  final String detail;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TradeSetupData({
    required this.id,
    required this.name,
    required this.detail,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['detail'] = Variable<String>(detail);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TradeSetupCompanion toCompanion(bool nullToAbsent) {
    return TradeSetupCompanion(
      id: Value(id),
      name: Value(name),
      detail: Value(detail),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TradeSetupData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TradeSetupData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      detail: serializer.fromJson<String>(json['detail']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'detail': serializer.toJson<String>(detail),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TradeSetupData copyWith({
    int? id,
    String? name,
    String? detail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => TradeSetupData(
    id: id ?? this.id,
    name: name ?? this.name,
    detail: detail ?? this.detail,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TradeSetupData copyWithCompanion(TradeSetupCompanion data) {
    return TradeSetupData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      detail: data.detail.present ? data.detail.value : this.detail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TradeSetupData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, detail, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TradeSetupData &&
          other.id == this.id &&
          other.name == this.name &&
          other.detail == this.detail &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TradeSetupCompanion extends UpdateCompanion<TradeSetupData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> detail;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TradeSetupCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.detail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TradeSetupCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String detail,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       detail = Value(detail),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TradeSetupData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? detail,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (detail != null) 'detail': detail,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TradeSetupCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? detail,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return TradeSetupCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      detail: detail ?? this.detail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String>(detail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TradeSetupCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $JournalTable extends Journal with TableInfo<$JournalTable, JournalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionMeta = const VerificationMeta(
    'session',
  );
  @override
  late final GeneratedColumn<String> session = GeneratedColumn<String>(
    'session',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pairIdMeta = const VerificationMeta('pairId');
  @override
  late final GeneratedColumn<int> pairId = GeneratedColumn<int>(
    'pair_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tradeSetupIdMeta = const VerificationMeta(
    'tradeSetupId',
  );
  @override
  late final GeneratedColumn<int> tradeSetupId = GeneratedColumn<int>(
    'trade_setup_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _poiIdMeta = const VerificationMeta('poiId');
  @override
  late final GeneratedColumn<int> poiId = GeneratedColumn<int>(
    'poi_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _signalIdMeta = const VerificationMeta(
    'signalId',
  );
  @override
  late final GeneratedColumn<int> signalId = GeneratedColumn<int>(
    'signal_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pricePatternIdMeta = const VerificationMeta(
    'pricePatternId',
  );
  @override
  late final GeneratedColumn<int> pricePatternId = GeneratedColumn<int>(
    'price_pattern_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timeFrameMeta = const VerificationMeta(
    'timeFrame',
  );
  @override
  late final GeneratedColumn<String> timeFrame = GeneratedColumn<String>(
    'time_frame',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _winLoseMeta = const VerificationMeta(
    'winLose',
  );
  @override
  late final GeneratedColumn<String> winLose = GeneratedColumn<String>(
    'win_lose',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _profitMeta = const VerificationMeta('profit');
  @override
  late final GeneratedColumn<double> profit = GeneratedColumn<double>(
    'profit',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _riskRewardRatioMeta = const VerificationMeta(
    'riskRewardRatio',
  );
  @override
  late final GeneratedColumn<double> riskRewardRatio = GeneratedColumn<double>(
    'risk_reward_ratio',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feeMeta = const VerificationMeta('fee');
  @override
  late final GeneratedColumn<double> fee = GeneratedColumn<double>(
    'fee',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<int> noteId = GeneratedColumn<int>(
    'note_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    session,
    pairId,
    tradeSetupId,
    poiId,
    signalId,
    pricePatternId,
    timeFrame,
    position,
    winLose,
    profit,
    riskRewardRatio,
    fee,
    noteId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('session')) {
      context.handle(
        _sessionMeta,
        session.isAcceptableOrUnknown(data['session']!, _sessionMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionMeta);
    }
    if (data.containsKey('pair_id')) {
      context.handle(
        _pairIdMeta,
        pairId.isAcceptableOrUnknown(data['pair_id']!, _pairIdMeta),
      );
    }
    if (data.containsKey('trade_setup_id')) {
      context.handle(
        _tradeSetupIdMeta,
        tradeSetupId.isAcceptableOrUnknown(
          data['trade_setup_id']!,
          _tradeSetupIdMeta,
        ),
      );
    }
    if (data.containsKey('poi_id')) {
      context.handle(
        _poiIdMeta,
        poiId.isAcceptableOrUnknown(data['poi_id']!, _poiIdMeta),
      );
    }
    if (data.containsKey('signal_id')) {
      context.handle(
        _signalIdMeta,
        signalId.isAcceptableOrUnknown(data['signal_id']!, _signalIdMeta),
      );
    }
    if (data.containsKey('price_pattern_id')) {
      context.handle(
        _pricePatternIdMeta,
        pricePatternId.isAcceptableOrUnknown(
          data['price_pattern_id']!,
          _pricePatternIdMeta,
        ),
      );
    }
    if (data.containsKey('time_frame')) {
      context.handle(
        _timeFrameMeta,
        timeFrame.isAcceptableOrUnknown(data['time_frame']!, _timeFrameMeta),
      );
    } else if (isInserting) {
      context.missing(_timeFrameMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('win_lose')) {
      context.handle(
        _winLoseMeta,
        winLose.isAcceptableOrUnknown(data['win_lose']!, _winLoseMeta),
      );
    } else if (isInserting) {
      context.missing(_winLoseMeta);
    }
    if (data.containsKey('profit')) {
      context.handle(
        _profitMeta,
        profit.isAcceptableOrUnknown(data['profit']!, _profitMeta),
      );
    } else if (isInserting) {
      context.missing(_profitMeta);
    }
    if (data.containsKey('risk_reward_ratio')) {
      context.handle(
        _riskRewardRatioMeta,
        riskRewardRatio.isAcceptableOrUnknown(
          data['risk_reward_ratio']!,
          _riskRewardRatioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_riskRewardRatioMeta);
    }
    if (data.containsKey('fee')) {
      context.handle(
        _feeMeta,
        fee.isAcceptableOrUnknown(data['fee']!, _feeMeta),
      );
    } else if (isInserting) {
      context.missing(_feeMeta);
    }
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      session:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}session'],
          )!,
      pairId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pair_id'],
      ),
      tradeSetupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}trade_setup_id'],
      ),
      poiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}poi_id'],
      ),
      signalId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}signal_id'],
      ),
      pricePatternId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price_pattern_id'],
      ),
      timeFrame:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}time_frame'],
          )!,
      position:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}position'],
          )!,
      winLose:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}win_lose'],
          )!,
      profit:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}profit'],
          )!,
      riskRewardRatio:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}risk_reward_ratio'],
          )!,
      fee:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}fee'],
          )!,
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}note_id'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $JournalTable createAlias(String alias) {
    return $JournalTable(attachedDatabase, alias);
  }
}

class JournalData extends DataClass implements Insertable<JournalData> {
  final int id;
  final DateTime date;
  final String session;
  final int? pairId;
  final int? tradeSetupId;
  final int? poiId;
  final int? signalId;
  final int? pricePatternId;
  final String timeFrame;
  final String position;
  final String winLose;
  final double profit;
  final double riskRewardRatio;
  final double fee;
  final int? noteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const JournalData({
    required this.id,
    required this.date,
    required this.session,
    this.pairId,
    this.tradeSetupId,
    this.poiId,
    this.signalId,
    this.pricePatternId,
    required this.timeFrame,
    required this.position,
    required this.winLose,
    required this.profit,
    required this.riskRewardRatio,
    required this.fee,
    this.noteId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['session'] = Variable<String>(session);
    if (!nullToAbsent || pairId != null) {
      map['pair_id'] = Variable<int>(pairId);
    }
    if (!nullToAbsent || tradeSetupId != null) {
      map['trade_setup_id'] = Variable<int>(tradeSetupId);
    }
    if (!nullToAbsent || poiId != null) {
      map['poi_id'] = Variable<int>(poiId);
    }
    if (!nullToAbsent || signalId != null) {
      map['signal_id'] = Variable<int>(signalId);
    }
    if (!nullToAbsent || pricePatternId != null) {
      map['price_pattern_id'] = Variable<int>(pricePatternId);
    }
    map['time_frame'] = Variable<String>(timeFrame);
    map['position'] = Variable<String>(position);
    map['win_lose'] = Variable<String>(winLose);
    map['profit'] = Variable<double>(profit);
    map['risk_reward_ratio'] = Variable<double>(riskRewardRatio);
    map['fee'] = Variable<double>(fee);
    if (!nullToAbsent || noteId != null) {
      map['note_id'] = Variable<int>(noteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  JournalCompanion toCompanion(bool nullToAbsent) {
    return JournalCompanion(
      id: Value(id),
      date: Value(date),
      session: Value(session),
      pairId:
          pairId == null && nullToAbsent ? const Value.absent() : Value(pairId),
      tradeSetupId:
          tradeSetupId == null && nullToAbsent
              ? const Value.absent()
              : Value(tradeSetupId),
      poiId:
          poiId == null && nullToAbsent ? const Value.absent() : Value(poiId),
      signalId:
          signalId == null && nullToAbsent
              ? const Value.absent()
              : Value(signalId),
      pricePatternId:
          pricePatternId == null && nullToAbsent
              ? const Value.absent()
              : Value(pricePatternId),
      timeFrame: Value(timeFrame),
      position: Value(position),
      winLose: Value(winLose),
      profit: Value(profit),
      riskRewardRatio: Value(riskRewardRatio),
      fee: Value(fee),
      noteId:
          noteId == null && nullToAbsent ? const Value.absent() : Value(noteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory JournalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      session: serializer.fromJson<String>(json['session']),
      pairId: serializer.fromJson<int?>(json['pairId']),
      tradeSetupId: serializer.fromJson<int?>(json['tradeSetupId']),
      poiId: serializer.fromJson<int?>(json['poiId']),
      signalId: serializer.fromJson<int?>(json['signalId']),
      pricePatternId: serializer.fromJson<int?>(json['pricePatternId']),
      timeFrame: serializer.fromJson<String>(json['timeFrame']),
      position: serializer.fromJson<String>(json['position']),
      winLose: serializer.fromJson<String>(json['winLose']),
      profit: serializer.fromJson<double>(json['profit']),
      riskRewardRatio: serializer.fromJson<double>(json['riskRewardRatio']),
      fee: serializer.fromJson<double>(json['fee']),
      noteId: serializer.fromJson<int?>(json['noteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'session': serializer.toJson<String>(session),
      'pairId': serializer.toJson<int?>(pairId),
      'tradeSetupId': serializer.toJson<int?>(tradeSetupId),
      'poiId': serializer.toJson<int?>(poiId),
      'signalId': serializer.toJson<int?>(signalId),
      'pricePatternId': serializer.toJson<int?>(pricePatternId),
      'timeFrame': serializer.toJson<String>(timeFrame),
      'position': serializer.toJson<String>(position),
      'winLose': serializer.toJson<String>(winLose),
      'profit': serializer.toJson<double>(profit),
      'riskRewardRatio': serializer.toJson<double>(riskRewardRatio),
      'fee': serializer.toJson<double>(fee),
      'noteId': serializer.toJson<int?>(noteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  JournalData copyWith({
    int? id,
    DateTime? date,
    String? session,
    Value<int?> pairId = const Value.absent(),
    Value<int?> tradeSetupId = const Value.absent(),
    Value<int?> poiId = const Value.absent(),
    Value<int?> signalId = const Value.absent(),
    Value<int?> pricePatternId = const Value.absent(),
    String? timeFrame,
    String? position,
    String? winLose,
    double? profit,
    double? riskRewardRatio,
    double? fee,
    Value<int?> noteId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => JournalData(
    id: id ?? this.id,
    date: date ?? this.date,
    session: session ?? this.session,
    pairId: pairId.present ? pairId.value : this.pairId,
    tradeSetupId: tradeSetupId.present ? tradeSetupId.value : this.tradeSetupId,
    poiId: poiId.present ? poiId.value : this.poiId,
    signalId: signalId.present ? signalId.value : this.signalId,
    pricePatternId:
        pricePatternId.present ? pricePatternId.value : this.pricePatternId,
    timeFrame: timeFrame ?? this.timeFrame,
    position: position ?? this.position,
    winLose: winLose ?? this.winLose,
    profit: profit ?? this.profit,
    riskRewardRatio: riskRewardRatio ?? this.riskRewardRatio,
    fee: fee ?? this.fee,
    noteId: noteId.present ? noteId.value : this.noteId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  JournalData copyWithCompanion(JournalCompanion data) {
    return JournalData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      session: data.session.present ? data.session.value : this.session,
      pairId: data.pairId.present ? data.pairId.value : this.pairId,
      tradeSetupId:
          data.tradeSetupId.present
              ? data.tradeSetupId.value
              : this.tradeSetupId,
      poiId: data.poiId.present ? data.poiId.value : this.poiId,
      signalId: data.signalId.present ? data.signalId.value : this.signalId,
      pricePatternId:
          data.pricePatternId.present
              ? data.pricePatternId.value
              : this.pricePatternId,
      timeFrame: data.timeFrame.present ? data.timeFrame.value : this.timeFrame,
      position: data.position.present ? data.position.value : this.position,
      winLose: data.winLose.present ? data.winLose.value : this.winLose,
      profit: data.profit.present ? data.profit.value : this.profit,
      riskRewardRatio:
          data.riskRewardRatio.present
              ? data.riskRewardRatio.value
              : this.riskRewardRatio,
      fee: data.fee.present ? data.fee.value : this.fee,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('session: $session, ')
          ..write('pairId: $pairId, ')
          ..write('tradeSetupId: $tradeSetupId, ')
          ..write('poiId: $poiId, ')
          ..write('signalId: $signalId, ')
          ..write('pricePatternId: $pricePatternId, ')
          ..write('timeFrame: $timeFrame, ')
          ..write('position: $position, ')
          ..write('winLose: $winLose, ')
          ..write('profit: $profit, ')
          ..write('riskRewardRatio: $riskRewardRatio, ')
          ..write('fee: $fee, ')
          ..write('noteId: $noteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    session,
    pairId,
    tradeSetupId,
    poiId,
    signalId,
    pricePatternId,
    timeFrame,
    position,
    winLose,
    profit,
    riskRewardRatio,
    fee,
    noteId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalData &&
          other.id == this.id &&
          other.date == this.date &&
          other.session == this.session &&
          other.pairId == this.pairId &&
          other.tradeSetupId == this.tradeSetupId &&
          other.poiId == this.poiId &&
          other.signalId == this.signalId &&
          other.pricePatternId == this.pricePatternId &&
          other.timeFrame == this.timeFrame &&
          other.position == this.position &&
          other.winLose == this.winLose &&
          other.profit == this.profit &&
          other.riskRewardRatio == this.riskRewardRatio &&
          other.fee == this.fee &&
          other.noteId == this.noteId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class JournalCompanion extends UpdateCompanion<JournalData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> session;
  final Value<int?> pairId;
  final Value<int?> tradeSetupId;
  final Value<int?> poiId;
  final Value<int?> signalId;
  final Value<int?> pricePatternId;
  final Value<String> timeFrame;
  final Value<String> position;
  final Value<String> winLose;
  final Value<double> profit;
  final Value<double> riskRewardRatio;
  final Value<double> fee;
  final Value<int?> noteId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const JournalCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.session = const Value.absent(),
    this.pairId = const Value.absent(),
    this.tradeSetupId = const Value.absent(),
    this.poiId = const Value.absent(),
    this.signalId = const Value.absent(),
    this.pricePatternId = const Value.absent(),
    this.timeFrame = const Value.absent(),
    this.position = const Value.absent(),
    this.winLose = const Value.absent(),
    this.profit = const Value.absent(),
    this.riskRewardRatio = const Value.absent(),
    this.fee = const Value.absent(),
    this.noteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  JournalCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String session,
    this.pairId = const Value.absent(),
    this.tradeSetupId = const Value.absent(),
    this.poiId = const Value.absent(),
    this.signalId = const Value.absent(),
    this.pricePatternId = const Value.absent(),
    required String timeFrame,
    required String position,
    required String winLose,
    required double profit,
    required double riskRewardRatio,
    required double fee,
    this.noteId = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : date = Value(date),
       session = Value(session),
       timeFrame = Value(timeFrame),
       position = Value(position),
       winLose = Value(winLose),
       profit = Value(profit),
       riskRewardRatio = Value(riskRewardRatio),
       fee = Value(fee),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<JournalData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? session,
    Expression<int>? pairId,
    Expression<int>? tradeSetupId,
    Expression<int>? poiId,
    Expression<int>? signalId,
    Expression<int>? pricePatternId,
    Expression<String>? timeFrame,
    Expression<String>? position,
    Expression<String>? winLose,
    Expression<double>? profit,
    Expression<double>? riskRewardRatio,
    Expression<double>? fee,
    Expression<int>? noteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (session != null) 'session': session,
      if (pairId != null) 'pair_id': pairId,
      if (tradeSetupId != null) 'trade_setup_id': tradeSetupId,
      if (poiId != null) 'poi_id': poiId,
      if (signalId != null) 'signal_id': signalId,
      if (pricePatternId != null) 'price_pattern_id': pricePatternId,
      if (timeFrame != null) 'time_frame': timeFrame,
      if (position != null) 'position': position,
      if (winLose != null) 'win_lose': winLose,
      if (profit != null) 'profit': profit,
      if (riskRewardRatio != null) 'risk_reward_ratio': riskRewardRatio,
      if (fee != null) 'fee': fee,
      if (noteId != null) 'note_id': noteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  JournalCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<String>? session,
    Value<int?>? pairId,
    Value<int?>? tradeSetupId,
    Value<int?>? poiId,
    Value<int?>? signalId,
    Value<int?>? pricePatternId,
    Value<String>? timeFrame,
    Value<String>? position,
    Value<String>? winLose,
    Value<double>? profit,
    Value<double>? riskRewardRatio,
    Value<double>? fee,
    Value<int?>? noteId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return JournalCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      session: session ?? this.session,
      pairId: pairId ?? this.pairId,
      tradeSetupId: tradeSetupId ?? this.tradeSetupId,
      poiId: poiId ?? this.poiId,
      signalId: signalId ?? this.signalId,
      pricePatternId: pricePatternId ?? this.pricePatternId,
      timeFrame: timeFrame ?? this.timeFrame,
      position: position ?? this.position,
      winLose: winLose ?? this.winLose,
      profit: profit ?? this.profit,
      riskRewardRatio: riskRewardRatio ?? this.riskRewardRatio,
      fee: fee ?? this.fee,
      noteId: noteId ?? this.noteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (session.present) {
      map['session'] = Variable<String>(session.value);
    }
    if (pairId.present) {
      map['pair_id'] = Variable<int>(pairId.value);
    }
    if (tradeSetupId.present) {
      map['trade_setup_id'] = Variable<int>(tradeSetupId.value);
    }
    if (poiId.present) {
      map['poi_id'] = Variable<int>(poiId.value);
    }
    if (signalId.present) {
      map['signal_id'] = Variable<int>(signalId.value);
    }
    if (pricePatternId.present) {
      map['price_pattern_id'] = Variable<int>(pricePatternId.value);
    }
    if (timeFrame.present) {
      map['time_frame'] = Variable<String>(timeFrame.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (winLose.present) {
      map['win_lose'] = Variable<String>(winLose.value);
    }
    if (profit.present) {
      map['profit'] = Variable<double>(profit.value);
    }
    if (riskRewardRatio.present) {
      map['risk_reward_ratio'] = Variable<double>(riskRewardRatio.value);
    }
    if (fee.present) {
      map['fee'] = Variable<double>(fee.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<int>(noteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('session: $session, ')
          ..write('pairId: $pairId, ')
          ..write('tradeSetupId: $tradeSetupId, ')
          ..write('poiId: $poiId, ')
          ..write('signalId: $signalId, ')
          ..write('pricePatternId: $pricePatternId, ')
          ..write('timeFrame: $timeFrame, ')
          ..write('position: $position, ')
          ..write('winLose: $winLose, ')
          ..write('profit: $profit, ')
          ..write('riskRewardRatio: $riskRewardRatio, ')
          ..write('fee: $fee, ')
          ..write('noteId: $noteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PoiTable extends Poi with TableInfo<$PoiTable, PoiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PoiTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailMeta = const VerificationMeta('detail');
  @override
  late final GeneratedColumn<String> detail = GeneratedColumn<String>(
    'detail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    detail,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'poi';
  @override
  VerificationContext validateIntegrity(
    Insertable<PoiData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('detail')) {
      context.handle(
        _detailMeta,
        detail.isAcceptableOrUnknown(data['detail']!, _detailMeta),
      );
    } else if (isInserting) {
      context.missing(_detailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PoiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PoiData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      detail:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}detail'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $PoiTable createAlias(String alias) {
    return $PoiTable(attachedDatabase, alias);
  }
}

class PoiData extends DataClass implements Insertable<PoiData> {
  final int id;
  final String name;
  final String detail;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PoiData({
    required this.id,
    required this.name,
    required this.detail,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['detail'] = Variable<String>(detail);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PoiCompanion toCompanion(bool nullToAbsent) {
    return PoiCompanion(
      id: Value(id),
      name: Value(name),
      detail: Value(detail),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PoiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PoiData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      detail: serializer.fromJson<String>(json['detail']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'detail': serializer.toJson<String>(detail),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PoiData copyWith({
    int? id,
    String? name,
    String? detail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PoiData(
    id: id ?? this.id,
    name: name ?? this.name,
    detail: detail ?? this.detail,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PoiData copyWithCompanion(PoiCompanion data) {
    return PoiData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      detail: data.detail.present ? data.detail.value : this.detail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PoiData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, detail, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PoiData &&
          other.id == this.id &&
          other.name == this.name &&
          other.detail == this.detail &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PoiCompanion extends UpdateCompanion<PoiData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> detail;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PoiCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.detail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PoiCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String detail,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       detail = Value(detail),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PoiData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? detail,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (detail != null) 'detail': detail,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PoiCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? detail,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return PoiCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      detail: detail ?? this.detail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String>(detail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PoiCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SignalTable extends Signal with TableInfo<$SignalTable, SignalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SignalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailMeta = const VerificationMeta('detail');
  @override
  late final GeneratedColumn<String> detail = GeneratedColumn<String>(
    'detail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    detail,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'signal';
  @override
  VerificationContext validateIntegrity(
    Insertable<SignalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('detail')) {
      context.handle(
        _detailMeta,
        detail.isAcceptableOrUnknown(data['detail']!, _detailMeta),
      );
    } else if (isInserting) {
      context.missing(_detailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SignalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SignalData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      detail:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}detail'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $SignalTable createAlias(String alias) {
    return $SignalTable(attachedDatabase, alias);
  }
}

class SignalData extends DataClass implements Insertable<SignalData> {
  final int id;
  final String name;
  final String detail;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SignalData({
    required this.id,
    required this.name,
    required this.detail,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['detail'] = Variable<String>(detail);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SignalCompanion toCompanion(bool nullToAbsent) {
    return SignalCompanion(
      id: Value(id),
      name: Value(name),
      detail: Value(detail),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SignalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SignalData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      detail: serializer.fromJson<String>(json['detail']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'detail': serializer.toJson<String>(detail),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SignalData copyWith({
    int? id,
    String? name,
    String? detail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SignalData(
    id: id ?? this.id,
    name: name ?? this.name,
    detail: detail ?? this.detail,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SignalData copyWithCompanion(SignalCompanion data) {
    return SignalData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      detail: data.detail.present ? data.detail.value : this.detail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SignalData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, detail, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignalData &&
          other.id == this.id &&
          other.name == this.name &&
          other.detail == this.detail &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SignalCompanion extends UpdateCompanion<SignalData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> detail;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SignalCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.detail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SignalCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String detail,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       detail = Value(detail),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SignalData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? detail,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (detail != null) 'detail': detail,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SignalCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? detail,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SignalCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      detail: detail ?? this.detail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String>(detail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SignalCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PricePatternTable extends PricePattern
    with TableInfo<$PricePatternTable, PricePatternData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PricePatternTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailMeta = const VerificationMeta('detail');
  @override
  late final GeneratedColumn<String> detail = GeneratedColumn<String>(
    'detail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    detail,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'price_pattern';
  @override
  VerificationContext validateIntegrity(
    Insertable<PricePatternData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('detail')) {
      context.handle(
        _detailMeta,
        detail.isAcceptableOrUnknown(data['detail']!, _detailMeta),
      );
    } else if (isInserting) {
      context.missing(_detailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PricePatternData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PricePatternData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      detail:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}detail'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $PricePatternTable createAlias(String alias) {
    return $PricePatternTable(attachedDatabase, alias);
  }
}

class PricePatternData extends DataClass
    implements Insertable<PricePatternData> {
  final int id;
  final String name;
  final String detail;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PricePatternData({
    required this.id,
    required this.name,
    required this.detail,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['detail'] = Variable<String>(detail);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PricePatternCompanion toCompanion(bool nullToAbsent) {
    return PricePatternCompanion(
      id: Value(id),
      name: Value(name),
      detail: Value(detail),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PricePatternData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PricePatternData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      detail: serializer.fromJson<String>(json['detail']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'detail': serializer.toJson<String>(detail),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PricePatternData copyWith({
    int? id,
    String? name,
    String? detail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PricePatternData(
    id: id ?? this.id,
    name: name ?? this.name,
    detail: detail ?? this.detail,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PricePatternData copyWithCompanion(PricePatternCompanion data) {
    return PricePatternData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      detail: data.detail.present ? data.detail.value : this.detail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PricePatternData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, detail, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PricePatternData &&
          other.id == this.id &&
          other.name == this.name &&
          other.detail == this.detail &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PricePatternCompanion extends UpdateCompanion<PricePatternData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> detail;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PricePatternCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.detail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PricePatternCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String detail,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       detail = Value(detail),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PricePatternData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? detail,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (detail != null) 'detail': detail,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PricePatternCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? detail,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return PricePatternCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      detail: detail ?? this.detail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String>(detail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PricePatternCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NoteTable extends Note with TableInfo<$NoteTable, NoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _detailMeta = const VerificationMeta('detail');
  @override
  late final GeneratedColumn<String> detail = GeneratedColumn<String>(
    'detail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _beforePictureMeta = const VerificationMeta(
    'beforePicture',
  );
  @override
  late final GeneratedColumn<Uint8List> beforePicture =
      GeneratedColumn<Uint8List>(
        'before_picture',
        aliasedName,
        true,
        type: DriftSqlType.blob,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _afterPictureMeta = const VerificationMeta(
    'afterPicture',
  );
  @override
  late final GeneratedColumn<Uint8List> afterPicture =
      GeneratedColumn<Uint8List>(
        'after_picture',
        aliasedName,
        true,
        type: DriftSqlType.blob,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    detail,
    beforePicture,
    afterPicture,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('detail')) {
      context.handle(
        _detailMeta,
        detail.isAcceptableOrUnknown(data['detail']!, _detailMeta),
      );
    } else if (isInserting) {
      context.missing(_detailMeta);
    }
    if (data.containsKey('before_picture')) {
      context.handle(
        _beforePictureMeta,
        beforePicture.isAcceptableOrUnknown(
          data['before_picture']!,
          _beforePictureMeta,
        ),
      );
    }
    if (data.containsKey('after_picture')) {
      context.handle(
        _afterPictureMeta,
        afterPicture.isAcceptableOrUnknown(
          data['after_picture']!,
          _afterPictureMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      detail:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}detail'],
          )!,
      beforePicture: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}before_picture'],
      ),
      afterPicture: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}after_picture'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $NoteTable createAlias(String alias) {
    return $NoteTable(attachedDatabase, alias);
  }
}

class NoteData extends DataClass implements Insertable<NoteData> {
  final int id;
  final String detail;
  final Uint8List? beforePicture;
  final Uint8List? afterPicture;
  final DateTime createdAt;
  final DateTime updatedAt;
  const NoteData({
    required this.id,
    required this.detail,
    this.beforePicture,
    this.afterPicture,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['detail'] = Variable<String>(detail);
    if (!nullToAbsent || beforePicture != null) {
      map['before_picture'] = Variable<Uint8List>(beforePicture);
    }
    if (!nullToAbsent || afterPicture != null) {
      map['after_picture'] = Variable<Uint8List>(afterPicture);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NoteCompanion toCompanion(bool nullToAbsent) {
    return NoteCompanion(
      id: Value(id),
      detail: Value(detail),
      beforePicture:
          beforePicture == null && nullToAbsent
              ? const Value.absent()
              : Value(beforePicture),
      afterPicture:
          afterPicture == null && nullToAbsent
              ? const Value.absent()
              : Value(afterPicture),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NoteData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteData(
      id: serializer.fromJson<int>(json['id']),
      detail: serializer.fromJson<String>(json['detail']),
      beforePicture: serializer.fromJson<Uint8List?>(json['beforePicture']),
      afterPicture: serializer.fromJson<Uint8List?>(json['afterPicture']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'detail': serializer.toJson<String>(detail),
      'beforePicture': serializer.toJson<Uint8List?>(beforePicture),
      'afterPicture': serializer.toJson<Uint8List?>(afterPicture),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NoteData copyWith({
    int? id,
    String? detail,
    Value<Uint8List?> beforePicture = const Value.absent(),
    Value<Uint8List?> afterPicture = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => NoteData(
    id: id ?? this.id,
    detail: detail ?? this.detail,
    beforePicture:
        beforePicture.present ? beforePicture.value : this.beforePicture,
    afterPicture: afterPicture.present ? afterPicture.value : this.afterPicture,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  NoteData copyWithCompanion(NoteCompanion data) {
    return NoteData(
      id: data.id.present ? data.id.value : this.id,
      detail: data.detail.present ? data.detail.value : this.detail,
      beforePicture:
          data.beforePicture.present
              ? data.beforePicture.value
              : this.beforePicture,
      afterPicture:
          data.afterPicture.present
              ? data.afterPicture.value
              : this.afterPicture,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteData(')
          ..write('id: $id, ')
          ..write('detail: $detail, ')
          ..write('beforePicture: $beforePicture, ')
          ..write('afterPicture: $afterPicture, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    detail,
    $driftBlobEquality.hash(beforePicture),
    $driftBlobEquality.hash(afterPicture),
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteData &&
          other.id == this.id &&
          other.detail == this.detail &&
          $driftBlobEquality.equals(other.beforePicture, this.beforePicture) &&
          $driftBlobEquality.equals(other.afterPicture, this.afterPicture) &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NoteCompanion extends UpdateCompanion<NoteData> {
  final Value<int> id;
  final Value<String> detail;
  final Value<Uint8List?> beforePicture;
  final Value<Uint8List?> afterPicture;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const NoteCompanion({
    this.id = const Value.absent(),
    this.detail = const Value.absent(),
    this.beforePicture = const Value.absent(),
    this.afterPicture = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NoteCompanion.insert({
    this.id = const Value.absent(),
    required String detail,
    this.beforePicture = const Value.absent(),
    this.afterPicture = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : detail = Value(detail),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<NoteData> custom({
    Expression<int>? id,
    Expression<String>? detail,
    Expression<Uint8List>? beforePicture,
    Expression<Uint8List>? afterPicture,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (detail != null) 'detail': detail,
      if (beforePicture != null) 'before_picture': beforePicture,
      if (afterPicture != null) 'after_picture': afterPicture,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NoteCompanion copyWith({
    Value<int>? id,
    Value<String>? detail,
    Value<Uint8List?>? beforePicture,
    Value<Uint8List?>? afterPicture,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return NoteCompanion(
      id: id ?? this.id,
      detail: detail ?? this.detail,
      beforePicture: beforePicture ?? this.beforePicture,
      afterPicture: afterPicture ?? this.afterPicture,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String>(detail.value);
    }
    if (beforePicture.present) {
      map['before_picture'] = Variable<Uint8List>(beforePicture.value);
    }
    if (afterPicture.present) {
      map['after_picture'] = Variable<Uint8List>(afterPicture.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteCompanion(')
          ..write('id: $id, ')
          ..write('detail: $detail, ')
          ..write('beforePicture: $beforePicture, ')
          ..write('afterPicture: $afterPicture, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CurrencyPairsTable extends CurrencyPairs
    with TableInfo<$CurrencyPairsTable, CurrencyPair> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyPairsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailMeta = const VerificationMeta('detail');
  @override
  late final GeneratedColumn<String> detail = GeneratedColumn<String>(
    'detail',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    detail,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency_pairs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CurrencyPair> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('detail')) {
      context.handle(
        _detailMeta,
        detail.isAcceptableOrUnknown(data['detail']!, _detailMeta),
      );
    } else if (isInserting) {
      context.missing(_detailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrencyPair map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyPair(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      detail:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}detail'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $CurrencyPairsTable createAlias(String alias) {
    return $CurrencyPairsTable(attachedDatabase, alias);
  }
}

class CurrencyPair extends DataClass implements Insertable<CurrencyPair> {
  final int id;
  final String name;
  final String detail;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CurrencyPair({
    required this.id,
    required this.name,
    required this.detail,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['detail'] = Variable<String>(detail);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CurrencyPairsCompanion toCompanion(bool nullToAbsent) {
    return CurrencyPairsCompanion(
      id: Value(id),
      name: Value(name),
      detail: Value(detail),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CurrencyPair.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyPair(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      detail: serializer.fromJson<String>(json['detail']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'detail': serializer.toJson<String>(detail),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CurrencyPair copyWith({
    int? id,
    String? name,
    String? detail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CurrencyPair(
    id: id ?? this.id,
    name: name ?? this.name,
    detail: detail ?? this.detail,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CurrencyPair copyWithCompanion(CurrencyPairsCompanion data) {
    return CurrencyPair(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      detail: data.detail.present ? data.detail.value : this.detail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyPair(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, detail, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyPair &&
          other.id == this.id &&
          other.name == this.name &&
          other.detail == this.detail &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CurrencyPairsCompanion extends UpdateCompanion<CurrencyPair> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> detail;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CurrencyPairsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.detail = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CurrencyPairsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String detail,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       detail = Value(detail),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CurrencyPair> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? detail,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (detail != null) 'detail': detail,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CurrencyPairsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? detail,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CurrencyPairsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      detail: detail ?? this.detail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String>(detail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyPairsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PortTable port = $PortTable(this);
  late final $TradeSetupTable tradeSetup = $TradeSetupTable(this);
  late final $JournalTable journal = $JournalTable(this);
  late final $PoiTable poi = $PoiTable(this);
  late final $SignalTable signal = $SignalTable(this);
  late final $PricePatternTable pricePattern = $PricePatternTable(this);
  late final $NoteTable note = $NoteTable(this);
  late final $CurrencyPairsTable currencyPairs = $CurrencyPairsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    port,
    tradeSetup,
    journal,
    poi,
    signal,
    pricePattern,
    note,
    currencyPairs,
  ];
}

typedef $$PortTableCreateCompanionBuilder =
    PortCompanion Function({
      Value<int> id,
      required String name,
      required double portSize,
      required double riskPerTrade,
      required double costPerTrade,
      Value<int?> journalId,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$PortTableUpdateCompanionBuilder =
    PortCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> portSize,
      Value<double> riskPerTrade,
      Value<double> costPerTrade,
      Value<int?> journalId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$PortTableFilterComposer extends Composer<_$AppDatabase, $PortTable> {
  $$PortTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get portSize => $composableBuilder(
    column: $table.portSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get riskPerTrade => $composableBuilder(
    column: $table.riskPerTrade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costPerTrade => $composableBuilder(
    column: $table.costPerTrade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get journalId => $composableBuilder(
    column: $table.journalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PortTableOrderingComposer extends Composer<_$AppDatabase, $PortTable> {
  $$PortTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get portSize => $composableBuilder(
    column: $table.portSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get riskPerTrade => $composableBuilder(
    column: $table.riskPerTrade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costPerTrade => $composableBuilder(
    column: $table.costPerTrade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get journalId => $composableBuilder(
    column: $table.journalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PortTableAnnotationComposer
    extends Composer<_$AppDatabase, $PortTable> {
  $$PortTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get portSize =>
      $composableBuilder(column: $table.portSize, builder: (column) => column);

  GeneratedColumn<double> get riskPerTrade => $composableBuilder(
    column: $table.riskPerTrade,
    builder: (column) => column,
  );

  GeneratedColumn<double> get costPerTrade => $composableBuilder(
    column: $table.costPerTrade,
    builder: (column) => column,
  );

  GeneratedColumn<int> get journalId =>
      $composableBuilder(column: $table.journalId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PortTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PortTable,
          PortData,
          $$PortTableFilterComposer,
          $$PortTableOrderingComposer,
          $$PortTableAnnotationComposer,
          $$PortTableCreateCompanionBuilder,
          $$PortTableUpdateCompanionBuilder,
          (PortData, BaseReferences<_$AppDatabase, $PortTable, PortData>),
          PortData,
          PrefetchHooks Function()
        > {
  $$PortTableTableManager(_$AppDatabase db, $PortTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PortTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PortTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PortTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> portSize = const Value.absent(),
                Value<double> riskPerTrade = const Value.absent(),
                Value<double> costPerTrade = const Value.absent(),
                Value<int?> journalId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PortCompanion(
                id: id,
                name: name,
                portSize: portSize,
                riskPerTrade: riskPerTrade,
                costPerTrade: costPerTrade,
                journalId: journalId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double portSize,
                required double riskPerTrade,
                required double costPerTrade,
                Value<int?> journalId = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => PortCompanion.insert(
                id: id,
                name: name,
                portSize: portSize,
                riskPerTrade: riskPerTrade,
                costPerTrade: costPerTrade,
                journalId: journalId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PortTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PortTable,
      PortData,
      $$PortTableFilterComposer,
      $$PortTableOrderingComposer,
      $$PortTableAnnotationComposer,
      $$PortTableCreateCompanionBuilder,
      $$PortTableUpdateCompanionBuilder,
      (PortData, BaseReferences<_$AppDatabase, $PortTable, PortData>),
      PortData,
      PrefetchHooks Function()
    >;
typedef $$TradeSetupTableCreateCompanionBuilder =
    TradeSetupCompanion Function({
      Value<int> id,
      required String name,
      required String detail,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$TradeSetupTableUpdateCompanionBuilder =
    TradeSetupCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> detail,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$TradeSetupTableFilterComposer
    extends Composer<_$AppDatabase, $TradeSetupTable> {
  $$TradeSetupTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TradeSetupTableOrderingComposer
    extends Composer<_$AppDatabase, $TradeSetupTable> {
  $$TradeSetupTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TradeSetupTableAnnotationComposer
    extends Composer<_$AppDatabase, $TradeSetupTable> {
  $$TradeSetupTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get detail =>
      $composableBuilder(column: $table.detail, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TradeSetupTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TradeSetupTable,
          TradeSetupData,
          $$TradeSetupTableFilterComposer,
          $$TradeSetupTableOrderingComposer,
          $$TradeSetupTableAnnotationComposer,
          $$TradeSetupTableCreateCompanionBuilder,
          $$TradeSetupTableUpdateCompanionBuilder,
          (
            TradeSetupData,
            BaseReferences<_$AppDatabase, $TradeSetupTable, TradeSetupData>,
          ),
          TradeSetupData,
          PrefetchHooks Function()
        > {
  $$TradeSetupTableTableManager(_$AppDatabase db, $TradeSetupTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TradeSetupTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TradeSetupTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TradeSetupTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> detail = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TradeSetupCompanion(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String detail,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => TradeSetupCompanion.insert(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TradeSetupTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TradeSetupTable,
      TradeSetupData,
      $$TradeSetupTableFilterComposer,
      $$TradeSetupTableOrderingComposer,
      $$TradeSetupTableAnnotationComposer,
      $$TradeSetupTableCreateCompanionBuilder,
      $$TradeSetupTableUpdateCompanionBuilder,
      (
        TradeSetupData,
        BaseReferences<_$AppDatabase, $TradeSetupTable, TradeSetupData>,
      ),
      TradeSetupData,
      PrefetchHooks Function()
    >;
typedef $$JournalTableCreateCompanionBuilder =
    JournalCompanion Function({
      Value<int> id,
      required DateTime date,
      required String session,
      Value<int?> pairId,
      Value<int?> tradeSetupId,
      Value<int?> poiId,
      Value<int?> signalId,
      Value<int?> pricePatternId,
      required String timeFrame,
      required String position,
      required String winLose,
      required double profit,
      required double riskRewardRatio,
      required double fee,
      Value<int?> noteId,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$JournalTableUpdateCompanionBuilder =
    JournalCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<String> session,
      Value<int?> pairId,
      Value<int?> tradeSetupId,
      Value<int?> poiId,
      Value<int?> signalId,
      Value<int?> pricePatternId,
      Value<String> timeFrame,
      Value<String> position,
      Value<String> winLose,
      Value<double> profit,
      Value<double> riskRewardRatio,
      Value<double> fee,
      Value<int?> noteId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$JournalTableFilterComposer
    extends Composer<_$AppDatabase, $JournalTable> {
  $$JournalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get session => $composableBuilder(
    column: $table.session,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pairId => $composableBuilder(
    column: $table.pairId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tradeSetupId => $composableBuilder(
    column: $table.tradeSetupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get poiId => $composableBuilder(
    column: $table.poiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get signalId => $composableBuilder(
    column: $table.signalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pricePatternId => $composableBuilder(
    column: $table.pricePatternId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timeFrame => $composableBuilder(
    column: $table.timeFrame,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get winLose => $composableBuilder(
    column: $table.winLose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get profit => $composableBuilder(
    column: $table.profit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get riskRewardRatio => $composableBuilder(
    column: $table.riskRewardRatio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noteId => $composableBuilder(
    column: $table.noteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JournalTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalTable> {
  $$JournalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get session => $composableBuilder(
    column: $table.session,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pairId => $composableBuilder(
    column: $table.pairId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tradeSetupId => $composableBuilder(
    column: $table.tradeSetupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get poiId => $composableBuilder(
    column: $table.poiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get signalId => $composableBuilder(
    column: $table.signalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pricePatternId => $composableBuilder(
    column: $table.pricePatternId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timeFrame => $composableBuilder(
    column: $table.timeFrame,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get winLose => $composableBuilder(
    column: $table.winLose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get profit => $composableBuilder(
    column: $table.profit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get riskRewardRatio => $composableBuilder(
    column: $table.riskRewardRatio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noteId => $composableBuilder(
    column: $table.noteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JournalTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalTable> {
  $$JournalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get session =>
      $composableBuilder(column: $table.session, builder: (column) => column);

  GeneratedColumn<int> get pairId =>
      $composableBuilder(column: $table.pairId, builder: (column) => column);

  GeneratedColumn<int> get tradeSetupId => $composableBuilder(
    column: $table.tradeSetupId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get poiId =>
      $composableBuilder(column: $table.poiId, builder: (column) => column);

  GeneratedColumn<int> get signalId =>
      $composableBuilder(column: $table.signalId, builder: (column) => column);

  GeneratedColumn<int> get pricePatternId => $composableBuilder(
    column: $table.pricePatternId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timeFrame =>
      $composableBuilder(column: $table.timeFrame, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get winLose =>
      $composableBuilder(column: $table.winLose, builder: (column) => column);

  GeneratedColumn<double> get profit =>
      $composableBuilder(column: $table.profit, builder: (column) => column);

  GeneratedColumn<double> get riskRewardRatio => $composableBuilder(
    column: $table.riskRewardRatio,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fee =>
      $composableBuilder(column: $table.fee, builder: (column) => column);

  GeneratedColumn<int> get noteId =>
      $composableBuilder(column: $table.noteId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$JournalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalTable,
          JournalData,
          $$JournalTableFilterComposer,
          $$JournalTableOrderingComposer,
          $$JournalTableAnnotationComposer,
          $$JournalTableCreateCompanionBuilder,
          $$JournalTableUpdateCompanionBuilder,
          (
            JournalData,
            BaseReferences<_$AppDatabase, $JournalTable, JournalData>,
          ),
          JournalData,
          PrefetchHooks Function()
        > {
  $$JournalTableTableManager(_$AppDatabase db, $JournalTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$JournalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$JournalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$JournalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> session = const Value.absent(),
                Value<int?> pairId = const Value.absent(),
                Value<int?> tradeSetupId = const Value.absent(),
                Value<int?> poiId = const Value.absent(),
                Value<int?> signalId = const Value.absent(),
                Value<int?> pricePatternId = const Value.absent(),
                Value<String> timeFrame = const Value.absent(),
                Value<String> position = const Value.absent(),
                Value<String> winLose = const Value.absent(),
                Value<double> profit = const Value.absent(),
                Value<double> riskRewardRatio = const Value.absent(),
                Value<double> fee = const Value.absent(),
                Value<int?> noteId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => JournalCompanion(
                id: id,
                date: date,
                session: session,
                pairId: pairId,
                tradeSetupId: tradeSetupId,
                poiId: poiId,
                signalId: signalId,
                pricePatternId: pricePatternId,
                timeFrame: timeFrame,
                position: position,
                winLose: winLose,
                profit: profit,
                riskRewardRatio: riskRewardRatio,
                fee: fee,
                noteId: noteId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required String session,
                Value<int?> pairId = const Value.absent(),
                Value<int?> tradeSetupId = const Value.absent(),
                Value<int?> poiId = const Value.absent(),
                Value<int?> signalId = const Value.absent(),
                Value<int?> pricePatternId = const Value.absent(),
                required String timeFrame,
                required String position,
                required String winLose,
                required double profit,
                required double riskRewardRatio,
                required double fee,
                Value<int?> noteId = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => JournalCompanion.insert(
                id: id,
                date: date,
                session: session,
                pairId: pairId,
                tradeSetupId: tradeSetupId,
                poiId: poiId,
                signalId: signalId,
                pricePatternId: pricePatternId,
                timeFrame: timeFrame,
                position: position,
                winLose: winLose,
                profit: profit,
                riskRewardRatio: riskRewardRatio,
                fee: fee,
                noteId: noteId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JournalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalTable,
      JournalData,
      $$JournalTableFilterComposer,
      $$JournalTableOrderingComposer,
      $$JournalTableAnnotationComposer,
      $$JournalTableCreateCompanionBuilder,
      $$JournalTableUpdateCompanionBuilder,
      (JournalData, BaseReferences<_$AppDatabase, $JournalTable, JournalData>),
      JournalData,
      PrefetchHooks Function()
    >;
typedef $$PoiTableCreateCompanionBuilder =
    PoiCompanion Function({
      Value<int> id,
      required String name,
      required String detail,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$PoiTableUpdateCompanionBuilder =
    PoiCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> detail,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$PoiTableFilterComposer extends Composer<_$AppDatabase, $PoiTable> {
  $$PoiTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PoiTableOrderingComposer extends Composer<_$AppDatabase, $PoiTable> {
  $$PoiTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PoiTableAnnotationComposer extends Composer<_$AppDatabase, $PoiTable> {
  $$PoiTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get detail =>
      $composableBuilder(column: $table.detail, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PoiTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PoiTable,
          PoiData,
          $$PoiTableFilterComposer,
          $$PoiTableOrderingComposer,
          $$PoiTableAnnotationComposer,
          $$PoiTableCreateCompanionBuilder,
          $$PoiTableUpdateCompanionBuilder,
          (PoiData, BaseReferences<_$AppDatabase, $PoiTable, PoiData>),
          PoiData,
          PrefetchHooks Function()
        > {
  $$PoiTableTableManager(_$AppDatabase db, $PoiTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PoiTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PoiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PoiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> detail = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PoiCompanion(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String detail,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => PoiCompanion.insert(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PoiTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PoiTable,
      PoiData,
      $$PoiTableFilterComposer,
      $$PoiTableOrderingComposer,
      $$PoiTableAnnotationComposer,
      $$PoiTableCreateCompanionBuilder,
      $$PoiTableUpdateCompanionBuilder,
      (PoiData, BaseReferences<_$AppDatabase, $PoiTable, PoiData>),
      PoiData,
      PrefetchHooks Function()
    >;
typedef $$SignalTableCreateCompanionBuilder =
    SignalCompanion Function({
      Value<int> id,
      required String name,
      required String detail,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$SignalTableUpdateCompanionBuilder =
    SignalCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> detail,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$SignalTableFilterComposer
    extends Composer<_$AppDatabase, $SignalTable> {
  $$SignalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SignalTableOrderingComposer
    extends Composer<_$AppDatabase, $SignalTable> {
  $$SignalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SignalTableAnnotationComposer
    extends Composer<_$AppDatabase, $SignalTable> {
  $$SignalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get detail =>
      $composableBuilder(column: $table.detail, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SignalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SignalTable,
          SignalData,
          $$SignalTableFilterComposer,
          $$SignalTableOrderingComposer,
          $$SignalTableAnnotationComposer,
          $$SignalTableCreateCompanionBuilder,
          $$SignalTableUpdateCompanionBuilder,
          (SignalData, BaseReferences<_$AppDatabase, $SignalTable, SignalData>),
          SignalData,
          PrefetchHooks Function()
        > {
  $$SignalTableTableManager(_$AppDatabase db, $SignalTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SignalTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SignalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SignalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> detail = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SignalCompanion(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String detail,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => SignalCompanion.insert(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SignalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SignalTable,
      SignalData,
      $$SignalTableFilterComposer,
      $$SignalTableOrderingComposer,
      $$SignalTableAnnotationComposer,
      $$SignalTableCreateCompanionBuilder,
      $$SignalTableUpdateCompanionBuilder,
      (SignalData, BaseReferences<_$AppDatabase, $SignalTable, SignalData>),
      SignalData,
      PrefetchHooks Function()
    >;
typedef $$PricePatternTableCreateCompanionBuilder =
    PricePatternCompanion Function({
      Value<int> id,
      required String name,
      required String detail,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$PricePatternTableUpdateCompanionBuilder =
    PricePatternCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> detail,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$PricePatternTableFilterComposer
    extends Composer<_$AppDatabase, $PricePatternTable> {
  $$PricePatternTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PricePatternTableOrderingComposer
    extends Composer<_$AppDatabase, $PricePatternTable> {
  $$PricePatternTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PricePatternTableAnnotationComposer
    extends Composer<_$AppDatabase, $PricePatternTable> {
  $$PricePatternTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get detail =>
      $composableBuilder(column: $table.detail, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PricePatternTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PricePatternTable,
          PricePatternData,
          $$PricePatternTableFilterComposer,
          $$PricePatternTableOrderingComposer,
          $$PricePatternTableAnnotationComposer,
          $$PricePatternTableCreateCompanionBuilder,
          $$PricePatternTableUpdateCompanionBuilder,
          (
            PricePatternData,
            BaseReferences<_$AppDatabase, $PricePatternTable, PricePatternData>,
          ),
          PricePatternData,
          PrefetchHooks Function()
        > {
  $$PricePatternTableTableManager(_$AppDatabase db, $PricePatternTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PricePatternTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PricePatternTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$PricePatternTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> detail = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PricePatternCompanion(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String detail,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => PricePatternCompanion.insert(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PricePatternTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PricePatternTable,
      PricePatternData,
      $$PricePatternTableFilterComposer,
      $$PricePatternTableOrderingComposer,
      $$PricePatternTableAnnotationComposer,
      $$PricePatternTableCreateCompanionBuilder,
      $$PricePatternTableUpdateCompanionBuilder,
      (
        PricePatternData,
        BaseReferences<_$AppDatabase, $PricePatternTable, PricePatternData>,
      ),
      PricePatternData,
      PrefetchHooks Function()
    >;
typedef $$NoteTableCreateCompanionBuilder =
    NoteCompanion Function({
      Value<int> id,
      required String detail,
      Value<Uint8List?> beforePicture,
      Value<Uint8List?> afterPicture,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$NoteTableUpdateCompanionBuilder =
    NoteCompanion Function({
      Value<int> id,
      Value<String> detail,
      Value<Uint8List?> beforePicture,
      Value<Uint8List?> afterPicture,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$NoteTableFilterComposer extends Composer<_$AppDatabase, $NoteTable> {
  $$NoteTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get beforePicture => $composableBuilder(
    column: $table.beforePicture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get afterPicture => $composableBuilder(
    column: $table.afterPicture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NoteTableOrderingComposer extends Composer<_$AppDatabase, $NoteTable> {
  $$NoteTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get beforePicture => $composableBuilder(
    column: $table.beforePicture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get afterPicture => $composableBuilder(
    column: $table.afterPicture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NoteTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteTable> {
  $$NoteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get detail =>
      $composableBuilder(column: $table.detail, builder: (column) => column);

  GeneratedColumn<Uint8List> get beforePicture => $composableBuilder(
    column: $table.beforePicture,
    builder: (column) => column,
  );

  GeneratedColumn<Uint8List> get afterPicture => $composableBuilder(
    column: $table.afterPicture,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$NoteTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NoteTable,
          NoteData,
          $$NoteTableFilterComposer,
          $$NoteTableOrderingComposer,
          $$NoteTableAnnotationComposer,
          $$NoteTableCreateCompanionBuilder,
          $$NoteTableUpdateCompanionBuilder,
          (NoteData, BaseReferences<_$AppDatabase, $NoteTable, NoteData>),
          NoteData,
          PrefetchHooks Function()
        > {
  $$NoteTableTableManager(_$AppDatabase db, $NoteTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$NoteTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$NoteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$NoteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> detail = const Value.absent(),
                Value<Uint8List?> beforePicture = const Value.absent(),
                Value<Uint8List?> afterPicture = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => NoteCompanion(
                id: id,
                detail: detail,
                beforePicture: beforePicture,
                afterPicture: afterPicture,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String detail,
                Value<Uint8List?> beforePicture = const Value.absent(),
                Value<Uint8List?> afterPicture = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => NoteCompanion.insert(
                id: id,
                detail: detail,
                beforePicture: beforePicture,
                afterPicture: afterPicture,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NoteTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NoteTable,
      NoteData,
      $$NoteTableFilterComposer,
      $$NoteTableOrderingComposer,
      $$NoteTableAnnotationComposer,
      $$NoteTableCreateCompanionBuilder,
      $$NoteTableUpdateCompanionBuilder,
      (NoteData, BaseReferences<_$AppDatabase, $NoteTable, NoteData>),
      NoteData,
      PrefetchHooks Function()
    >;
typedef $$CurrencyPairsTableCreateCompanionBuilder =
    CurrencyPairsCompanion Function({
      Value<int> id,
      required String name,
      required String detail,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$CurrencyPairsTableUpdateCompanionBuilder =
    CurrencyPairsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> detail,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$CurrencyPairsTableFilterComposer
    extends Composer<_$AppDatabase, $CurrencyPairsTable> {
  $$CurrencyPairsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CurrencyPairsTableOrderingComposer
    extends Composer<_$AppDatabase, $CurrencyPairsTable> {
  $$CurrencyPairsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detail => $composableBuilder(
    column: $table.detail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CurrencyPairsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CurrencyPairsTable> {
  $$CurrencyPairsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get detail =>
      $composableBuilder(column: $table.detail, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CurrencyPairsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CurrencyPairsTable,
          CurrencyPair,
          $$CurrencyPairsTableFilterComposer,
          $$CurrencyPairsTableOrderingComposer,
          $$CurrencyPairsTableAnnotationComposer,
          $$CurrencyPairsTableCreateCompanionBuilder,
          $$CurrencyPairsTableUpdateCompanionBuilder,
          (
            CurrencyPair,
            BaseReferences<_$AppDatabase, $CurrencyPairsTable, CurrencyPair>,
          ),
          CurrencyPair,
          PrefetchHooks Function()
        > {
  $$CurrencyPairsTableTableManager(_$AppDatabase db, $CurrencyPairsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CurrencyPairsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$CurrencyPairsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CurrencyPairsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> detail = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CurrencyPairsCompanion(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String detail,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => CurrencyPairsCompanion.insert(
                id: id,
                name: name,
                detail: detail,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CurrencyPairsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CurrencyPairsTable,
      CurrencyPair,
      $$CurrencyPairsTableFilterComposer,
      $$CurrencyPairsTableOrderingComposer,
      $$CurrencyPairsTableAnnotationComposer,
      $$CurrencyPairsTableCreateCompanionBuilder,
      $$CurrencyPairsTableUpdateCompanionBuilder,
      (
        CurrencyPair,
        BaseReferences<_$AppDatabase, $CurrencyPairsTable, CurrencyPair>,
      ),
      CurrencyPair,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PortTableTableManager get port => $$PortTableTableManager(_db, _db.port);
  $$TradeSetupTableTableManager get tradeSetup =>
      $$TradeSetupTableTableManager(_db, _db.tradeSetup);
  $$JournalTableTableManager get journal =>
      $$JournalTableTableManager(_db, _db.journal);
  $$PoiTableTableManager get poi => $$PoiTableTableManager(_db, _db.poi);
  $$SignalTableTableManager get signal =>
      $$SignalTableTableManager(_db, _db.signal);
  $$PricePatternTableTableManager get pricePattern =>
      $$PricePatternTableTableManager(_db, _db.pricePattern);
  $$NoteTableTableManager get note => $$NoteTableTableManager(_db, _db.note);
  $$CurrencyPairsTableTableManager get currencyPairs =>
      $$CurrencyPairsTableTableManager(_db, _db.currencyPairs);
}
