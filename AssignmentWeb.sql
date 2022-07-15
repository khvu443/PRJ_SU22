create table category
(
	Category_id nvarchar(50) NOT NULL primary key,
	Category_name nvarchar(50)
);

create table product
(
	Product_id nvarchar(50) NOT NULL primary key,
	image_product nvarchar(MAX),
	Name_product nvarchar(50),
	Category_id nvarchar(50) foreign key references category(Category_id),
	price int,
	DateCreate datetime,
	rating float,
	Stock bit
);

create table roleDetail
(
	RoleID nvarchar(50) NOT NULL primary key,
	Name_Role nvarchar(50),
);

create table account
(
	accID nvarchar(50) NOT NULL primary key,
	Username nvarchar(50),
	Pass nvarchar(50),
	FullName nvarchar(50),
	RoleID nvarchar(50) foreign key references roleDetail(RoleID),
	StatusAcc bit
);

create table [dbo].[OrderDetail]
(
	DOID nvarchar(50) NOT NULL foreign key references [dbo].[Order](OID),
	Product_id nvarchar(50) NOT NULL foreign key references product(Product_id),
	total float,
	CONSTRAINT PK_OrderDetail PRIMARY KEY (DOID, Product_id) 
);

create table [dbo].[Order]
(
	OID nvarchar(50) NOT NULL,
	accID nvarchar(50) foreign key references account(accID), 
	total float,
	DateOrder datetime,
	CONSTRAINT PK_ORDER PRIMARY KEY (OID) 
);


-- insert dữ liệu vào bảng
-- insert category
insert into category values ('C1', 'RPG')
insert into category values('C2', 'Sandbox')
insert into category values('C3', 'Hack & Slack')


-- insert product
insert into product values ('P0001', 'img/stardew_valley.png','Stardew Vally','C1',150000, GETDATE(), 5, 1)
insert into product values ('P0002', 'img/Minecraft.jpg','Minecraft','C2',18500, GETDATE(), 4.3, 1)
insert into product values ('P0003', 'img/Assassin_Creed_Odyssey.png','Assassin Creed Odyssey','C1',430000, GETDATE(), 4.6, 1)
insert into product values ('P0004', 'img/sim4.jpg','The sim4','C2',5000000, GETDATE(), 4, 1)
insert into product values ('P0005', 'img/Dead_cells.png','Dead cells','C3',500000, GETDATE(), 3.7, 1)
insert into product values ('P0006', 'img/Hades.jpg','Hades','C3',450000, GETDATE(), 3.5)
insert into product values ('P0007', 'img/The_Witcher.png','The Witcher 3: Wild Hunt','C1',455000, GETDATE(), 4.9, 1)
insert into product values ('P0008', 'img/Katana_Zero.png','Katana ZERO','C3',540000, GETDATE(), 3, 1)


--insert Role
insert into roleDetail values('R01', 'Admin')
insert into roleDetail values('R02', 'User')

insert into account values ('A01','admin', 'admin', 'Toan','R01', 'true')
insert into account values ('A02','TTB', '12345', 'Tran Thi B','R02', 'true')
insert into account values ('A03','NVA', '12345', 'Nguyen Van A','R02', 'true')
insert into account values ('A04','NVB', '12345', 'Nguyen Van B','R02', 'false')

select * from [dbo].[Order]






