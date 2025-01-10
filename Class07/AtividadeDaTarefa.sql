--) Criando novo esquema

create schema tarefas;

--) setando schema
set schema 'tarefas';

--) criando a tabela users
create table users(
	user_id int primary key,
	username varchar(50),
	email varchar(100),
	password_hash varchar(255)
);

--) inserindo na tabela users
insert into users
values
	(1,'Usuario01','Usuario01@gmail.com','1234'),
	(2,'Usuario02','Usuario02@gmail.com','1234'),
	(3,'Usuario03','Usuario03@gmail.com','1234'),
	(4,'Usuario04','Usuario04@gmail.com','1234'),
	(5,'Usuario05','Usuario05@gmail.com','1234');

--) criando a tabela boards
create table boards(
	board_id int,
	created_by int,
	name varchar(100),
	description_text varchar(50),
	primary key (board_id),
	foreign key (created_by) references users(user_id)
);

--) inserindo na tabela boards
insert into boards
values
	(1,2,'Estudos Faculdade','Estudos para a faculdade de ES'),
	(2,3,'Estudos Curso','Estudos para o curso de Front-End'),
	(3,4,'Trabalho','Trabalho de Banco de Dados'),
	(4,5,'Entregas','Entregas do semestre'),
	(5,5,'Lazer','Atividades de lazer para realizar');

--) criando a tabela lists
create table lists(
	list_id int,
	board_id int,
	name varchar(100),
	position int,
	primary key(list_id),
	foreign key (board_id) references boards(board_id)
);

--) inserindo na tabela lists
insert into lists
values
	(1,1,'Aplicação de Requesitos',3),
	(2,5,'Passear com o cachorro',5),
	(3,1,'Estudar sobre diagramas',1),
	(4,2,'Estudar sobre HTML e CSS',2),
	(5,4,'Estudar SQL',4);

--) criando a tabela cards
create table cards(
	card_id int,
	list_id int,
	title varchar(100),
	description_text varchar(50),
	position int,
	due_date date,
	assigned_to int,
	primary key(card_id),
	foreign key(list_id) references lists (list_id),
	foreign key(assigned_to) references users(user_id)
);

insert into cards
values
	(1,1,'Estudar tópicos 3 e 4 de Requesitos','Revisar tópicos 3 e 4',1,'2025-01-12'),
	(2,2,'Passear com o Ralf','Passear no parque com o Ralf',5,'2025-01-13'),
	(3,3,'Estudar diagramas ER','Revisar tópicos de diagramas ER',3,'2025-01-14'),
	(4,4,'Estudar front end','Revisar tópicos de Front End',2,'2025-01-15'),
	(5,5,'Estudar sobre SQL','Revisar comandos DLL e DML',4,'2025-01-16');
	
--) criando a tabela comments
create table comments(
	comment_id int,
	card_id int,
	user_id int,
	content_text varchar(50),
	primary key(comment_id),
	foreign key (user_id) references users(user_id),
	foreign key (card_id) references cards(card_id)
);

--) Adicionando valores na tabela comments
insert into comments
values
	(1,1,1,'Melhorar os estudos'),
	(2,2,2,'Comprar mais brinquedos pro Ralf'),
	(3,3,3,'Comprar um livro de diagramas para estudos'),
	(4,4,4,'Estudar microserviços é importante'),
	(5,5,5,'Estudar mais sobre comandos SQL');

--) tentando incluir uma tupla com id duplicado em users
select * from users;
insert into users
values
(1,'Usuario06','Usuario06@gmail.com',1234);

--) ERRO:  duplicar valor da chave viola a restrição de unicidade "users_pkey"
--)SQL state: 23505
--) Detail: Chave (user_id)=(1) já existe

--) tentando excluir um quadro
select * from boards;
delete from users where user_id = 5;
--) ERRO:  atualização ou exclusão em tabela "users" viola restrição de chave estrangeira "boards_created_by_fkey" em "boards"
--) SQL state: 23503
--) Detail: Chave (user_id)=(5) ainda é referenciada pela tabela "boards"