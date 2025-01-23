/*     Object Oriented Programming Notes
  
 During the life of the app, we create and destroy objects
 Create: Initialize (init) the object allocates memory for the object
 Destroy: Deinitialize (deinit). Usually you let deinit happen automatically to deallocate memory (like garbage collecting?)
 
 Automatic Reference Counting (ARC) is the current count of the number of objects in memory
 Only init objects as you need them to minimize memory footprint. So only load screens as needed, don't load all when on the welcome page.
 
 Two Types of Memory on iPhone: Stack and Heap
 
 Heap: Only objects in the Heap are counted towards ARC
 
 Stack: Objects in the Stack: String, Bool, most basic types as well as Structs and Enums
 Heap: Objects in the Heap: Functions, Classes, Actors
 
 Threads: There are multiple threads running on an iPhone simultaneously. Each thread has its own stack, but only one heap for all threads. So a stack is faster than the heap. Also, the stack has a lower memory footprint than heap, so preferable and better to create objects that are on the stack.
 
 Value vs Reference types
 - Objects in the Stack are Value types. When you edit a Value type, you create a copy of it with new data. So if you change a Bool from true to false, a copy of the original is made and then altering it with the new value.
 - Objects in the Heap are Reference types. When you edit a Reference type, you are actually editting the existing object. The reference is actually a pointer to the object in the heap memory.
 
 - You use classes for things like: Manager, DataService, Factory, ViewModel - objects that we create and want to perform actions inside.
 - You use structs for things like: Data Models, Objects that we create and pass around our app
 
 */

struct MyFirstObject { // Value type, on stack
  let title: String = "Hello World!"
}

class MySecondObject { // Reference type, on heap
  let title: String = "Hello World!"
}

