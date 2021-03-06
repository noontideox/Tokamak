//
//  Binding.swift
//  Tokamak
//
//  Created by Max Desiatov on 09/02/2019.
//

typealias Updater<T> = (inout T) -> ()

/** Note that `set` functions are not `mutating`, they never update the
 view's state in-place synchronously, but only schedule an update with
 the renderer at a later time.
 */
@propertyWrapper public struct Binding<Value> {
  public var wrappedValue: Value {
    get { get() }
    nonmutating set { set(newValue) }
  }

  private let get: () -> Value
  private let set: (Value) -> ()

  public var projectedValue: Binding<Value> { self }

  public init(get: @escaping () -> Value, set: @escaping (Value) -> ()) {
    self.get = get
    self.set = set
  }

  public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> {
    .init(
      get: {
        self.wrappedValue[keyPath: keyPath]
      }, set: {
        self.wrappedValue[keyPath: keyPath] = $0
      }
    )
  }
}
