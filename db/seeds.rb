# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



category = ['Бытовая химия', 'Продукты питания', 'Средства для ухода', 'Детские товары', 'Полуфабрикаты']
twocategory = {
                'Бытовая химия' => ['Порошки и капсулы', 'Жидкие гели', 'Ополаскиватели', 'Пятновыводители', 'Чисьящие средства'],
                'Продукты питания' => ['Кофе', 'Оливковое масло и оливки', 'Шоколад', 'Чай', 'Какао', 'Консервы и паштеты'],
                'Средства для ухода' => ['Шампуни', 'Мыло', 'Маски и лаки', 'Гели для душа', 'Уход за зубами', 'Средство для бритья'],
                'Детские товары' => ['Игрущки', 'Подгузники', 'Одежда'],
                'Полуфабрикаты' => ['Пельмени и хенкали', 'Чебурки', 'Вареники', 'Блинчики и сырники', 'Котлеты']
}

  category.each {|cat| Category.create(name: cat)}

  twocategory.each do |key, value|
    category = Category.find_by_name(key)
    value.each {|two| category.twocategories.create(name: two)}
  end