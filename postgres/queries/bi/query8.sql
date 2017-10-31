-- Top competitors.  Mentioned in reply when not in org and org has tag

select
  t_name,
  count(*) as cnt from post ps,
  post rep,
  post_tag,
  tag
where rep.ps_replyof = ps.ps_postid
  and exists (
    select 1 from post_tag, tag
    where pst_postid = ps.ps_postid
     and pst_tagid = t_tagid
     and t_name = '--1--'
  )
  and not exists (
    select 1 from post_tag, tag
    where pst_postid = rep.ps_postid
      and pst_tagid = t_tagid
      and t_name = '--1--'
    )
  and pst_postid = rep.ps_postid
  and t_tagid = pst_tagid
group by t_name
order by
  cnt desc,
  t_name asc
limit 100;
