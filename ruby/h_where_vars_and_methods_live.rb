
class MyClass
    attr_reader :foo, :bar

    def initialize
        @foo = "foo"

    def big_bang
        @bar = "bar"
    end
end

obj  = MyClass.new
obj2 = MyClass.new

obj.foo                                             # "foo"
obj.bar                                             # nil
obj.instance_variables                              # [:@foo]

obj.big_bang

obj.bar                                             # "bar"
obj.instance_variables                              # [:@foo, :@bar]
obj2.instance_variables                             # [:@foo]


# ================================================


class MyClass
    @foo = "class instance variable"

    def initialize
        @bar = "instance variable"
    end
end

obj = MyClass.new


# ================================================


class MyClass
    def foo
        "foo"
    end
end

obj = MyClass.new

obj.methods - Object.new.methods                # [:foo]
MyClass.instance_methods(false)                 # [:foo]


class MyClass
    def bar
        "bar"
    end
end

obj.methods - Object.new.methods                # [:foo, :bar]


# ================================================


class MyClass
    def foo
    end

    def self.bar
    end

    class << self
        def baz
        end
    end
end

obj = MyClass.new


# ================================================


class MyClass
    def foo
        "foo"
     end
end

obj1 = MyClass.new
obj2 = MyClass.new

def obj1.baz
    "baz"
end

obj1.foo                                                    # "foo"
obj2.foo                                                    # "foo"

obj1.baz                                                    # "baz"
obj2.baz                                                    # NoMethodError: undefined method `baz' for #<MyClass:0x007f9d210d4740>



methods_inherited_from_object = Object.instance_methods

obj2.methods - methods_inherited_from_object                # []
obj1.methods - methods_inherited_from_object                # [:baz]
