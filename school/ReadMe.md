# СХЕМА school

[students.sql](tables%2Fstudents.sql)

Таблица, в которой хранятся данные о учениках

[TimeLesson.sql](tables%2FTimeLesson.sql)

Таблица, в которой храниться расписание уроков 

[journal.sql](tables%2Fjournal.sql)

Таблица, в которой храняться оценки учеников 

[employees.sql](tables%2Femployees.sql)

Таблица, в которой храняться данные о сотрудниках

[archive.sql](tables%2Farchive.sql)

Таблица, в которой храняться ученики закончившие школу  


[employees_get.sql](functions%2Femployees_get.sql)

Функция для поиска сотрудника по: id,  или роли 

При передаче NULL в аргументы функции, выводятся все сотруники
````
select school.employees_get(NULL,'89776542312', NULL)
````
Ответ:
````
{
	"data": [
	{
	    "surname": "Смирнов",
	    "name": "Валентин",
	    "patronymic": "Иванович",
		"dob": "1995-10-19",
		"phone": "89776542312",
		"gender": "M",
		"salary": 90000.00,
		"curator": null,
		"id_role": 1,
		"status_id": 1,
		"employees_id": 3,
		"subjectteach": null
	}]
}
````

### [employees_upd.sql](functions%2Femployees_upd.sql)

Функция для добавления сотрудников
Пример:
````
select school.employees_upd('{
        "surname": "Макаров",
  "name": "Макар",
          "patronymic":"Леонидович",
  "gender": "M",
          "dob": "1999-03-02",
  "phone": "99988877765",
          "id_role": 4,
  "curator": 2,
          "salary": 60000.00,
  "status_id": 1,
          "subjectteach": 7
}',24);
````

Ответ:
````
{
	"data": null
}
````