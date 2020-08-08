USE ig_clone;

DELIMITER $$

CREATE TRIGGER prvent_self_follows 
	BEFORE INSERT ON follows FOR EACH ROW 
    BEGIN
		IF NEW.follower_id = NEW.followee_id
        THEN 
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'You are not allowed to follow yourself!';
		END IF;
	END;
$$

DELIMITER ;

INSERT INTO follows(follower_id, followee_id) VALUES(5,5);
INSERT INTO follows(follower_id, followee_id) VALUES(7,7);

DELIMITER $$

CREATE TRIGGER capture_unfollow 
	AFTER DELETE ON follows FOR EACH ROW 
    BEGIN
		INSERT INTO unfollows(follower_id, followee_id) VALUES(OLD.follower_id, OLD.followee_id);
	END;
$$

DELIMITER ;

SELECT * FROM unfollows;
SELECT * FROM follows LIMIT 5;
DELETE FROM follows WHERE follower_id = 2 AND followee_id = 1;

SHOW TRIGGERS;

