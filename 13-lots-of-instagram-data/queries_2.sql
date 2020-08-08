SELECT * FROM users 
ORDER BY created_at ASC 
LIMIT 5;

-- 2. Most Popular Registration Date
SELECT 
	DAYNAME(created_at) AS day, 
    COUNT(*) AS total 
FROM users 
GROUP BY day 
ORDER BY total DESC;

-- 3. Find users who have never posted a photo
SELECT * FROM users 
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- 4. Who got the most likes on a single photo
SELECT 
		users.username, 
        photos.image_url, 
        COUNT(*) AS total_likes 
FROM photos 
INNER JOIN likes ON photos.id = likes.photo_id 
INNER JOIN users ON photos.user_id = users.id
GROUP BY likes.photo_id 
ORDER BY total_likes DESC 
LIMIT 1;

-- 5. How many times does the average user post?
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_photos_per_user;

-- 6. What are the top 5 most commonly used hashtags?
SELECT 
	tags.tag_name,
    COUNT(*) AS total_times_tag_used
FROM photo_tags 
INNER JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY photo_tags.tag_id 
ORDER BY total_times_tag_used DESC
LIMIT 5;

-- 7. Find users who have liked every single photo.
SELECT 
	users.username,
    COUNT(*) AS num_likes 
FROM users 
INNER JOIN likes on users.id = likes.user_id 
GROUP BY likes.user_id 
HAVING num_likes = (SELECT COUNT(*) FROM photos);