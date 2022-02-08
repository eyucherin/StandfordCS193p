# Standford193P
## Day 1( Lectures 1 ~ 4) 
![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)
___
* MVVM DESIGN PATTER 
___
* STRUCTURES AND CLASSES 
* Similarities: 
    *  Pretty much exactly the same syntax 
* Difference between Structs and Class 
  * CLASS : 
      1.  Reference Type
      2.  Passed Around with pointers 
      3.  Object Oriented Programming( Only single inheritence is available) 
      4.  Free Initializers. 
      5.  Always mutabale
      6.  Used in View Model with Observable Object Protocol  when using the MVVM architechture
  * STRUCT: 
      1. Value Types 
      2. Coppies when passed or assigned 
      3. Copy on write 
      4. Functional Programming 
      5. No Inheritence 
      6. Mutability must be explicitely stated

___

* GENERICS: 
  *  We use generics when we dont know what type of data we want to take in. 
  * Arrays are perfect examples. 
    ```Swift
     Struct Array<Element> { 
        func append(_ element: Element) {...}

      }

    ```
  * Array implementation of append knows nothing about the argument and it does not care. Element is not any known struct or class of protocol, it is just a placeholder. 

___

* CLOSURES: 
  * It is so commin to pass functions around that we are very often in lining them. 
  * We call such an inclined function a closure and there is a special language to support for it. 
  * ```Swift
    let payment = { (user: String) -> Bool in
      print("Paying \(user)…")
      return true
      }

    ```
___

## Day 2( Lectures 5) 
![](https://img.shields.io/badge/Xcode-13.2-%231575F9) ![](https://img.shields.io/badge/Swift-5.2.4-%23FA7343)
* Access Control 
   * almost every function or var used inside classes should be marked as private or private(set) 
___
* Computed Properties 
   * provided by classes, structures, and enumerations. 
   * Use 
      1. It depends on other properties
      2. You’re defining the property inside an extension
      3. The property is an access point to another object without disclosing it fully
   *  A Computed Property provides a getter and an optional setter to indirectly access other properties and values. It can be used in several ways.
```Swift
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{
            cards.indices.filter({cards[$0].isFacedUp}).oneAndOnly
        }
        set{
            cards.indices.forEach({cards[$0].isFacedUp = ($0 == newValue)})
        }
        
    }

``` 
___
* Extensions 
    * Functionality of an existing class, structure or enumeration type can be added with the help of extensions.  
    * ```Swift
      extension Array{
          var oneAndOnly: Element? {
              if self.count == 1{
                  return self.first
              } else{
                  return nil
              }
          }
      ```
___
* Property Observers 
   * Detect changes in structs willSet and didSet 
   * newValue -> a special variable(the value is going to get set to) 
   * oldValue -> what the value used to be 
   * willSet 
   * didSet 
___ 
* Layout 
   * Hstack, VStack, LazyVStack, LazyHStack, scrollView, LazyHGrid, LazyVGrid, aspectRatio, padding, GoemetryReader, List, Form, OutlineGroup 
___
* @View Builder 
___ 
# StandfordCS193p
