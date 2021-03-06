part of bonobo.src.analysis;

class BonoboStructType extends BonoboType {
  final SplayTreeMap<String, BonoboType> fields;

  BonoboStructType(Map<String, BonoboType> fields)
      : this.fields = new SplayTreeMap.from(fields);

  @override
  c.CType get ctype {
    var structType = new c.Struct();
    fields.forEach((name, type) {
      structType.fields.add(new c.Field(type.ctype, name, null));
    });
    return structType;
  }

  @override
  bool get isRoot => false;

  @override
  BonoboType get parent => BonoboType.Root;

  @override
  String get name {
    var b = new StringBuffer('{');

    for (int i = 0; i < fields.length; i++) {
      var name = fields.keys.elementAt(i), type = fields[name];
      if (i > 0) b.write(',');
      b.write(' $name: $type');
    }

    return b.toString() + ' }';
  }

  @override
  bool isAssignableTo(BonoboType other) {
    if (other is! BonoboStructType) return super.isAssignableTo(other);

    var o = other as BonoboStructType;

    for (var key in fields.keys) {
      if (!o.fields.containsKey(key) ||
          !fields[key].isAssignableTo(o.fields[key])) return false;
    }

    return true;
  }

  @override
  bool operator ==(other) {
    if (other is! BonoboStructType) return false;

    var o = other as BonoboStructType;

    for (var key in fields.keys) {
      if (o.fields[key] != fields[key]) return false;
    }

    return true;
  }
}
