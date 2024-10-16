/*データベースの削除*/
DROP DATABASE IF EXISTS GameStock;
/*データベースの作成*/
CREATE DATABASE GameStock CHARACTER SET utf8 COLLATE utf8_general_ci;
/*ユーザーの削除*/
CREATE USER IF EXISTS User;
/*ユーザーの作成*/
CREATE USER User IDENTIFIED BY 'Game';
/*権限の付与*/
GRANT ALL PRIVILEGES ON GameStock.* TO 'User';
/*DBの選択*/
USE GameStock;
/*テーブルの作成*/
CREATE TABLE m_game(            
    game_id INT AUTO_INCREMENT,
    game_name VARCHAR(60) NOT NULL,
    maker VARCHAR(60) NOT NULL,    
    release_date DATE,
    item_code VARCHAR(60) NOT NULL,
    PRIMARY KEY(game_id)
    )ENGINE = InnoDB DEFAULT CHARSET = utf8;
    /*初期データの作成*/
INSERT INTO
    m_game(game_name,maker,release_date,item_code)
    VALUES
    ("ストリートファイター6","CAPCOM",'2023/06/02',"A01"),
    ("モンスターハンター2G","CAPCOM",'2008/03/28',"A04"),
    ("ペルソナ5","ATLAS",'2016/09/15',"B02"),
    ("ELDEN RING","FROMSOFTWARE",'2022/02/25',"C01"),
    ("DESTENY","バンジー",'2014/09/09',"D01");
 
    CREATE TABLE t_stock(            
    item_code VARCHAR(60),
    stock INT NOT NULL,
    price INT NOT NULL,
    ranking INT,
    PRIMARY KEY(item_code)
    )ENGINE = InnoDB DEFAULT CHARSET = utf8;
 
    INSERT INTO t_stock VALUES
    ("A01",8,6900,1),
    ("A04",1,500,4),
    ("B02",4,3000,3),
    ("C01",2,8000,2),
    ("D01",10,200,5);
 
ALTER TABLE m_game ADD FOREIGN KEY (item_code) REFERENCES t_stock(item_code);
 
CREATE TABLE m_login(            
    login_id VARCHAR(20),
    hash_pass  VARCHAR(32) NOT NULL,
    salt VARCHAR(100),
    hash_salt VARCHAR(200),
    PRIMARY KEY(login_id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
 
CREATE TABLE m_employee(            
    employee_id INT AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    age INT,
    post_code VARCHAR(20),
    PRIMARY KEY(employee_id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
 
INSERT INTO  
m_employee(name,age,post_code)
VALUES
    ("佐藤 健",39,"A"),
    ("鈴木 博",28,"B"),
    ("高橋 学",22,"C"),
    ("田中 恵一",33,"B"),
    ("山田 太郎",21,"D");
 
CREATE TABLE m_post(            
    post_code VARCHAR(20),
    post_name VARCHAR(32),
    PRIMARY KEY(post_code)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
 
INSERT INTO m_post VALUES
    ("A","店長"),
    ("B","リーダ"),
    ("C","アルバイト"),
    ("D","アルバイト研修生");