
$global_var = "Yes I am!"

class MyClass
    puts "Accessible in class def? #{$global_var}"

    def foo
        puts "Accessible in method? #{$global_var}"
    end

    def self.foo
        puts "Accessible in class method? #{$global_var}"
    end

    $another_global_var = "Defined in MyClass."
end

                                                                # Accessible in class def? Yes I am!
MyClass.new.foo                                                 # Accessible in method? Yes I am!
MyClass.foo                                                     # Accessible in class method? Yes I am!

puts $another_global_var                                        # "Defined in MyClass."

puts global_variables                                           # [:$;, :$-F, :$@, :$!, :$SAFE, :$~, :$&, :$`, :$', :$+, :$=, :$KCODE, :$-K, :$,, :$/, :$-0, :$\, :$_, :$stdin, :$stdout, :$stderr, :$>, :$<, :$., :$FILENAME, :$-i, :$*, :$?, :$$, :$:, :$-I, :$LOAD_PATH, :$", :$LOADED_FEATURES, :$VERBOSE, :$-v, :$-w, :$-W, :$DEBUG, :$-d, :$0, :$PROGRAM_NAME, :$-p, :$-l, :$-a, :$binding, :$global_var, :$another_global_var, :$glb, :$1, :$2, :$3, :$4, :$5, :$6, :$7, :$8, :$9]


# ================================================


class MyClass
    @@class_var = "Shared by all instances of MyClass class."

    def class_var
        @@class_var
    end

    def self.class_var
        @@class_var
    end

    def big_bang
        @@class_var = "Changed by instance."
    end
end


obj1, obj2 = MyClass.new, MyClass.new

obj1.class_var                                                  # "Shared by all instances of MyClass class."
obj2.class_var                                                  # "Shared by all instances of MyClass class."
MyClass.class_var                                               # "Shared by all instances of MyClass class."

obj1.big_bang

obj1.class_var                                                  # "Changed by instance."
obj2.class_var                                                  # "Changed by instance."
MyClass.class_var                                               # "Changed by instance."


# ================================================


class MyClass
    @@class_var = "MyClass class var"

    class InnerClass
        def class_var
            @@class_var
        end
    end

    def class_var
        @@class_var
    end
end

MyClass.new.class_var                      # "MyClass class var" 
MyClass::InnerClass.new.class_var          # NameError: uninitialized class variable @@class_var in MyClass::InnerClass


# ================================================


module M
    def class_var
        @@class_var
    end
end

class MyClass
    include M
    @@class_var = "MyClass class var"
end

MyClass.new.class_var                      # NameError: uninitialized class variable @@class_var in M


# ================================================


class Parent
    @@class_var = "Class var in Parent."
end

class Child < Parent
    def class_var
        @@class_var
    end
end

Child.new.class_var                        # "Class var in Parent."


# ================================================


class MyClass
    @@class_var = "Class variable."
end

MyClass.class_variables                    # [:@@class_var]


# ================================================


class MyClass
    attr_accessor :instance_var

    def initialize
        @instance_variable = "Instance variable"
    end

    def self.instance_var
        @instance_variable
    end

    def big_bang
        @instance_variable = "Changed value!"
    end
end


obj1, obj2 = MyClass.new, MyClass.new

obj1.instance_var                                               # "Instance variable"
obj2.instance_var                                               # "Instance variable"

obj1.big_bang

obj1.instance_var                                               # "Changed value!"
obj2.instance_var                                               # "Instance variable"

MyClass.instance_var                                            # nil


# ================================================


local_var = "Local variable"

def some_method(arg)
    # local_var                             - not accessible
    arg                                     # local variables are created for method arguments
    some_var = 123
end

# args, some_var                            - not available, don't exist anymore


block = lambda do
    block_var = "in lambda def"
    puts local_var
end

puts block_var                              # NameError: undefined local variable or method `block_var' for main:Object
block.call                                  # "Local variable"




class MyClass
    local_var = "in class MyClass"
end

MyClass.class_eval { puts local_var }           # NameError: undefined local variable or method `local_var' for MyClass:Class


# ================================================


TOP_LEVEL = "Top level."

class MyClass
    IN_CLASS = "In class definition body."

    def foo
        ANOTHER_ONE = "Another one in class."
    end
end

module MyModule
    ANOTHER_ONE = "Another one in module."
end


# ================================================


+- main
|  +- TOP_LEVEL
|  |
|  +- MyClass
|  |   +- IN_CLASS
|  |   +- ANOTHER_ONE
|  |
|  +- MyModule
|  |   +- ANOTHER_ONE
