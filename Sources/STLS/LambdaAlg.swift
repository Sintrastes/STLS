
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
            return f(Id(value: x)).fix()
        }
    }
    
    static func apply<A, B>(_ f: Kind<ForId, (A) -> B>, _ x: Kind<ForId, A>) -> Kind<ForId, B> {
        return Id(
            value: f.fix()(x.fix())
        )
    }
}
