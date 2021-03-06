DELETE FROM comments
WHERE id = $1;

SELECT posts.title, posts.content, posts.created_at, writers.username, writers.profile_pic, comments.comment_body, comments.created_at 
FROM posts 
JOIN writers ON writers.id = posts.writer_id
JOIN comments ON comments.post_id = posts.id AND comments.commentor_id = posts.writer_id
WHERE comments.id = $1 AND posts.id = comments.post_id;