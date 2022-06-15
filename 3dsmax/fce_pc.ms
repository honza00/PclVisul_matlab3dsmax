

	
	----------------------------------------------------------------------------------------------
	-- READ PC
	--- saved in binary : numpoints (int), dim (int,4), x,y,z,col
	--
	-- run i.e.:     new_mesh = read_pc_file edt_pc_path.text spn_sz_pc.value
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	fn read_pc_file filename sz =
	(
		-- init data --
		szd = sz*0.8
		vert_array = #()
		face_array = #()
		cols  = #()
		colsR  = #()
		colsG  = #()
		colsB  = #()
				
		in_file = fopen filename "rb"
		if in_file != undefined then (
			dim = ReadFloat  in_file
			num_pts  = ReadFloat  in_file
			num_tri  = ReadFloat  in_file
			
			cntv = 1
			cntf = 1
			for v = 1 to num_pts do (
				--- read pts from file
				dt1 = ReadFloat  in_file
				dt2 = ReadFloat  in_file
				dt3 = ReadFloat  in_file
				dt4 = ReadFloat  in_file
				dt5 = ReadFloat  in_file
				dt6 = ReadFloat  in_file

				--- create mesh from them
				vert_array[cntv+3] = [dt1+sz, dt2, dt3] --top of vert
				vert_array[cntv+0] = [dt1-sz, dt2+szd, dt3] --bottom
				vert_array[cntv+1] = [dt1-sz, dt2-szd, dt3+szd] --bottom
				vert_array[cntv+2] = [dt1-sz, dt2-szd, dt3-szd] --bottom
				
				face_array[cntf+0] = [cntv+0, cntv+1, cntv+2]
				face_array[cntf+1] = [cntv+0, cntv+2, cntv+3]
				face_array[cntf+2] = [cntv+0, cntv+3, cntv+1]
				face_array[cntf+3] = [cntv+1, cntv+3, cntv+2]
				
				--- read colors ---
				 for c=cntv to cntv+3 do (
					colsR[c] = dt4
					colsG[c] = dt5
					colsB[c] = dt6
				 )
				 --- move counters...
				cntv = cntv+4
				cntf = cntf+4
			)
		   fclose in_file
		   format " ...readed % points from %\n" num_pts in_name
		)
		else(
			format " ...input file cannot be read\n"
		)
		new_mesh = mesh vertices:vert_array faces:face_array
		
		--- COLORS ---
		setNumCPVVerts new_mesh new_mesh.numverts
		defaultVCFaces new_mesh
		for v = 1 to new_mesh.numVerts do(
			newColor = (color (colsR[v])   (colsG[v])   (colsB[v]) )
			setVertColor new_mesh v newColor;   -- apply vertex color
		)
		new_mesh.showVertexColors = true;
		new_mesh.vertexColorsShaded = true;	--false
		update new_mesh;
	    format " ...color assigned to % verts\n" new_mesh.numVerts
	)
	
	
	--- if transformation needed
	fn newObj_transformInit obj pivot_obj pos =
	(
		obj.pivot = pivot_obj.center
		move obj pos
		rot_box = eulerangles 90 180 0
		rotate obj rot_box 
		scale obj [10,10,10]
		--- rotation
		--if  rot!=0  then (
		--	rot_box = eulerangles 0 0 rot
		--	at time 300 animate on rotate obj rot_box
		--)
	)
	



	
	
	
	