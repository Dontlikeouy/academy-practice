# Понимание работы класса Router

Класс, который ...


### Метод 'initialize' 

```ruby
def initialize
    @routes = {}
end
```

Взывает конструктор класса, который определяет переменные такие как:
   - @routes = {} - определяется как глобальная с типом Hash



### Метод 'init' 

```ruby
def init
    resources(PostController, 'posts')
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choose = gets.to_s.chomp

      if choose == '1'
        PostController.connection(@routes['posts'])
      elsif choose == 'q'
        break
      end
    end

    puts 'Good bye!'
  end
```
Инициализирует POST запросы и взаимодействует с пользователем с помощью команд. 

1) Вызывает метод 'resources' и передает в виде параметров: модуль 'PostController' и текст 'posts'

2) Запрашивает у пользователь выбор ресурса для взаимодействие (1 - Posts, 2 - Comments, q - Exit).
    1) Posts - вызывает статический метод 'connection' класса 'PostController' и передаёт в него переменную '@rouses' с идентификатором 'posts'
    2) Comments - ничего не делает
    3) Exit - выходит из метода 'init'

### Метод 'resources'

Создаёт связку между именами POST запросов и методов из класса 'PostController'.
    
1) Создаёт экземпляра класса 'PostController'.  

2) Присваивает в переменную '@routes' связку между Hash ключами Post запросов и вызовами методы из класса 'PostController'. 


```ruby
def resources(post_controller, keyword)
    controller = post_controller.new

    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
```

# Причины, по которым используется extend для модуля Resource

Что бы вызвать метод connection т.к при использовании extend методы являются статическими, все методы примешивают в класс. Иначе необходимо создать экземпляр класса, но экземпляр используется в другой части кода. Это было использовано для разделение метод внутренних и внешних.

```ruby
class PostController
  extend Resource
end
```
