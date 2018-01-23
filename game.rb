class Game

  def initialize(slovo)
    @letters = get_letters(slovo)

    @errors = 0

    @good_letters = []
    @bad_letters = []

    @status = 0
  end

  def get_letters(slovo)
    if (slovo == nil || slovo == "")
      abort "Вы не ввели слово для игры"
    end

    return slovo.split("")
  end

  # 1. спросить букву с консоли
  # 2. проверить результат
  def ask_next_letter
    puts "\n Введите слудующую букву"

    letter = ""

    while letter == "" do
      letter = STDIN.gets.encode("UTF-8").chomp
    end

    next_step(letter)
  end

  # Метод next_step должен проверить наличие буквы в загаданном слове
  # Или среди уже загаданным букв ( массивы @good_letters, @bad_letters)
  # Аналог метода check_result в первой версии виселицы

  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva)
       @good_letters << bukva

    end

    if @good_letters.size == @letters.uniq.size
       @status = 1
    end

  else
    @bad_letters << bukva
    @errors += 1

    if @errors >= 7
       @errors = -1
    end
  end

  def letters
    return @letters
  end

  def good_letters
    return @good_letters
  end

  def bad_letters
    return @bad_letters
  end

  def status
    return @status
  end

  def errors
    return @errors
  end

end

