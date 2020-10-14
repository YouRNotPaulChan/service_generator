# ServiceGenerator

The generator can build a service class file in your rails app,for example:

```ruby
module TestModule
  # The ApplicationService is follow the Rails
  # style, but you can add the superclasses you
  # define
  class DemoService < ApplicationService
    def initialize(attributes)
      @attributes = attributes
    end

    def call
      # some code
    end

    private

    def method1
    end

    def method2
    end
  end
end
```
## Usage

```bash
$ rails generate service demo_service method1 method2 method3 --module test_module
```

*The `--module` option allows you to add a module to the outer layer of your class, and `method1`、`method2`、`method3`... allows you to add some **private** methods in your service class.*

## Installation

Add this line to your application's Gemfile:

```ruby

gem 'service_generator', github: 'YouRNotPaulChan/service_generator'

```



And then execute:

```bash

$ bundle

```

## Contributing

**todo list**

1. Service test file, Like test_service_spec.rb.
2. There might be some problems with indentation.
3. More features if you need...



## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
