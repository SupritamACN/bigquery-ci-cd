CREATE OR REPLACE VIEW
  `<project_id>.stackoverflow.view_count` OPTIONS( description="the counts of posts more than 10" ) AS
SELECT
  COUNT(votes.vote_type_id) AS count,
  votes.vote_type_id AS Ttype_id
FROM
  `bigquery-public-data.stackoverflow.votes` AS votes,
  `bigquery-public-data.stackoverflow.posts_questions` AS posts
WHERE
  votes.post_id = posts.id
  AND votes.vote_type_id > 10
GROUP BY
  votes.vote_type_id
ORDER BY
  votes.vote_type_id DESC
