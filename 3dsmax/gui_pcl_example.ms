rollout PC_vis "GUI pcl - example" width:185 height:150
(
	groupBox grp_pc "Point Cloud Vis." pos:[5,5] width:168 height:120
	
	editText edt_path         "path:" pos:[15,30] width:152 height:16
	spinner spn_sz_pc 		  "pt size" pos:[30,50] width:56 height:16 range:[0.001,0.1,0.03]  scale:1 
	
	button btn_plot			   "Plot point cloud" pos:[10,90] width:152 height:20
	


	--- on start ----------------------------------------------------------
	on PC_vis open do
	(
		edt_path.text = "..\data_pcl.mex_bin"; --ini path to the source of data
	)

	
	
	
	--- read data and plot ----------------------------------------------
	on btn_plot pressed do
	(
		fileIn "fce_pc.ms"
	    new_mesh = read_pc_file edt_path.text  spn_sz_pc.value --- read data
		--- be aware that new 3ds max verisions uses $Object001, so it needs to be changed
		newObj_transformInit $Object01 $Object01 [0,0,0] 
		$Object01.material = meditMaterials[7];  --- assign material
		
	)
	
	
)
	
	

CreateDialog PC_vis 