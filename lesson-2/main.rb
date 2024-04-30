def greeting()

    name=""
    while name==""
        puts "Введите имя: "
        name=gets.chomp
    end
    
    surname=""
    while surname==""
        puts "Введите фамилию: "
        surname=gets.chomp
    end
    
    
    age=0
    while age==0
        puts "Введите возраст: "
        age=gets.chomp.to_i
    end

    if age<18
        return "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учить программировать никогда не рано."
    else
        return "Привет, #{name} #{surname}. Самое время заняться делом!"
    end

end

def foobar(a,b)
    if a==20 || b==20
        return b
    else 
        return a+b
    end
end


puts greeting()
puts foobar(1,20)