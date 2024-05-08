-- aqui se crea la base 
create database blog_db;

-- CREAMOS LAS TABLAS Y AGREGAMOS LOS REGISTROS
CREATE TABLE users (
  id serial PRIMARY KEY,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(50)
);

insert into users (first_name, last_name, email) values
('Juan', 'Perez', 'juanito@gmail.com'),
('Paola', 'Rodriguez', 'paola@gmail.com'),
('Claudia', 'Manzanero', 'claudia@gmail.com');

CREATE TABLE posts (
  id serial PRIMARY KEY,
  creator_id int references users(id),
  title varchar(50),
  text text
);

insert into posts (creator_id, title, text) values
('2', 'Informatica Actual', 'Vivamus sed rhoncus augue. Mauris elementum lacus sed cursus ornare. Curabitur tincidunt risus a leo efficitur bibendum. Etiam maximus condimentum orci vitae sagittis. Sed fringilla pulvinar ante at malesuada. Ut velit magna, feugiat nec sagittis interdum, interdum vel justo. Vivamus aliquet diam est, at venenatis justo vulputate et. Donec non felis convallis, cursus eros quis, varius ex. Vivamus vitae elit eu lectus finibus volutpat eu eget dolor. Quisque tempor egestas ex, vel sollicitudin lacus.'),
('1', 'Salud y Vida', 'Quisque tempus nulla vitae odio ullamcorper imperdiet. Nullam eget ipsum rutrum, volutpat felis et, finibus mi. Curabitur facilisis mattis lacus in malesuada. Morbi ac augue hendrerit ipsum egestas dictum. Duis luctus pretium magna, ac eleifend tortor sollicitudin ut. Suspendisse eu leo in enim porttitor aliquet. Nam non porttitor ipsum, rhoncus blandit nunc. Nullam sed mauris quis urna cursus pretium eu ultrices eros. Phasellus ullamcorper suscipit libero. Sed ut lacus at mauris mattis pretium. Phasellus nec arcu odio. Suspendisse tristique aliquet massa rhoncus laoreet. Vivamus rhoncus eros quis lacus iaculis sollicitudin. Etiam porta imperdiet augue sed tempus. Maecenas a pretium ipsum, et ornare lectus.'),
('3', 'Avances Tecnologicos', 'Vivamus sed rhoncus augue. Mauris elementum lacus sed cursus ornare. Curabitur tincidunt risus a leo efficitur bibendum. Etiam maximus condimentum orci vitae sagittis. Sed fringilla pulvinar ante at malesuada. Ut velit magna, feugiat nec sagittis interdum, interdum vel justo. Vivamus aliquet diam est, at venenatis justo vulputate et. Donec non felis convallis, cursus eros quis, varius ex. Vivamus vitae elit eu lectus finibus volutpat eu eget dolor. Quisque tempor egestas ex, vel sollicitudin lacus.'),
('2', 'Politica Actual', 'Vivamus sed rhoncus augue. Mauris elementum lacus sed cursus ornare. Curabitur tincidunt risus a leo efficitur bibendum. Etiam maximus condimentum orci vitae sagittis. Sed fringilla pulvinar ante at malesuada. Ut velit magna, feugiat nec sagittis interdum, interdum vel justo. Vivamus aliquet diam est, at venenatis justo vulputate et. Donec non felis convallis, cursus eros quis, varius ex. Vivamus vitae elit eu lectus finibus volutpat eu eget dolor. Quisque tempor egestas ex, vel sollicitudin lacus.'),
('1', 'Camino al Futuro', 'Nam et sapien dictum, pellentesque risus in, iaculis lectus. Praesent finibus neque non justo rhoncus imperdiet. Morbi mi urna, bibendum eget vestibulum nec, venenatis nec lacus. Proin ut dui odio. Nunc quis iaculis lorem. Etiam consectetur neque quis dui sollicitudin, sed tristique lacus facilisis. Mauris vel tellus elit. Duis auctor velit placerat velit feugiat auctor. Ut ullamcorper erat ac lacus luctus faucibus. Phasellus quis lectus sed sem egestas faucibus eu nec mi. Phasellus a risus vitae neque tempus blandit at a est. Donec sed interdum nunc.');


CREATE TABLE likes (
  id serial PRIMARY KEY,
  user_id int references users(id),
  post_id int references posts(id)
);

insert into likes (user_id, post_id) values
(1,5),
(1,2),
(3,1),
(3,4),
(2,3);

-- CREAMOS LAS CONSULTAS

SELECT * FROM posts inner join users
on posts.creator_id = users.id;

SELECT users.first_name,users.last_name,users.email, posts.title AS "Like Post"
FROM likes inner join posts
on likes.post_id = posts.id inner join users
on likes.user_id = users.id;


