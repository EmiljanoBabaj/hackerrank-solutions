
/*
We need to return a ordered list of nodes and their type from a Binary tree
We have a table with two columns:
    N Value of Node (Integer),
    P Parent of the node.
*/

SELECT N, CASE WHEN P IS NULL THEN 'Root' --if parent is null then the type is root
WHEN(
    SELECT COUNT(*) FROM BST WHERE P = A.N) > 0 --subquery to check if another node has as parent the value of the current node
    THEN 'Inner' --if yes then its a inner node
    ELSE 'Leaf' --if no then its a leaf
    END
FROM BST A
ORDER BY N; --We order by value