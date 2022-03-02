/*

  Operadores de tranformacion del publicado
 */

import Combine


print("--------------------------------------------------")
print(" Ejerc-1 operadores")
print("--------------------------------------------------")

let publisher1 = [1,2,3,4,5].publisher

let suscriber1 = publisher1
    .map{
        return "\($0) €"
    }
    .sink {
      print("Ejerc-1 viene: \($0)")
    }
    

print("--------------------------------------------------")
print(" Ejerc-2 Otros operadors")
print("--------------------------------------------------")

let publisher2 = [1,1,2,2,3,4,5,6,7,8,9].publisher


publisher2
    .filter{$0.isMultiple(of: 3) }
    .sink { data in
        print("Ejerc-2 viene: \(data)")
    }


publisher2
    .removeDuplicates()
    .sink { data in
        print("Ejerc-3 viene: \(data)")
    }

publisher2
    .first{ $0 % 3 == 0}
    .sink { data in
        print("Ejerc-4 viene: \(data)")
    }
