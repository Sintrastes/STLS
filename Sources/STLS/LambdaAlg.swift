
import Bow

protocol LambdaAlg {
    associatedtype F

    static func fun<A, B>(_: @escaping (Kind<F, A>) -> Kind<F, B>) -> Kind<F, (A) -> B>
    static func apply<A, B>(_: Kind<F, (A) -> B>, _: Kind<F,A>) -> Kind<F, B>
}

struct LambdaAlgInterpreter: LambdaAlg {
    typealias F = ForId
    
    static func fun<A, B>(_ f: @escaping (Kind<ForId, A>) -> Kind<ForId, B>) -> Kind<ForId, (A) -> B> {
        return Id { (x: A) in
            return f(Id(x))^.value
        }
    }
    
    static func apply<A, B>(_ f: Kind<ForId, (A) -> B>, _ x: Kind<ForId, A>) -> Kind<ForId, B> {
        return Id(f^.value(x^.value))
    }
}

struct LambdaAlgSerializer: LambdaAlg {
    typealias F = ConstPartial<RawExpr>
    
    static func fun<A, B>(_ f: @escaping (ConstOf<RawExpr, A>) -> ConstOf<RawExpr, B>) -> ConstOf<RawExpr, (A) -> B> {
        return Const(
            f(
                Const(RawExpr.variable(identifier: "x"))
            )^.value
        )
    }
    
    static func apply<A, B>(_ expr1: ConstOf<RawExpr, (A) -> B>, _ expr2: ConstOf<RawExpr, A>) -> ConstOf<RawExpr, B> {
        return Const(
            RawExpr.app(f: expr1^.value, x: expr2^.value)
        )
    }
}
