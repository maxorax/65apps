# 65apps
Task2
let serialQueue = DispatchQueue(label: "com.foo.bar") 
serialQueue.async {
  print("Work 1") 
  serialQueue.sync {
    print("Work 2") 
  }
}

Т.к. serialQueue последовательная очередь, значит вызов sync из задачи, которая выполняется в той же очереди, приведет к deadlock. 
Чтобы распечаталось "work 2" надо внутри async тоже вызвать async.
