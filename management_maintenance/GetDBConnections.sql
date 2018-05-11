/*-- Retuns all active connections for the Selected Database--*/

SELECT  des.program_name
      , des.login_name
      , des.host_name
      , COUNT(des.session_id) [Connections]
FROM    sys.dm_exec_sessions des
INNER JOIN sys.dm_exec_connections DEC
        ON des.session_id = DEC.session_id
WHERE   des.is_user_process = 1
        AND des.status != 'running'
GROUP BY des.program_name
      , des.login_name
      , des.host_name
HAVING  COUNT(des.session_id) > 2
ORDER BY COUNT(des.session_id) DESC
