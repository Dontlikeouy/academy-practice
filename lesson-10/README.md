Что такое ORM, в чём основная задача?

1) ORM - взаимодействия с базой посредством вызова методов у объектов

2) Использовать один язык. Ускорить разработку приложения. Использовать и быстро переключаться между разными базами данных.

В чём принцип работы паттерна Active Record?

Устанавливает соответствие между таблицей в базе данных и классом. Класс - таблица в базе данных. Экземпляр класса - строка в базе данных (запись).

Какие ассоциации можно задать в моделях и как?

ассоциация — это соединение между двумя моделями Active Record.

belongs_to - один к одному, экземпляр модели принадлежит одному экземпляру другой модели. т.е Author не знает, что на неё ссылается Book.

```ruby
class Book < ApplicationRecord
  belongs_to :author
end
```

has_one - один к одному, ассоциация указывает, что еще одна модель имеет ссылку на эту модель. т.е Supplier знает, что на неё ссылается Account.

```ruby
class Supplier < ApplicationRecord
  has_one :account
end
```

has_many - ассоциация похожа на has_one, но указывает на соединение один-ко-многим с другой моделью. 

```ruby
class Author < ApplicationRecord
  has_many :books
end
```

has_one :through - многие ко многим

```ruby
class Supplier < ApplicationRecord
  has_one :account
  has_one :account_history, through: :account
end

class Account < ApplicationRecord
  belongs_to :supplier
  has_one :account_history
end

class AccountHistory < ApplicationRecord
  belongs_to :account
end
```

Что такое миграция? Зачем нужен schema.rb файл?

1) Миграция - удобный способ изменения схемы базы данных

2) Для описания схемы таблицы/базы данных

Сколько уровней валидации есть в обычном приложении? Как написать свою?

1) Уровни:
 - Client
 - Controller
 - Model
 - Database

2) 

```ruby
class Test < ApplicationRecord
    validate :text
    
    private 

    def text
        return if text.blank?
        errors.add(:text, "is empty")
    end
end
```

Что такое callback и какой их практический смысл?

1) callback - функция обратного вызова

2) управлять жизненным циклом приложения

В чём заключается n+1 проблема? Как её можно решить?

1) множественные запросы

2) загрузить предварительно данные