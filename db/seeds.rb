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

product_img = 'http://fozzyshop.com.ua/84953-thickbox_default/poroshok-stiralnyj-persil-by-silan-avtomat.jpg'

ptoduct_slide = ['https://img2.zakaz.ua/H2O.1278541827.c9049bad/H2O.1278541827.SNEC1788.obj.40.1.jpg.oe.jpg.pf.jpg.1350x.jpg',
                 'http://plusplus.com.ua/image/cache/import_files/a4/a4f60e41-23a4-11e0-9a1e-6cf04905f7f80-350x350.jpeg',
                 'http://i2.rozetka.ua/goods/1800154/persil_gel_universal_9000100779388_images_1800154547.jpg',
                 'http://i2.rozetka.ua/goods/1800143/persil_color_lavanda_9000100778749_images_1800143914.jpg',
                 'http://www.brydy.net/25-large_default/persil-professional-universal-100-st-65-kg.jpg'
]
product_desc = 'Описание Стиральный порошок Persil Колор 9 кг (9000100143219)

Стиральный порошок Persil Колор от компании Henkel предназначен для стирки цветных вещей. Он отлично удаляет загрязнения и сохраняет яркость вашей одежды.

Новая мощная формула для непревзойденной чистоты и сохранения яркого цвета вашей одежды! Persil насыщенн специальными капсулами с пятновыводителем и имеет в своем составе 6 биоактивных компонентов — энзимов. Во время стирки капсулы быстро растворяются и пятновыводитель направляет всю свою силу непосредственно в пятно. Безупречный результат уже при 20 градусах!

Стиральный порошок Persil Колор получил награду на Международном фестивале-конкурсе «Выбор года» 2015 "Стиральный порошок года"

Подходит для использования в стиральных машинах любого типа в воде любой жесткости.
Отлично справляется с загрязнениями на одежде из хлопка, льна, синтетических тканей и тканей из смешанных волокон. Не подходит для стирки вещей из шерсти и шелка.

Особенности:
Порошок не содержит фосфатов, поэтому безопасен, как при стирке, так и во время эксплуатации вещей. После истечения срока годности порошок можно использовать, как порошок без активных добавок в соответствии с указанным на упаковке способом применения.

Способ применения:
Прочитайте инструкцию по стирке на вещах, которые необходимо постирать! Обратите внимание на максимальную температуру стирки!
Ознакомьтесь с инструкциями завода-производителя стиральной машины! Используйте 150 гр порошка при среднем загрязнении белья и загрузке 4-5 кг (вода мягкая и средней жёсткости)'

Product.create(name: 'Persil из Польши', description: product_desc, price: 150, visible: 1, image: product_img, category_id: 1, twocategory_id: 1 )
 product = Product.first
ptoduct_slide.each {|slide| product.product_slide_images.create(image: slide)}
