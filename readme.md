# Point Cloud Visualization

![example_output.jpg](https://bitbucket.org/repo/de64e8/images/2954077050-example_output.jpg)

We provide code for visualization of the point cloud (pcl) data in **matlab** and its export to **3ds max**. In 3ds max, data are read using a provided easy-to-use gui script. This provides possibilities to set up camera, lights, cast shadows or use any post processing you can imagine by just a click.

When you use the code, please always cite: [A. Martinovic and J. Knopp and H. Riemenschneider and L. Van Gool: *3D All The Way: Semantic Segmentation of Urban Scenes From Start to End in 3D*, CVPR 2015](http://www.cv-foundation.org/openaccess/content_cvpr_2015/papers/Martinovic_3D_All_The_2015_CVPR_paper.pdf)


## Disclaimer
THIS CODE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. Use at your own risk.

## Matlab

We provide ```demo.m``` matlab code that reads a point-cloud with different kind of labeling. There are three types of pcl labeling that are directly visualized:

1. **rgb:** RGB color in [3XN] normalized to 0-255.

2. **prb:** probability map in [1XN], unnormalized.

3. **lindex:** index that is converted into a RGB. Dimension is [1XN].

When you execute *demo.m*, the code produces the following result:

![matlab_pcl+res.png](https://bitbucket.org/repo/de64e8/images/241974124-matlab_pcl+res.png)

## 3ds max

We also share code to export colored matlab point cloud into 3ds Max and visualize it. In other words, it works like **Matlab to 3ds max visualization tool**. 3ds Max is a modeling/animating/rendering tool that is free for students with millions of features. Despite its complexity, this code allows you to visualize pcl (pre-processed matlab) without any kind of knowledge of 3ds using only a couple of mouse clicks. You can also easily cast shadows, set lights, or use any kind of post-processing effects such as depth-of-field etc.

### Export from matlab

3ds typically visualizes meshes, while we want to show only points. Thus, we need to create a mesh-like structure from the pcl. Instead of doing it in matlab, we export the positions of 3D points together with their color. In 3ds Max, we create a small 3D pyramid around each point. In matlab, pcl data can be exported using:

```
#!matlab
io_save_data3dsmax(outputFile,pts,[],rgb,'center',0);
```
as shown in ```demo.m```.

### Running

Data from 3ds Max can be found in the directory *3dsmax*. Once you export it in binary format, you can run the provided max-script in 3ds Max to visualize it. First, 3ds Max can run directly by double-click on ```scene.max```. Second, run maxScript,

![2run_script.jpg](https://bitbucket.org/repo/de64e8/images/1801262776-2run_script.jpg)

and select ```gui_pcl_example.ms```. Which runs the gui,

![3ds_gui.jpg](https://bitbucket.org/repo/de64e8/images/1409240673-3ds_gui.jpg)

Input is path to the exported binary file and size of the point. Now you can press **Plot point cloud** and the result in 3ds max scene should be,

![3ds_scene.jpg](https://bitbucket.org/repo/de64e8/images/4164454897-3ds_scene.jpg)

and this allows to render the following image with shadows etc.

![3ds_render.jpg](https://bitbucket.org/repo/de64e8/images/4137924192-3ds_render.jpg)

### Possible problems
Code runs without problems in 3ds Max 2009. In other versions, it may require to run GUI twice, so that included scripts will be read.

Also, in some versions of 3ds Max, *ReadFloat* shoud be changed to *ReadLong* in ```fce_vis.ms```.