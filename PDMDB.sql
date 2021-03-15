select pjm.id_project, pj.project_name, pm.pmdl_name, pm.pmdl_pn, pm.pmdl_product_stage, pm.pmdl_customer_mdl_no
, pjm.pjm_type
, m.user_name, m.user_logon
, s.dt_expire_user
from pdmdb.dbo.real_cdpj_project_member pjm with(nolock)
left join acctondb.dbo.project pj with(nolock)
on pj.id_project=pjm.id_project
left join pdmdb.dbo.real_cdpj_project_model pm with(nolock)
on pm.id_project_model = pjm.id_project_model
left join acctondb.dbo.wf_signer_group_m m with(nolock)
on m.id_wf_signer_group_m=pjm.id_pjm
left join acctondb.dbo.wf_signer s with(nolock)
on s.id_wf_signer=m.id_wf_signer_hp
where pjm.id_project_model <> 0 -- by Model 
