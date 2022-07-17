
import Bow

protocol LambdaAlg {
    associatedtype F

    static func fun<A, B>(_: @escaping (Kind<F, A>) -> Kind<F, B>) -> Kind<F, (A) -> B>
    static func apply<A, B>(_: Kind<F, (A) -> B>, _: Kind<F,A>) -> Kind<F, B>
}
