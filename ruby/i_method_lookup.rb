
class MyClass
    def foo
        "Method foo in MyClass"
    end
end

obj = MyClass.new

def obj.foo
    "Singleton method foo"
end

obj.foo                                                    # "Singleton method foo"


# ================================================


class MyClass
     def foo
          "foo"
     end

     def self.bar
          "bar"
     end
end

obj = MyClass.new
obj.foo
obj.bar

MyClass.foo
MyClass.bar


# ================================================


class Parent
    def foo
        "foo in parent"
    end
end

class Child < Parent
end


obj = Child.new
obj.foo                           # "foo in parent


# ================================================


class MyClass
    def method_missing(method_name, *args, &block)
        if method_name == :foo
            # Method implementation
            "Hurray, I’m not missing!"
        else
            super
        end
    end
end

obj = MyClass.new
obj.foo                                                    # "Hurray, I’m not missing!"
obj.bar                                                    # NoMethodError: undefined method `bar' for #<MyClass:0x007f8ab09615d0>


# ================================================


class Parent
    def method_missing(method_name, *args, &block)
        if method_name == :foo
            "method_missing in parent"
        else
            super
        end
    end
end

class Child < Parent
end


obj = Child.new
obj.foo                                                     # "method_missing in parent"


# ================================================


class Object

    def method_missing(method_name, *args, &block)
        raise NoMethodError, "undefined method `#{method_name}' for #{self.inspect}"
    end

end


# ================================================


module Foo
    def foo
        "foo in module Foo"
    end
end

module Bar
    def bar
        "bar in module Bar"
    end
end

class Parent
    def foo
        "foo in Parent"
    end
end

class Child < Parent
    include Foo
    include Bar
end

obj = Child.new
obj.foo                                                     # "foo in module Foo"
obj.bar                                                     # "bar in module Bar"


# ================================================


class Parent
    def foo
        "foo in parent"
    end
end

class Child < Parent
    def method_missing(method_name, *args, &block)
        if method_name == :foo
            # Method implementation
            "Hurray, I’m not missing!"
        else
        	super
        end
    end
end


obj = Child.new
obj.foo                                                    # “Hurray, I’m not missing!"
obj.bar                                                    # NoMethodError: undefined method `bar' for #<MyClass:0x007f8ab09615d0>