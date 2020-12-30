/*USER TABLE*/
CREATE TABLE TB_USER(
	id int(10) AUTO_INCREMENT,
    user_company VARCHAR(4) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    user_pw VARCHAR(100) NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    user_birth datetime NOT NULL,
    user_gender enum('1','2') NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_img VARCHAR(100),
    user_status int(1) NOT NULL DEFAULT 0,
    primary key(id, user_id),
    unique(user_email)
);