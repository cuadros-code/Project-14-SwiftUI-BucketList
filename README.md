#  Bucket List

## Struct Comparable
- Add protocol `Comparable`

```swift
struct User: Identifiable, Comparable {
    
    let id = UUID()
    var firstName: String
    var lastName: String
    
    // Required when add Comparable protocol
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.firstName < rhs.firstName
    }
    
}
```

- Use
```swift
let users = [
    User(firstName: "Kevin", lastName: "Cuadros"),
    User(firstName: "Andres", lastName: "Montes"),
    User(firstName: "Camila", lastName: "Torrez")
].sorted()
```

## Documents Directory
