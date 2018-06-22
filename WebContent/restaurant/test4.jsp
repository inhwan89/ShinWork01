<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-6">
    
    <br/>
   <div id="myCarousel" class="carousel slide" data-interval="0">
       <!-- Indicators -->
       <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
         <li data-target="#myCarousel" data-slide-to="3"></li>
         <li data-target="#myCarousel" data-slide-to="4"></li>
       </ol>
   
       <!-- Wrapper for slides -->
       <div class="carousel-inner" role="listbox">
         <div class="item active">
         <div class = "file_input" style = "width:100%; overflow: hidden;">
           <label class = "accommodation_img" style = "width:100%;"> 
              <img class="w3-image" src="./imgs/upload_pic.png" alt="The Hotel" style="width:100%; min-height: 200px; max-height: 450px; overflow:hidden">
              <input type="file" name = "attfile1" onchange="readURLM(this)">
           </label>
         </div>
         </div>
   
         <div class="item">
           <div class = "file_input">
           <label class = "accommodation_img" style = "width:100%"> 
              <img class="w3-image" src="./imgs/upload_pic.png" alt="The Hotel" style="width:100%; min-height: 200px; max-height: 450px; overflow:hidden">
              <input type="file" name = "attfile2" onchange="readURLM(this)">
           </label>
          </div>
         </div>
       
         <div class="item">
          <div class = "file_input">
           <label class = "accommodation_img" style = "width:100%"> 
              <img class="w3-image" src="./imgs/upload_pic.png" alt="The Hotel" style="width:100%; min-height: 200px; max-height: 450px; overflow:hidden">
              <input type="file" name = "attfile3" onchange="readURLM(this)">
           </label>
          </div>
         </div>
         
         <div class="item">
          <div class = "file_input">
           <label class = "accommodation_img" style = "width:100%"> 
              <img class="w3-image" src="./imgs/upload_pic.png" alt="The Hotel" style="width:100%; min-height: 200px; max-height: 450px; overflow:hidden">
              <input type="file" name = "attfile4" onchange="readURLM(this)">
           </label>
         </div>  
         </div>
         
         <div class="item">
          <div class = "file_input">
           <label class = "accommodation_img" style = "width:100%"> 
              <img class="w3-image" src="./imgs/upload_pic.png" alt="The Hotel" style="width:100%; min-height: 200px; max-height: 450px; overflow:hidden">
              <input type="file" name = "attfile5" onchange="readURLM(this)">
           </label>
         </div>     
         </div>
       </div>
   
       <!-- Left and right controls -->
       <a class="left carousel-control" href="#myCarousel" data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left" ></span>
         <span class="sr-only">Previous</span>
       </a>
       <a class="right carousel-control" href="#myCarousel" data-slide="next">
         <span class="glyphicon glyphicon-chevron-right"></span>
         <span class="sr-only">Next</span>
       </a>
   </div>
   <br>
   </div>
   
   <div class="col-sm-6" id = "col_imgs">
   <br/>
   <span id = 'h3'> 객실 등록하기:</span>
   
   <div class="input-group">
      <span class="input-group-addon">방종류</span>
      <input type="text" class="form-control" name="room">
   </div>
   <div class="input-group">
      <span class="input-group-addon">방개수</span>
      <input type="text" class="form-control" name="room_num">
   </div>
           
   <div class="input-group">
      <span class="input-group-addon">평일가</span>
      <input  type="text" class="form-control" name="weekdays">
   </div>
   <div class="input-group">
      <span class="input-group-addon">주말가</span>
   <input  type="text" class="form-control" name="weekends">
   </div>
      <button type="button" class="btn btn-primary btn-block" onclick = 'add(this)'>추가</button>
   </div>
   </div>
   </div>
</body>
</html>