#  Bucket List

## Struct Comparable
- Add `protocol`

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

