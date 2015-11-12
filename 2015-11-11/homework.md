## Задание на 18 ноября 2015:

1. Создать еще один вью-контроллер `DetailsViewController` и таблицу на нем.
2. В таблице должно быть 5 секций.
3. В каждой секции должно быть по 6 ячеек.
4. В каждой секции ячейка с нулевым индексом должна быть со стилем `UITableViewCellStyleDefault`.
Остальные пять ячеек должны быть со стилем `UITableViewCellStyleValue2`.
5. У вью-контроллера `DetailsViewController` должно быть свойство `city` типа `NSString`.
6. По выбору ячейки с городом в нашем главном вью-контроллере необходимо создать экземпляр `DetailsViewController`, выставить ему свойство `city`, которое соотвествовало бы выбранному городу. Затем необходимо показать (push-презентация) вью-контроллер `DetailsViewController`.
7. Заголовком вью-контроллера послужит строка, созданная по шаблону `"<#cityName#> Weather Forecast"`.

## Что смотреть (ссылки):
- [Методы протокола `UITableViewDataSource`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDataSource_Protocol/).
- [Способы создания `UITableViewCell`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewCell_Class/#//apple_ref/doc/uid/TP40006938-CH3-SW34).
- [Дополнительно: Метод `dequeueReusableCellWithIdentifier:` у `UITableView`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableView_Class/index.html#//apple_ref/occ/instm/UITableView/dequeueReusableCellWithIdentifier:forIndexPath:).

## Ожидаемый результат:
![untitled-2](https://cloud.githubusercontent.com/assets/3193877/7869327/b691d3f4-058a-11e5-8996-3f7f5a2c524f.jpg)