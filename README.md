# lesson3

Users managament
==

- Generate new rails app
- Generate user model with (name: string, role: integer(enum))
- Should be two user roles `admin` and `user`
- Admin should be able to CRUD other users and admin (scaffold)
- User with role `user` should be able to see only welcome page
- Use device gem for authentication

# Difficulties
 логичный конфликт devise vs scaffold  сгенерировались одни и те же модели. нужно было переименовать models/user.rb и 
 закоментировавать в routes.rb "devise_for :users" иначе scaffold не добавлялся и вылетал с ошибкой (потом вернула обратно
 , удалила юзера созданого скаффолдом). 
 
 совпали некоторые роуты девайса и скаффолда (users/sign_in и users/:id) пришлось добавить кастомный path("auth") для
 роутов девайса, дальше попрвить хелперы урлов девайса (помогали ошибки при рендере).
 
 переписала миграцию скаффолда, так, чтобы оно добавляла одно только поле в уже созданную девайсом таблицу (скаффолд 
 предлагал свою таблицу юзеров).
 
 было бы легче использовать только девайс, а CRUD методы сделать самой (но делала по заданию).
 
 при подключении gem bootstrap выпала ошибка "Autoprefixer doesn’t support Node v4.2.6. Update it." добавила gem "mini-racer".
 
 

# Home page
![Home page](https://preview.ibb.co/c8rF3L/1.png)

# CRUD page
![CRUD page](https://preview.ibb.co/mRG1Sf/2.png)

# Create user page
![Create user page](https://preview.ibb.co/k4037f/3.png)
