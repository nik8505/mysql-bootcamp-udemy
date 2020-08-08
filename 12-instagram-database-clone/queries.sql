CREATE DATABASE instagram;
USE instagram;

CREATE TABLE users (
	id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id)
);

INSERT INTO users (username) VALUES('BlueTheCat'), ('CharlieBrown'), ('ColtSteele');

CREATE TABLE photos (
	id INT NOT NULL AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY(user_id) REFERENCES users(id) --  ON DELETE CASCADE
);

INSERT INTO photos (image_url, user_id) 
VALUES
	('/adlflsad', 1),
	('/lhfdwias', 2),
	('/askfwdiu', 2);
    
SELECT photos.image_url, users.username FROM photos 
JOIN users ON photos.user_id = users.id;

CREATE TABLE comments (
	id INT NOT NULL AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY(user_id) REFERENCES users(id), --  ON DELETE CASCADE
    FOREIGN KEY(photo_id) REFERENCES photos(id) --  ON DELETE CASCADE
);

INSERT INTO comments(comment_text, user_id, photo_id)
VALUES 
	('Meow!', 1, 2),
	('Amazing Shot!',3, 2),
	('I <3 This', 2, 1);
    

CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id), --  ON DELETE CASCADE
    FOREIGN KEY(photo_id) REFERENCES photos(id), --  ON DELETE CASCADE
    PRIMARY KEY(user_id, photo_id)
);

INSERT INTO likes (user_id, photo_id) 
VALUES
	(1, 1),
	(2, 1),
	(1, 2),
	(1, 3),
	(3, 3);
    
CREATE TABLE follows (
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id), --  ON DELETE CASCADE
    FOREIGN KEY(followee_id) REFERENCES users(id), --  ON DELETE CASCADE
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id) 
VALUES 
	(1, 2),
	(1, 3),
	(3, 1),
	(2, 3);
    
CREATE TABLE tags (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
	photo_id INT NOT NULL,
	tag_id INT NOT NULL,
	FOREIGN KEY(photo_id) REFERENCES photos(id), --  ON DELETE CASCADE
	FOREIGN KEY(tag_id) REFERENCES tags(id), --  ON DELETE CASCADE
    PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO tags(tag_name) 
VALUES 
	('adorable'),
	('cute'),
	('sunrise');
    
INSERT INTO photo_tags(photo_id, tag_id) 
VALUES 
	(1, 1),
	(1, 2),
	(2, 3),
	(3, 2);