# Схема dictionary



### **Таблица [cabinet](cabinet.sql)**
- Хранение номеров кабинетов для уроков

### **Таблица [class](class.sql)**
- Хранит названия всех классов

### **Таблица [days](days.sql)**
- Хранит названия всех дней

### **Таблица [role](role.sql)**
- Хранит названия всех должностей сотрудников

### **Таблица [status](status.sql)**
- Хранит названия всех статусов работников

### **Таблица [subject](subject.sql)**
- Хранит названия всех предметов учеников

## Функции
**[cabinet_upd.sql](functions%2Fcabinet_upd.sql)**

Функция добавления кабинета. Пример заполнения:
````
select dictionary.cabinet_upd('{
  "cabinetname": 34
}');
````
Пример ответа при правильном выполнении:
````
{"data" : null}
````
### [cabinet_getall.sql](functions%2Fcabinet_getall.sql)

Отображение информации в таблице
````
select dictionary.cabinet_getall(NULL);
````
Выводит все данные из таблицы:
`````
"data": [
	{
		"cabinet_id": 2,
		"cabinetname": 11
	},
	{
		"cabinet_id": 3,
		"cabinetname": 12
	},
	{
		"cabinet_id": 4,
		"cabinetname": 13
	},
	{
		"cabinet_id": 5,
		"cabinetname": 14
	},
	{
		"cabinet_id": 6,
		"cabinetname": 15
	},
	{
		"cabinet_id": 7,
		"cabinetname": 16
	},
	{
		"cabinet_id": 8,
		"cabinetname": 17
	},
	{
		"cabinet_id": 9,
		"cabinetname": 18
	},
	{
		"cabinet_id": 10,
		"cabinetname": 19
	},
	{
		"cabinet_id": 11,
		"cabinetname": 20
	},
	{
		"cabinet_id": 1,
		"cabinetname": 21
	},
	{
		"cabinet_id": 12,
		"cabinetname": 22
	},
	{
		"cabinet_id": 17,
		"cabinetname": 34
	}]
}
`````
Можно найти определенный кабинет по cabinet_id

````
select dictionary.cabinet_getall(15);
````

Ответ:

````
{
	"data": [
	{
		"cabinet_id": 15,
		"cabinetname": 22
	}]
}
````

### [class_upd.sql](functions%2Fclass_upd.sql)

Функия изменения или добавления класса

Пример заполнения:
````
select dictionary.class_upd('{
  "class_id": 4,
  "classname": "3"
}');
````
Ответ:
````
{"data": null}
````

### [class_getall.sql](functions%2Fclass_getall.sql)

Отображение информации в таблице, можно найти опредленный класс по его id или вывести все.

Примеры:
````
select dictionary.class_getall(3);
````
Ответ:
````
{
	"data": [
	{
		"class_id": 3,
		"classname": "2Б"
	}]
}
````
Вывод всех классов
````
select dictionary.class_getall(NULL);
````
Ответ:
````
{
	"data": [
	{
		"class_id": 1,
		"classname": "1"
	},
	{
		"class_id": 2,
		"classname": "2А"
	},
	{
		"class_id": 3,
		"classname": "2Б"
	},
	{
		"class_id": 5,
		"classname": "4"
	},
	{
		"class_id": 6,
		"classname": "5"
	},
	{
		"class_id": 7,
		"classname": "6"
	},
	{
		"class_id": 8,
		"classname": "7"
	},
	{
		"class_id": 9,
		"classname": "8"
	},
	{
		"class_id": 10,
		"classname": "9"
	},
	{
		"class_id": 11,
		"classname": "10"
	},
	{
		"class_id": 12,
		"classname": "11А"
	},
	{
		"class_id": 21,
		"classname": "11G"
	},
	{
		"class_id": 13,
		"classname": "11В"
	},
	{
		"class_id": 4,
		"classname": "3"
	}]
}
````
### [days_getall.sql](functions%2Fdays_getall.sql)

Получение информации о днях. 

Можно вывести все содержимое таблицы передав в аргумент NUll или найти опредленный по id


### [role_upd.sql](functions%2Frole_upd.sql)

Добавление новой роли для сотрудников
````
select dictionary.role_upd('{
  "rolename": "Охранник"
}');
````
Ответ:
````
{"data": null}
````
### [role_getall.sql](functions%2Frole_getall.sql)

Получение информации о ролях. 

Можно вывести все содержимое таблицы передав в аргумент NUll или найти опредленный по id

### [status_getall.sql](functions%2Fstatus_getall.sql)

Получение информации о статусах. 

Можно вывести все содержимое таблицы передав в аргумент NUll или найти опредленный по id

### [status_upd.sql](functions%2Fstatus_upd.sql)

Добавление нового статуса для сотрудников

````
select dictionary.status_upd('{
  "statusname": "Больничный"
}');
````

### [subject_getall.sql](functions%2Fsubject_getall.sql)

Получение информации о предметах. 

Можно вывести все содержимое таблицы передав в аргумент NUll или найти опредленный по id

### [subject_upd.sql](functions%2Fsubject_upd.sql)

Добавление нового предмета
````
select dictionary.subject_upd('{
  "subjectname": "ОБЖ"
}');
````