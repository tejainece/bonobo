part of bonobo.src.analysis;

class BonoboTypedef extends BonoboType {
  @override
  final String name;
  
  BonoboType _type;

  BonoboTypedef(this.name);

  BonoboType get type => _type ?? BonoboType.Root;

  void set type(BonoboType value) {
    _type ??= value;
  }

  @override
  c.CType get ctype => type.ctype;

  @override
  bool get isRoot => type.isRoot;

  @override
  BonoboType get parent => type.parent;

  @override
  String get documentation => type.documentation;

  @override
  BonoboType postfixOp(Token operator, BonoboAnalyzer analyzer) {
    return type.postfixOp(operator, analyzer);
  }

  @override
  BonoboType binaryOp(Token operator, BonoboType other,
      BonoboAnalyzer analyzer) {
    return type.binaryOp(operator, other, analyzer);
  }

  @override
  BonoboType prefixOp(Token operator, BonoboAnalyzer analyzer) {
    return type.prefixOp(operator, analyzer);
  }

  @override
  bool isAssignableTo(BonoboType other) {
    return type.isAssignableTo(other);
  }

  @override
  bool operator ==(other) {
   return type == other;
  }

  @override
  String toString() => type.toString();

  @override
  BonoboType unsupportedBinaryOperator(Token operator, BonoboType other,
      BonoboAnalyzer analyzer) {
    return type.unsupportedBinaryOperator(operator, other, analyzer);
  }
}
