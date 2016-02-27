# Поддеражка русского языка
require 'active_support'
require 'active_support/core_ext'

# Объявляем константы
PROGRAM_NAME = 'Корова'
USER_NAME = 'Я'

# Функции
def speech(name)
  name + ': '
end

def tell(name, phrase)
  speech(name) + phrase
end

def process(input)
  r = ''
  input.each do |s|
    if s != 'р'
      r += s
    end
  end
  r
end

# Узнаем имя Краба
puts tell(PROGRAM_NAME, 'Как тебя зовут?')
print speech(USER_NAME)
name = gets.chomp
puts tell(PROGRAM_NAME, 'Привет, ' + name + '!')

while true do

  # Получаем ввод с клавиатуры
  print speech(USER_NAME)
  input = gets.chomp

  # Если нас назвали говядиной, обидеться, если с нами попрощались, попрощаться; иначе быть эхом
  if input.mb_chars.downcase.to_s.include?('говядина') || input.mb_chars.downcase.to_s.include?('говнядина')
    puts tell(PROGRAM_NAME, 'Как вы смеете!?')
  else
    if input.mb_chars.downcase.to_s.include? 'плов'
      puts tell(PROGRAM_NAME, 'Плов?! Дайте мне плов!')
    else
      if input.mb_chars.downcase.to_s.start_with? 'сколько будет '
        puts tell(PROGRAM_NAME, 'Мой ответ ' + eval(input[14, input.size]).to_s)
      else
        if input.mb_chars.downcase.to_s.include?('пока') || input.mb_chars.downcase.to_s.include?('до свидания')
          puts tell(PROGRAM_NAME, 'Пока, ' + name)
          break
        end
        puts tell(PROGRAM_NAME, input + ', ' + name)
      end
    end
  end

end
